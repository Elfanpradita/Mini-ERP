from extensions import db, bcrypt
from flask_login import UserMixin
from datetime import datetime
import json

class User(db.Model, UserMixin):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password_hash = db.Column(db.String(128), nullable=False)
    role = db.Column(db.String(20), default='user')
    # Relasi agar saat User dihapus, Log tidak error tapi jadi NULL
    # passive_deletes=False (default) membiarkan SQLAlchemy menghandle set null
    activities = db.relationship('ActivityLog', backref='user', lazy=True)

    def set_password(self, password):
        self.password_hash = bcrypt.generate_password_hash(password).decode('utf-8')

    def check_password(self, password):
        return bcrypt.check_password_hash(self.password_hash, password)

class Employee(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.String(150), nullable=False)
    posisi = db.Column(db.String(100))
    payrolls = db.relationship('Payroll', backref='employee', lazy=True)

class Payroll(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    employee_id = db.Column(db.Integer, db.ForeignKey('employee.id'), nullable=False)
    tanggal_gaji = db.Column(db.DateTime, nullable=False, default=datetime.now)
    gaji_harian = db.Column(db.Numeric(10, 2), default=0)
    gaji_kali = db.Column(db.Integer, default=0)
    lembur = db.Column(db.Numeric(10, 2), default=0)
    insentif = db.Column(db.Numeric(10, 2), default=0)
    gaji_lainnya = db.Column(db.Text) 

    @property
    def total_gaji(self):
        try:
            total = (float(self.gaji_harian or 0) * int(self.gaji_kali or 0)) + \
                    float(self.lembur or 0) + float(self.insentif or 0)
            if self.gaji_lainnya:
                items = json.loads(self.gaji_lainnya)
                for i in items: total += float(i.get('jumlah', 0))
            return total
        except: return 0

class Transaction(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    tanggal = db.Column(db.Date, nullable=False)
    keterangan = db.Column(db.String(255))
    amount = db.Column(db.Numeric(12, 2))
    jenis = db.Column(db.String(20)) 
    source = db.Column(db.String(50), default='manual')

class ActivityLog(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    # [PERBAIKAN DI SINI] Ubah nullable=False jadi True
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=True) 
    action = db.Column(db.String(50), nullable=False)
    details = db.Column(db.Text)
    timestamp = db.Column(db.DateTime, default=datetime.now)