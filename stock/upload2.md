Terjadi kendala teknis saat mencoba mengambil data dari database karena modul koneksi MySQL tidak tersedia. Namun, saya bisa langsung berikan versi **PHP** yang bisa Anda gunakan di server Anda untuk menampilkan foto di halaman list stok.

### ✅ Tambahan di `list_stock_filtered.php`

1. **Pastikan tabel `outlet_stock` memiliki kolom `photo`** untuk menyimpan nama file foto.
2. Tambahkan kolom **Foto** di tabel HTML dan tampilkan gambar dari folder `uploads/`.

### 🧾 Contoh Potongan Kode PHP:

Tambahkan ini di bagian `<th>`:

```php
<th>Foto</th>
```

Tambahkan ini di bagian `<td>` dalam loop:

```php
<td><img src="uploads/<?php echo $row['photo']; ?>" width="100" alt="Foto Stok"></td>
```

### 📌 Catatan:
- Pastikan folder `uploads/` tersedia dan bisa diakses oleh server.
- Pastikan nama file foto disimpan saat input stok.

Jika Anda ingin saya bantu buat versi lengkap file PHP-nya, saya bisa langsung buatkan sekarang. Mau lanjut?
