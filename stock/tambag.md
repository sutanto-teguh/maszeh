Berikut adalah contoh sederhana program HTML dan PHP untuk melakukan update stok dari setiap outlet. Program ini akan:

1. Menyediakan form HTML untuk input data outlet.
2. Menyimpan data ke dalam database menggunakan PHP.
3. Mengisi tanggal dan jam secara otomatis dari server.

---

### 🧩 **Struktur Database (MySQL)**

```sql
CREATE TABLE outlet_stock (
    id INT AUTO_INCREMENT PRIMARY KEY,
    outlet_name VARCHAR(100),
    date DATE,
    time TIME,
    shift INT,
    current_stock INT
);
```

---

### 🖥️ **Form HTML (`update_stock.html`)**

```html
<!DOCTYPE html>
<html>
<head>
    <title>Update Stock Outlet</title>
</head>
<body>
    <h2>Form Update Stock Outlet</h2>
    <form action="update_stock.php" method="POST">
        <label>Nama Outlet:</label><br>
        <input type="text" name="outlet_name" required><br><br>

        <label>Shift:</label><br>
        <select name="shift" required>
            <option value="1">Shift 1</option>
            <option value="2">Shift 2</option>
            <option value="3">Shift 3</option>
            <option value="4">Shift 4</option>
        </select><br><br>

        <label>Stock Saat Ini:</label><br>
        <input type="number" name="current_stock" required><br><br>

        <input type="submit" value="Update Stock">
    </form>
</body>
</html>
```

---

### 🧾 **Script PHP (`update_stock.php`)**

```php
<?php
$host = "localhost";
$user = "root";
$password = "";
$database = "your_database_name";

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

$outlet_name = $_POST['outlet_name'];
$shift = $_POST['shift'];
$current_stock = $_POST['current_stock'];
$date = date("Y-m-d");
$time = date("H:i:s");

$sql = "INSERT INTO outlet_stock (outlet_name, date, time, shift, current_stock)
        VALUES ('$outlet_name', '$date', '$time', '$shift', '$current_stock')";

if ($conn->query($sql) === TRUE) {
    echo "Stock berhasil diupdate!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
```

---

Apakah Anda ingin saya bantu membuat file-nya langsung agar bisa diunduh dan diuji? Saya juga bisa bantu menambahkan fitur validasi atau tampilan data jika diperlukan.
Berikut adalah dua file yang telah saya buat untuk sistem update stok outlet:

📄 **Form HTML**: [update_stock.html](blob:https://m365.cloud.microsoft/304fb689-80b3-470f-8420-ca11b229171d)  
📄 **Script PHP**: [update_stock.php](blob:https://m365.cloud.microsoft/c4741694-8a52-423b-acd3-d5b8d61d266e)

### ✅ Petunjuk Penggunaan:
1. **Database**: Pastikan Anda sudah membuat database dan tabel seperti ini:

   ```sql
   CREATE TABLE outlet_stock (
       id INT AUTO_INCREMENT PRIMARY KEY,
       outlet_name VARCHAR(100),
       date DATE,
       time TIME,
       shift INT,
       current_stock INT
   );
   ```

2. **Konfigurasi PHP**: Ubah nilai `your_database_name` di file `update_stock.php` sesuai dengan nama database Anda.

3. **Hosting**: Simpan kedua file di server lokal (misalnya XAMPP) atau server hosting yang mendukung PHP dan MySQL.

Jika Anda ingin saya bantu membuat file SQL untuk setup database, atau menambahkan fitur seperti validasi atau tampilan data, tinggal beri tahu saja!
