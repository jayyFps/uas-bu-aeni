# Aplikasi Kompresi File

## Deskripsi Proyek
Aplikasi Kompresi File adalah sebuah aplikasi web yang memungkinkan pengguna untuk mengompres file secara online. Aplikasi ini dibangun menggunakan framework Laravel dan menyediakan antarmuka yang mudah digunakan untuk mengelola proses kompresi file.

## Fitur Utama
1. **Autentikasi Pengguna**
   - Registrasi akun baru
   - Login ke akun
   - Logout dari akun
   - Sistem keamanan dengan password hashing

2. **Manajemen File**
   - Upload file untuk dikompresi
   - Kompresi file secara otomatis
   - Download file hasil kompresi
   - Hapus file yang sudah tidak diperlukan

3. **Antarmuka Pengguna**
   - Desain responsif
   - Tema gelap dan terang
   - Navigasi yang intuitif
   - Panduan penggunaan

## Persyaratan Sistem
- PHP >= 8.1
- Composer
- MySQL/MariaDB
- Web Server (Apache/Nginx)
- Ekstensi PHP yang diperlukan:
  - BCMath PHP Extension
  - Ctype PHP Extension
  - Fileinfo PHP Extension
  - JSON PHP Extension
  - Mbstring PHP Extension
  - OpenSSL PHP Extension
  - PDO PHP Extension
  - Tokenizer PHP Extension
  - XML PHP Extension

## Instalasi
1. Clone repositori
   ```bash
   git clone [url-repositori]
   cd compresi_file
   ```

2. Install dependensi
   ```bash
   composer install
   ```

3. Salin file .env
   ```bash
   cp .env.example .env
   ```

4. Generate application key
   ```bash
   php artisan key:generate
   ```

5. Konfigurasi database di file .env
   ```
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=nama_database
   DB_USERNAME=username
   DB_PASSWORD=password
   ```

6. Jalankan migrasi database
   ```bash
   php artisan migrate
   ```

7. Jalankan server development
   ```bash
   php artisan serve
   ```

## Struktur Proyek
```
compresi_file/
├── app/
│   ├── Http/
│   │   ├── Controllers/
│   │   │   ├── Auth/
│   │   │   │   ├── LoginController.php
│   │   │   │   └── RegisterController.php
│   │   │   └── FileCompressionController.php
│   │   └── Middleware/
│   ├── Models/
│   │   └── User.php
│   └── ...
├── config/
├── database/
│   └── migrations/
├── public/
├── resources/
│   └── views/
│       ├── auth/
│       │   ├── login.blade.php
│       │   └── register.blade.php
│       ├── layouts/
│       └── ...
├── routes/
│   └── web.php
└── ...
```

## Panduan Penggunaan

### 1. Registrasi Akun
1. Buka halaman registrasi dengan mengklik tombol "Daftar"
2. Isi formulir dengan data yang diperlukan:
   - Nama lengkap
   - Email (harus valid dan belum terdaftar)
   - Nomor telepon (harus unik)
   - Password (minimal 8 karakter)
   - Konfirmasi password
3. Klik tombol "Daftar" untuk menyelesaikan registrasi
4. Setelah berhasil, Anda akan langsung masuk ke dashboard

### 2. Login ke Akun
1. Buka halaman login
2. Masukkan email dan password yang telah didaftarkan
3. Opsional: Centang "Ingat saya" untuk tetap masuk
4. Klik tombol "Masuk"
5. Jika berhasil, Anda akan diarahkan ke dashboard

### 3. Mengompresi File
1. Dari dashboard, klik tombol "Upload File"
2. Pilih file yang ingin dikompresi
3. Tunggu proses upload dan kompresi selesai
4. Setelah selesai, file hasil kompresi akan muncul di daftar
5. Klik tombol "Download" untuk mengunduh file hasil kompresi

### 4. Mengelola File
1. Lihat daftar file yang telah dikompresi di dashboard
2. Untuk mengunduh file:
   - Klik tombol "Download" di samping file yang diinginkan
3. Untuk menghapus file:
   - Klik tombol "Hapus" di samping file yang ingin dihapus
   - Konfirmasi penghapusan

### 5. Logout
1. Klik tombol "Logout" di menu navigasi
2. Anda akan keluar dari akun dan diarahkan ke halaman login

## Keamanan
- Password di-hash menggunakan algoritma bcrypt
- Proteksi terhadap CSRF (Cross-Site Request Forgery)
- Validasi input pada semua form
- Session management yang aman
- Rate limiting pada login untuk mencegah brute force

## Pengembangan
Untuk pengembangan lebih lanjut, beberapa saran peningkatan:
1. Implementasi verifikasi email
2. Penambahan fitur kompresi batch
3. Integrasi dengan layanan cloud storage
4. Penambahan opsi kompresi yang dapat dikustomisasi
5. Implementasi sistem notifikasi

## Lisensi
Proyek ini dilisensikan di bawah [MIT License](LICENSE.md).

## Kontak
Untuk pertanyaan dan dukungan, silakan hubungi:
- Email: [email@example.com]
- Website: [www.example.com]
"# uas-multimedia" 
"# uas-multimedia" 
