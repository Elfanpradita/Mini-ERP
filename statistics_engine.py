import pandas as pd
from models import Transaction
from extensions import db

def get_statistics_data():
    # 1. Ambil data dari DB
    query = db.session.query(Transaction.tanggal, Transaction.jenis, Transaction.amount).all()
    
    # Kalo DB Kosong, return None (Nanti HTML bakal nampilin "Data Belum Cukup")
    if not query:
        return None

    # 2. Olah Data pakai Pandas
    df = pd.DataFrame(query, columns=['tanggal', 'jenis', 'amount'])
    df['tanggal'] = pd.to_datetime(df['tanggal'])
    df['bulan'] = df['tanggal'].dt.to_period('M')
    
    monthly_data = df.groupby(['bulan', 'jenis'])['amount'].sum().unstack(fill_value=0)
    
    if 'debet' not in monthly_data.columns: monthly_data['debet'] = 0
    if 'kredit' not in monthly_data.columns: monthly_data['kredit'] = 0
    
    monthly_data = monthly_data.sort_index().tail(12)

    data = {
        'labels': [str(p) for p in monthly_data.index],
        'income': monthly_data['debet'].tolist(),
        'expense': monthly_data['kredit'].tolist(),
        'net': (monthly_data['debet'] - monthly_data['kredit']).tolist()
    }
    
    data['total_income'] = df[df['jenis'] == 'debet']['amount'].sum()
    data['total_expense'] = df[df['jenis'] == 'kredit']['amount'].sum()
    data['current_balance'] = data['total_income'] - data['total_expense']
    
    return data