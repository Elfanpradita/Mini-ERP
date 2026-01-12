import os
import json
import re
from google import genai
from google.genai import types
import PIL.Image
from google.oauth2 import service_account
from googleapiclient.discovery import build

def configure_gemini():
    """
    Mengonfigurasi Client Gemini menggunakan SDK baru (google-genai).
    """
    api_key = os.getenv("GEMINI_API_KEY")
    if api_key:
        return genai.Client(api_key=api_key)
    return None

def extract_receipt_data(image_path, client):
    """
    Mengirim gambar ke Gemini dan meminta output JSON.
    """
    if not client: 
        return None, "Gemini API Key missing or Client not initialized"
    
    prompt = """
    Analisa gambar struk/bon ini.
    Extract data dalam format JSON murni: 
    { "tanggal": "YYYY-MM-DD", "total": number_only, "merchant": "nama_toko" }
    
    Aturan:
    1. Jika tanggal tidak jelas, gunakan tanggal hari ini.
    2. Total ambil nominal terbesar/grand total.
    3. Output HANYA JSON, tanpa markdown ```json ```.
    """
    
    try:
        # Buka gambar menggunakan Pillow
        image = PIL.Image.open(image_path)
        
        # --- PERBAIKAN DI SINI ---
        # Kita gunakan versi spesifik 'gemini-1.5-flash-002' agar lebih stabil
        # Jika masih gagal, bisa coba 'gemini-1.5-flash-001' atau 'gemini-1.5-pro'
        model_name = 'gemini-flash-latest' 
        
        response = client.models.generate_content(
            model=model_name,
            contents=[prompt, image]
        )
        
        text = response.text.strip()
        
        # Bersihkan format JSON jika ada markdown
        clean_text = text.replace('```json', '').replace('```', '').strip()
        
        # Parse JSON
        try:
            data = json.loads(clean_text)
            return data, None
        except json.JSONDecodeError:
            # Fallback jika output bukan JSON sempurna
            return None, f"Gagal parse JSON. Raw: {text}"
            
    except Exception as e:
        # Menangkap error spesifik dan menampilkannya
        return None, str(e)

def append_to_sheet(data_row):
    """
    Fungsi ini tetap menggunakan library lama untuk Google Sheets
    """
    service_file = os.getenv("GOOGLE_SERVICE_FILE")
    sheet_id = os.getenv("SPREADSHEET_ID")
    
    if not service_file or not os.path.exists(service_file): 
        return False, "Service file not found"
    
    try:
        creds = service_account.Credentials.from_service_account_file(
            service_file, scopes=['https://www.googleapis.com/auth/spreadsheets'])
        service = build('sheets', 'v4', credentials=creds)
        
        body = {'values': [data_row]}
        service.spreadsheets().values().append(
            spreadsheetId=sheet_id, range='Sheet1!A1',
            valueInputOption='USER_ENTERED', insertDataOption='INSERT_ROWS',
            body=body).execute()
        return True, "Success"
    except Exception as e:
        return False, str(e)