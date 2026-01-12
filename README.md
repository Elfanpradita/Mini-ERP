# MINI ERP INTEGRATED SYSTEM (FINANCE & HR)

Sistem Informasi Manajemen Terintegrasi (Mini ERP) berbasis Web untuk mengelola Keuangan (*Cashflow*) dan Sumber Daya Manusia (*Payroll*) pada skala UKM. Proyek ini dikembangkan sebagai bagian dari **Laporan Magang**.

---

## 👤 Identitas Pengembang

**Nama** : Elfan Pradita Rusmin

**NIM** : 20230801068

**Program Studi** : Ilmu Komputer - Teknik Informatika

**Semester** : 5

---

## 🚀 Fitur Utama

1. **Keuangan (Finance)**
* Input Transaksi Manual (Debet/Kredit).
* **AI Scan Receipt:** Input transaksi otomatis dari foto struk/bon menggunakan **Google Gemini AI**.
* **Smart Dashboard:** Visualisasi grafik statistik (Chart.js) untuk tren arus kas & profit real-time.
* Laporan Keuangan PDF.


2. **Kepegawaian (HR & Payroll)**
* Manajemen Data Karyawan (CRUD) dengan fitur *Search & Sort*.
* Perhitungan Gaji Otomatis (Harian, Lembur, Insentif).
* Cetak Slip Gaji (Payslip) format PDF.


3. **Keamanan & Audit**
* **Role-Based Access Control:** Super Admin (IT), Admin (Manager), User (Staff).
* **Activity Logs:** Audit trail untuk memantau aktivitas user (siapa melakukan apa).
* **Auto-Cleanup:** Penghapusan otomatis file struk sementara untuk menghemat penyimpanan server.



---

## 🛠️ Teknologi yang Digunakan

* **Backend:** Python (Flask Framework).
* **Database:** MySQL 8.0.
* **Infrastructure:** Docker & Docker Compose.
* **Artificial Intelligence:** Google Gemini API (untuk OCR & Ekstraksi Data).
* **Frontend:** HTML5, CSS3 (Bootstrap 5), Chart.js.
* **Reporting:** ReportLab (PDF Generator).

---

## 📋 Prasyarat (Prerequisites)

Sebelum menjalankan aplikasi, pastikan komputer Anda telah terinstal:

1. **Git** (untuk clone repository).
2. **Docker Desktop** (Wajib, karena aplikasi berjalan di container).
3. **Koneksi Internet** (Diperlukan untuk fitur AI Gemini).

---

## ⚙️ Cara Instalasi & Menjalankan (Step-by-Step)

Ikuti langkah-langkah berikut untuk menjalankan proyek di komputer lokal:

### 1. Clone Repository

Buka terminal (CMD/PowerShell/Terminal) dan jalankan perintah:

```bash
git clone https://github.com/Elfanpradita/Mini-ERP.git
cd Mini-ERP

```

### 2. Konfigurasi Environment Variable

Duplikasi file `.env.example` menjadi `.env`.

**Di Windows (Command Prompt):**

```cmd
copy .env.example .env

```

**Di Mac/Linux:**

```bash
cp .env.example .env

```

Buka file `.env` yang baru dibuat menggunakan Text Editor (Notepad/VS Code), lalu isi konfigurasi berikut (terutama API Key Gemini):

```ini
# Konfigurasi Database (Biarkan default jika pakai Docker)
DATABASE_URL=mysql+pymysql://user:password@db/auth_db

# Kunci Keamanan Flask
SECRET_KEY=rahasia_super_aman_123

# Konfigurasi Super Admin Awal
SUPER_ADMIN_USER=admin
SUPER_ADMIN_PASS=admin123

# [PENTING] Masukkan API Key Google Gemini Anda di sini
# Dapatkan gratis di: https://aistudio.google.com/app/apikey
GEMINI_API_KEY=AIzaSyDxxxxxxxxxxxxxxxxxxxxxxxxxxxx

```

### 3. Jalankan Aplikasi dengan Docker

Jalankan perintah berikut untuk membangun dan menyalakan server:

```bash
docker-compose up -d --build

```

*Tunggu beberapa saat hingga proses download dan instalasi selesai.*

### 4. Setup Database & Akun Admin

Setelah container berjalan, kita perlu membuat akun Super Admin pertama kali. Jalankan perintah ini di terminal:

```bash
docker-compose exec web flask create-superadmin

```

*(Jika muncul pesan "Superadmin dibuat: admin", berarti sukses).*

### 5. Akses Aplikasi

Buka browser (Chrome/Edge) dan akses alamat berikut:

* **URL:** `http://localhost`
* **Username:** `admin` (atau sesuai yang diisi di .env)
* **Password:** `admin123` (atau sesuai yang diisi di .env)

---

## 📂 Struktur Proyek

Berikut adalah gambaran singkat struktur file dalam proyek ini:

```
├── app.py                 # File utama aplikasi (Routes & Logic)
├── models.py              # Definisi Tabel Database (User, Employee, Transaction)
├── utils_ai.py            # Modul integrasi ke Google Gemini AI
├── statistics_engine.py   # Modul pengolahan data grafik statistik
├── docker-compose.yml     # Konfigurasi Container Docker
├── requirements.txt       # Daftar pustaka Python yang digunakan
├── templates/             # File HTML (Frontend)
│   ├── dashboard.html     # Tampilan Dashboard Utama
│   ├── finance_*.html     # Tampilan Modul Keuangan
│   └── payroll_*.html     # Tampilan Modul Gaji
└── static/uploads/        # Folder sementara upload gambar (Auto-clean)

```

---

## ❓ Troubleshooting (Kendala Umum)

**1. Port 80 bentrok (Address already in use)**
Jika Anda tidak bisa menjalankan Docker karena Port 80 terpakai, ubah file `docker-compose.yml` pada bagian `ports`:

```yaml
ports:
  - "8080:80"  # Ubah angka depan jadi 8080

```

Lalu akses di `http://localhost:8080`.

**2. Scan AI Gagal**
Pastikan `GEMINI_API_KEY` di file `.env` sudah diisi dengan benar dan komputer terkoneksi internet.

**3. Database Error saat pertama kali**
Coba reset ulang container dengan perintah:

```bash
docker-compose down -v
docker-compose up -d --build

```

---

© 2026 Elfan Pradita Rusmin.

*Disusun untuk Laporan Kerja Praktik / Magang.*