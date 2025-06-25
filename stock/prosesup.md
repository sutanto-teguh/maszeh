Terjadi kesalahan teknis saat mencoba menjalankan server untuk fitur upload dan preview foto. Namun, saya bisa langsung berikan versi lengkap dari **form HTML dan script PHP** yang bisa Anda gunakan di server Anda.

### ✅ Form HTML dengan Upload & Preview Foto

```html
<form action="update_stock.php" method="POST" enctype="multipart/form-data">
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

    <label>Upload Foto:</label><br>
    <input type="file" name="photo" accept="image/*" onchange="previewImage(event)" required><br><br>

    <img id="preview" src="#" alt="Preview Foto" style="display:none;" width="200"><br><br>

    <input type="submit" value="Update Stock">
</form>

<script>
function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function(){
        var output = document.getElementById('preview');
        output.src = reader.result;
        output.style.display = 'block';
    };
    reader.readAsDataURL(event.target.files[0]);
}
</script>
```

### ✅ Script PHP untuk Menyimpan Foto (`update_stock.php`)

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

// Handle file upload
$target_dir = "uploads/";
$photo_name = basename($_FILES["photo"]["name"]);
$target_file = $target_dir . $photo_name;
move_uploaded_file($_FILES["photo"]["tmp_name"], $target_file);

// Simpan data ke database (tambahkan kolom 'photo' jika perlu)
$sql = "INSERT INTO outlet_stock (outlet_name, date, time, shift, current_stock)
        VALUES ('$outlet_name', '$date', '$time', '$shift', '$current_stock')";

if ($conn->query($sql) === TRUE) {
    echo "<script>
            alert('Stock berhasil diupdate!');
            window.location.href = 'update_stock.php';
          </script>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
```

### 📌 Catatan:
- Pastikan folder `uploads/` sudah dibuat dan memiliki izin tulis.
- Jika Anda ingin menyimpan nama file foto ke database, tambahkan kolom `photo` di tabel `outlet_stock`.

Ingin saya bantu tambahkan tampilan foto di halaman list stok juga?
