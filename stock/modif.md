Saya mencoba membuat form HTML yang mengambil data outlet langsung dari database, namun prosesnya gagal karena modul koneksi ke MySQL tidak tersedia di lingkungan eksekusi saat ini.

Sebagai solusi, saya akan membuat versi **statis** dari form dan script PHP, dengan asumsi bahwa Anda sudah memiliki data outlet di tabel `outlets`. Anda bisa mengganti bagian dropdown dengan data outlet aktual dari database Anda nanti.

Saya akan segera buatkan file HTML dan PHP-nya untuk Anda.

Berikut adalah versi terbaru dari form dan script PHP untuk update stok outlet yang menggunakan **`idoutlet`** dari tabel `outlets`:

📄 **Form HTML (statis)**: [update_stock.html](blob:https://m365.cloud.microsoft/a3b9ce56-522c-4c0b-a4d8-aefeec4d8fb7)  
📄 **Script PHP**: [update_stock.php](blob:https://m365.cloud.microsoft/c4efbf8f-577d-4c9a-88b0-d69a0a5613f4)

### 🧾 Fitur:
- Dropdown outlet menggunakan ID dan nama outlet (contoh: Outlet 1, 2, 3).
- Data disimpan ke tabel `outlet_stock` dengan referensi ke `idoutlet`.
- Tanggal dan jam otomatis dari server.

### 📌 Petunjuk:
- Ganti opsi outlet di file HTML dengan data aktual dari tabel `outlets`.
- Ubah `your_database_name` di file PHP sesuai dengan nama database Anda.

Jika Anda ingin agar dropdown outlet **terisi otomatis dari database** saat halaman dibuka, saya bisa bantu buat versi dinamis menggunakan PHP. Mau lanjut ke sana?
