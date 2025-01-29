Tentu! Berikut adalah program yang lebih lengkap untuk sistem presensi kehadiran menggunakan PHP, HTML, dan JavaScript. Program ini mencakup fitur untuk merekam data nama, tanggal, jam kehadiran, mengunggah foto selfie, dan menampilkan data presensi.

### Struktur Database
Pertama, buat tabel `PresensiKaryawan` di database Anda:
```sql
CREATE TABLE PresensiKaryawan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_karyawan VARCHAR(100) NOT NULL,
    tanggal DATETIME DEFAULT CURRENT_TIMESTAMP,
    foto LONGBLOB
);
```

### HTML Form
Buat form HTML untuk input data:
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Presensi Kehadiran</title>
</head>
<body>
    <h2>Presensi Kehadiran</h2>
    <form id="presensiForm" action="upload.php" method="post" enctype="multipart/form-data">
        <label for="nama">Nama Karyawan:</label>
        <input type="text" id="nama" name="nama_karyawan" required><br><br>
        <label for="foto">Unggah Foto Selfie:</label>
        <input type="file" id="foto" name="foto" accept="image/*" capture="user" required><br><br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
```

### PHP Script (upload.php)
Buat file `upload.php` untuk memproses data yang diunggah:
```php
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database_name"; // Ganti dengan nama database Anda

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama_karyawan = $_POST['nama_karyawan'];
    $foto = addslashes(file_get_contents($_FILES['foto']['tmp_name']));

    $sql = "INSERT INTO PresensiKaryawan (nama_karyawan, foto) VALUES ('$nama_karyawan', '$foto')";

    if ($conn->query($sql) === TRUE) {
        echo "Presensi berhasil disimpan!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
```

### PHP Script (display.php)
Buat file `display.php` untuk menampilkan data presensi:
```php
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database_name"; // Ganti dengan nama database Anda

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id, nama_karyawan, tanggal, foto FROM PresensiKaryawan";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'>
            <tr>
                <th>ID</th>
                <th>Nama Karyawan</th>
                <th>Tanggal</th>
                <th>Foto</th>
            </tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["id"]. "</td>
                <td>" . $row["nama_karyawan"]. "</td>
                <td>" . $row["tanggal"]. "</td>
                <td><img src='data:image/jpeg;base64," . base64_encode($row["foto"]) . "' width='100' height='100'/></td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>
```

### HTML Page
Buat halaman HTML untuk menampilkan data presensi:
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Presensi Kehadiran</title>
</head>
<body>
    <h2>Daftar Presensi Kehadiran</h2>
    <?php include 'display.php'; ?>
</body>
</html>
```

### JavaScript (Optional)
Jika Anda ingin menambahkan validasi atau fitur tambahan menggunakan JavaScript, Anda bisa menambahkan script berikut di dalam tag `<head>` atau sebelum tag `</body>`:
```html
<script>
document.getElementById('presensiForm').addEventListener('submit', function(event) {
    var nama = document.getElementById('nama').value;
    var foto = document.getElementById('foto').files[0];

    if (!nama || !foto) {
        alert('Nama dan foto harus diisi!');
        event.preventDefault();
    }
});
</script>
```

Program ini mencakup semua langkah yang diperlukan untuk merekam dan menampilkan data presensi kehadiran. Pastikan untuk mengganti `database_name` dengan nama database Anda.

Jika ada pertanyaan lebih lanjut atau butuh bantuan tambahan, jangan ragu untuk bertanya! 😊
