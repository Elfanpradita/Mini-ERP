import os
import time
from sqlalchemy import or_
from io import BytesIO
from flask import Flask, render_template, request, redirect, url_for, flash, session, abort, Response
from flask_migrate import Migrate
from extensions import db, bcrypt, login_manager 
from models import User, Employee, Payroll, Transaction, ActivityLog

# --- [IMPORT WAJIB] ---
# Pastikan 2 baris ini ada:
from utils_ai import configure_gemini, extract_receipt_data   # <-- UNTUK AI
from statistics_engine import get_statistics_data             # <-- UNTUK STATISTIK
# ----------------------

from flask_login import login_user, logout_user, login_required, current_user
from werkzeug.utils import secure_filename
from datetime import datetime
from sqlalchemy import create_engine, text, func
from sqlalchemy.engine.url import make_url
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
from reportlab.lib.units import cm

app = Flask(__name__)
# ... (Config lainnya tetap sama) ...

app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'rahasia123')
raw_db_url = os.getenv('DATABASE_URL')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['UPLOAD_FOLDER'] = 'static/uploads'

# --- FUNGSI LOGGING OTOMATIS ---
def log_activity(action, details):
    if current_user.is_authenticated:
        try:
            log = ActivityLog(
                user_id=current_user.id,
                action=action,
                details=details
            )
            db.session.add(log)
            # Kita tidak commit di sini, ikut commit transaksi utama
        except Exception as e:
            print(f"Gagal mencatat log: {e}")

# --- AUTO FIX DB ---
def configure_and_create_db():
    if not raw_db_url: return
    try:
        url_obj = make_url(raw_db_url)
        db_name = url_obj.database or 'auth_db'
        final_db_url = raw_db_url
        if not url_obj.database:
            if '?' in raw_db_url:
                base, query = raw_db_url.split('?', 1)
                final_db_url = f"{base.rstrip('/')}/{db_name}?{query}"
            else:
                final_db_url = f"{raw_db_url.rstrip('/')}/{db_name}"
        app.config['SQLALCHEMY_DATABASE_URI'] = final_db_url
        admin_url = make_url(final_db_url).set(database='mysql')
        engine = create_engine(admin_url, execution_options={"isolation_level": "AUTOCOMMIT"})
        with engine.connect() as conn:
            conn.execute(text(f"CREATE DATABASE IF NOT EXISTS {db_name}"))
            print(f"--- Database {db_name} SIAP ---")
    except Exception as e:
        print(f"Warning Init DB: {e}")
        app.config['SQLALCHEMY_DATABASE_URI'] = raw_db_url

configure_and_create_db()

db.init_app(app)
bcrypt.init_app(app)
login_manager.init_app(app)
migrate = Migrate(app, db)
gemini_model = configure_gemini()

@login_manager.user_loader
def load_user(user_id): return db.session.get(User, int(user_id))

@app.cli.command("create-superadmin")
def create_superadmin():
    username = os.getenv('SUPER_ADMIN_USER', 'admin')
    password = os.getenv('SUPER_ADMIN_PASS', 'admin123')
    if not User.query.filter_by(role='superadmin').first():
        u = User(username=username, role='superadmin')
        u.set_password(password)
        db.session.add(u)
        db.session.commit()
        print(f"Superadmin dibuat: {username}")

# --- [UPDATE] Route Dashboard ---
@app.route('/')
@app.route('/dashboard')
@login_required
def dashboard():
    # 1. Hitung Ringkasan (Saldo, Masuk, Keluar) - Tetap Pertahankan
    total_masuk = db.session.query(func.sum(Transaction.amount)).filter(Transaction.jenis == 'debet').scalar() or 0
    total_keluar = db.session.query(func.sum(Transaction.amount)).filter(Transaction.jenis == 'kredit').scalar() or 0
    saldo = total_masuk - total_keluar
    
    # 2. Ambil 5 Transaksi Terakhir - Tetap Pertahankan
    try: 
        transactions = Transaction.query.order_by(Transaction.tanggal.desc(), Transaction.id.desc()).limit(5).all()
    except: 
        transactions = []

    # 3. [BARU] Ambil Data Statistik untuk Grafik
    stat_data = get_statistics_data()
        
    return render_template('dashboard.html', 
                           transactions=transactions,
                           saldo=saldo,
                           total_masuk=total_masuk,
                           total_keluar=total_keluar,
                           data=stat_data) # <-- Kirim data grafik ke HTML

# --- ROUTES AUTH ---
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        user = User.query.filter_by(username=request.form['username']).first()
        if user and bcrypt.check_password_hash(user.password_hash, request.form['password']):
            login_user(user)
            
            # LOG LOGIN (Manual Commit karena login_user tidak commit DB)
            log = ActivityLog(user_id=user.id, action="LOGIN", details="User berhasil login")
            db.session.add(log)
            db.session.commit()
            
            return redirect(url_for('dashboard'))
        flash('Login gagal.', 'danger')
    return render_template('login.html')

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('login'))

# --- FINANCE ---
@app.route('/finance/scan', methods=['POST'])
@login_required
def scan_receipt():
    file = request.files.get('file')
    if file:
        path = None # Inisialisasi variabel path
        try:
            # 1. Simpan File Sementara
            filename = secure_filename(f"{datetime.now().timestamp()}_{file.filename}")
            path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)
            file.save(path)

            # 2. Proses ke AI
            data, err = extract_receipt_data(path, gemini_model)

            # 3. [BARU] HAPUS FILE SETELAH DIPAKAI
            # Agar server tidak penuh sampah gambar
            if os.path.exists(path):
                os.remove(path)
                print(f"INFO: File {filename} telah dihapus dari server untuk menghemat ruang.")

            # 4. Cek Hasil AI
            if not data:
                flash(f"Scan Gagal: {err}", "danger")
                return redirect(url_for('dashboard'))
            
            session['scan_result'] = data
            return redirect(url_for('finance_preview'))

        except Exception as e:
            # Safety: Jika terjadi error di tengah jalan, pastikan file tetap dihapus
            if path and os.path.exists(path):
                os.remove(path)
            flash(f"Error: {e}", "danger")
            
    return redirect(url_for('dashboard'))

@app.route('/finance/manual', methods=['GET', 'POST'])
@login_required
def finance_manual():
    if request.method == 'POST':
        try:
            tgl = request.form['tanggal']
            ket = request.form['keterangan']
            amt = float(request.form['amount'])
            jenis = request.form['jenis']
            
            new_trans = Transaction(tanggal=datetime.strptime(tgl, '%Y-%m-%d'), keterangan=ket, amount=amt, jenis=jenis, source='manual')
            db.session.add(new_trans)
            
            # LOG ACTIVITY
            log_activity("CREATE_TRANSACTION", f"Input Manual: {ket} (Rp {amt:,.0f})")
            
            db.session.commit()
            flash('Transaksi tersimpan!', 'success')
            return redirect(url_for('dashboard'))
        except Exception as e:
            flash(f"Gagal: {e}", "danger")
    return render_template('finance_manual.html')

@app.route('/finance/preview', methods=['GET', 'POST'])
@login_required
def finance_preview():
    data = session.get('scan_result', {})
    if request.method == 'POST':
        try:
            total_val = float(request.form.get('total', 0))
            tgl = request.form['tanggal']
            ket = request.form['keterangan']
            
            new_trans = Transaction(tanggal=datetime.strptime(tgl, '%Y-%m-%d'), keterangan=ket, amount=total_val, jenis='kredit', source='gemini_scan')
            db.session.add(new_trans)
            
            # LOG ACTIVITY
            log_activity("SCAN_TRANSACTION", f"Scan AI: {ket} (Rp {total_val:,.0f})")
            
            db.session.commit()
            flash('Bon tersimpan!', 'success')
            return redirect(url_for('dashboard'))
        except Exception as e:
            flash(f"Gagal: {e}", "danger")
    return render_template('preview.html', data=data)

@app.route('/finance/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def finance_edit(id):
    # Proteksi
    if current_user.role == 'user':
        flash('Akses ditolak. Staff tidak boleh mengedit transaksi.', 'danger')
        return redirect(url_for('finance_history'))

    t = Transaction.query.get_or_404(id)
    if request.method == 'POST':
        try:
            old_ket = t.keterangan
            old_amt = t.amount
            
            t.tanggal = datetime.strptime(request.form['tanggal'], '%Y-%m-%d')
            t.keterangan = request.form['keterangan']
            t.amount = float(request.form['amount'])
            t.jenis = request.form['jenis']
            
            log_activity("UPDATE_TRANSACTION", f"Edit ID {id}: {old_ket} -> {t.keterangan}")
            db.session.commit()
            flash('Update berhasil!', 'success')
            return redirect(url_for('finance_history'))
        except Exception as e:
            flash(f"Error: {e}", "danger")
    return render_template('finance_edit.html', t=t)

@app.route('/finance/history')
@login_required
def finance_history():
    search = request.args.get('search')
    start_date = request.args.get('start_date')
    end_date = request.args.get('end_date')
    query = Transaction.query
    if search: query = query.filter(Transaction.keterangan.ilike(f"%{search}%"))
    if start_date: query = query.filter(Transaction.tanggal >= datetime.strptime(start_date, '%Y-%m-%d'))
    if end_date: query = query.filter(Transaction.tanggal <= datetime.strptime(end_date, '%Y-%m-%d').replace(hour=23, minute=59))
    
    transactions = query.order_by(Transaction.tanggal.desc(), Transaction.id.desc()).all()
    return render_template('finance_history.html', transactions=transactions, search=search, start_date=start_date, end_date=end_date)

@app.route('/finance/print', methods=['POST'])
@login_required
def print_finance():
    ids = request.form.getlist('trans_ids[]')
    if not ids:
        flash('Pilih transaksi dulu.', 'warning')
        return redirect(url_for('finance_history'))

    transactions = Transaction.query.filter(Transaction.id.in_(ids)).order_by(Transaction.tanggal.desc(), Transaction.id.desc()).all()
    
    # LOG PRINT
    log = ActivityLog(user_id=current_user.id, action="PRINT_FINANCE", details=f"Cetak {len(ids)} data transaksi")
    db.session.add(log)
    db.session.commit()

    buffer = BytesIO()
    c = canvas.Canvas(buffer, pagesize=A4)
    _, height = A4
    y = height - 2*cm
    c.setFont("Helvetica-Bold", 16); c.drawString(2*cm, y, "LAPORAN KEUANGAN"); y -= 1*cm
    c.setFont("Helvetica", 9)
    for t in transactions:
        if y < 2*cm: c.showPage(); y = height - 2*cm
        c.drawString(2*cm, y, t.tanggal.strftime('%d/%m/%y'))
        c.drawString(5*cm, y, t.keterangan[:40])
        c.drawRightString(19*cm, y, f"Rp {t.amount:,.0f}")
        y -= 0.6*cm
    c.save(); buffer.seek(0)
    return Response(buffer, mimetype='application/pdf', headers={"Content-Disposition": "attachment;filename=laporan.pdf"})

# --- HR & PAYROLL ---
@app.route('/employees')
@login_required
def employee_list():
    # Ambil parameter dari URL
    search = request.args.get('search', '')
    sort_by = request.args.get('sort_by', 'nama_asc') # Default urut Nama A-Z

    query = Employee.query

    # LOGIKA SEARCH (Nama ATAU Posisi)
    if search:
        query = query.filter(
            or_(
                Employee.nama.ilike(f"%{search}%"),
                Employee.posisi.ilike(f"%{search}%")
            )
        )

    # LOGIKA SORTING
    if sort_by == 'nama_asc':
        query = query.order_by(Employee.nama.asc())
    elif sort_by == 'nama_desc':
        query = query.order_by(Employee.nama.desc())
    elif sort_by == 'posisi_asc':
        query = query.order_by(Employee.posisi.asc())
    elif sort_by == 'posisi_desc':
        query = query.order_by(Employee.posisi.desc())
    else:
        # Default fallback
        query = query.order_by(Employee.nama.asc())

    employees = query.all()
    
    return render_template('employee_list.html', 
                           employees=employees, 
                           search=search, 
                           sort_by=sort_by)

@app.route('/employees/add', methods=['GET', 'POST'])
@login_required
def employee_add():
    if request.method == 'POST':
        nama = request.form['nama']
        db.session.add(Employee(nama=nama, posisi=request.form['posisi']))
        
        # LOG
        log_activity("CREATE_EMPLOYEE", f"Menambah karyawan: {nama}")
        
        db.session.commit()
        return redirect(url_for('employee_list'))
    return render_template('employee_form.html', employee=None)

@app.route('/employees/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def employee_edit(id):
    # Proteksi: User biasa gaboleh edit
    if current_user.role == 'user':
        flash('Akses ditolak. Hubungi Admin untuk edit data.', 'danger')
        return redirect(url_for('employee_list'))
        
    emp = Employee.query.get_or_404(id)
    if request.method == 'POST':
        emp.nama = request.form['nama']
        emp.posisi = request.form['posisi']
        
        log_activity("UPDATE_EMPLOYEE", f"Edit karyawan ID {id} menjadi: {emp.nama}")
        db.session.commit()
        return redirect(url_for('employee_list'))
    return render_template('employee_form.html', employee=emp)

@app.route('/employees/delete/<int:id>', methods=['POST'])
@login_required
def employee_delete(id):
    # Proteksi: User biasa gaboleh hapus
    if current_user.role == 'user':
        flash('Akses ditolak. Anda tidak memiliki izin menghapus.', 'danger')
        return redirect(url_for('employee_list'))

    emp = Employee.query.get_or_404(id)
    nama = emp.nama
    try:
        db.session.delete(emp)
        log_activity("DELETE_EMPLOYEE", f"Menghapus karyawan: {nama}")
        db.session.commit()
    except: flash("Gagal hapus, ada data gaji terkait.", "danger")
    return redirect(url_for('employee_list'))

@app.route('/payroll/list')
@login_required
def payroll_list():
    s_date, e_date = request.args.get('start_date'), request.args.get('end_date')
    q = Payroll.query
    if s_date: q = q.filter(Payroll.tanggal_gaji >= datetime.strptime(s_date, '%Y-%m-%d'))
    if e_date: q = q.filter(Payroll.tanggal_gaji <= datetime.strptime(e_date, '%Y-%m-%d').replace(hour=23, minute=59))
    return render_template('payroll_list.html', payrolls=q.order_by(Payroll.tanggal_gaji.desc(), Payroll.id.desc()).all(), start_date=s_date, end_date=e_date)

@app.route('/payroll/create', methods=['GET', 'POST'])
@login_required
def payroll_create():
    if request.method == 'POST':
        p = Payroll(employee_id=request.form['employee_id'], gaji_harian=request.form['gaji_harian'] or 0,
                    gaji_kali=request.form['gaji_kali'] or 0, lembur=request.form['lembur'] or 0, insentif=request.form['insentif'] or 0)
        db.session.add(p)
        
        # LOG
        emp_name = Employee.query.get(p.employee_id).nama
        log_activity("CREATE_PAYROLL", f"Slip gaji untuk: {emp_name}")
        
        db.session.commit()
        return redirect(url_for('payroll_list'))
    return render_template('payroll_form.html', employees=Employee.query.all())

@app.route('/payroll/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def payroll_edit(id):
    # Proteksi
    if current_user.role == 'user':
        flash('Akses ditolak.', 'danger')
        return redirect(url_for('payroll_list'))

    p = Payroll.query.get_or_404(id)
    if request.method == 'POST':
        p.gaji_harian = float(request.form.get('gaji_harian') or 0)
        p.gaji_kali = int(request.form.get('gaji_kali') or 0)
        p.lembur = float(request.form.get('lembur') or 0)
        p.insentif = float(request.form.get('insentif') or 0)
        
        log_activity("UPDATE_PAYROLL", f"Edit slip gaji ID {id} ({p.employee.nama})")
        db.session.commit()
        return redirect(url_for('payroll_list'))
    return render_template('payroll_edit.html', p=p)

@app.route('/payroll/print', methods=['POST'])
@login_required
def print_payroll():
    ids = request.form.getlist('payroll_ids[]')
    if not ids: return redirect(url_for('payroll_list'))
    
    # LOG
    log = ActivityLog(user_id=current_user.id, action="PRINT_PAYROLL", details=f"Cetak {len(ids)} slip gaji")
    db.session.add(log)
    db.session.commit()

    buffer = BytesIO()
    c = canvas.Canvas(buffer, pagesize=A4)
    _, h = A4
    for pay in Payroll.query.filter(Payroll.id.in_(ids)).all():
        c.setFont("Helvetica-Bold", 16); c.drawString(2*cm, h-2*cm, "SLIP GAJI")
        c.setFont("Helvetica", 12); c.drawString(2*cm, h-3*cm, f"Nama: {pay.employee.nama}"); c.drawString(2*cm, h-4*cm, f"Total: Rp {pay.total_gaji:,.0f}")
        c.showPage()
    c.save(); buffer.seek(0)
    return Response(buffer, mimetype='application/pdf', headers={"Content-Disposition": "attachment;filename=slip.pdf"})

@app.route('/statistics')
@login_required
def statistics_page():
    try:
        # Ambil data olahan dari pandas
        data = get_statistics_data()
        return render_template('statistics.html', data=data)
    except Exception as e:
        print(f"Error Stat: {e}")
        # Jika error/kosong, render template dengan data=None
        # Ini akan memicu alert "Data Belum Cukup" di HTML
        return render_template('statistics.html', data=None)

# --- ADMIN PANEL & LOGS ---
@app.route('/admin', methods=['GET', 'POST'])
@login_required
def admin_panel():
    if current_user.role != 'superadmin': return redirect(url_for('dashboard'))
    if request.method == 'POST':
        if not User.query.filter_by(username=request.form['username']).first():
            u = User(username=request.form['username'], role=request.form['role'])
            u.set_password(request.form['password'])
            db.session.add(u)
            
            # LOG
            log_activity("CREATE_USER", f"Membuat user baru: {u.username} ({u.role})")
            
            db.session.commit()
            flash('User dibuat.', 'success')
    return render_template('admin_panel.html', users=User.query.all())

@app.route('/admin/delete/<int:id>', methods=['POST'])
@login_required
def admin_delete_user(id):
    if current_user.role == 'superadmin' and id != current_user.id:
        user = User.query.get_or_404(id)
        uname = user.username
        db.session.delete(user)
        
        # LOG
        log_activity("DELETE_USER", f"Menghapus user: {uname}")
        
        db.session.commit()
    return redirect(url_for('admin_panel'))

# [BARU] HALAMAN ACTIVITY LOGS
@app.route('/admin/logs')
@login_required
def admin_logs():
    if current_user.role != 'superadmin':
        flash('Hanya Super Admin yang boleh melihat log audit.', 'danger')
        return redirect(url_for('dashboard'))
    
    # Ambil 100 log terakhir
    logs = ActivityLog.query.order_by(ActivityLog.timestamp.desc()).limit(100).all()
    return render_template('admin_logs.html', logs=logs)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)