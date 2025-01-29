To implement user roles in the attendance system, you can add a user authentication and authorization mechanism. This will allow you to differentiate between regular employees and administrators. Here's a step-by-step guide to achieve this:

### 1. Update Database Structure
Add a `Users` table to store user information and roles:
```sql
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('employee', 'admin') NOT NULL
);
```

### 2. Registration and Login Forms
Create forms for user registration and login.

#### Registration Form (register.html)
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>
<body>
    <h2>Register</h2>
    <form action="register.php" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <label for="role">Role:</label>
        <select id="role" name="role">
            <option value="employee">Employee</option>
            <option value="admin">Admin</option>
        </select><br><br>
        <button type="submit">Register</button>
    </form>
</body>
</html>
```

#### Login Form (login.html)
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="login.php" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>
```

### 3. PHP Scripts for Registration and Login
Create PHP scripts to handle registration and login.

#### Registration Script (register.php)
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
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $role = $_POST['role'];

    $sql = "INSERT INTO Users (username, password, role) VALUES ('$username', '$password', '$role')";

    if ($conn->query($sql) === TRUE) {
        echo "Registration successful!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
```

#### Login Script (login.php)
```php
<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database_name"; // Ganti dengan nama database Anda

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT id, password, role FROM Users WHERE username='$username'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['username'] = $username;
            $_SESSION['role'] = $row['role'];
            header("Location: dashboard.php");
        } else {
            echo "Invalid password.";
        }
    } else {
        echo "No user found with that username.";
    }

    $conn->close();
}
?>
```

### 4. Dashboard and Role-Based Access Control
Create a dashboard and restrict access based on user roles.

#### Dashboard (dashboard.php)
```php
<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.html");
    exit();
}

echo "Welcome, " . $_SESSION['username'] . "!<br>";

if ($_SESSION['role'] == 'admin') {
    echo "<a href='display.php'>View Attendance Records</a><br>";
}

echo "<a href='presensi.html'>Record Attendance</a><br>";
echo "<a href='logout.php'>Logout</a>";
?>
```

#### Logout Script (logout.php)
```php
<?php
session_start();
session_destroy();
header("Location: login.html");
?>
```

### 5. Update Attendance Form
Update the attendance form to include user authentication.

#### Attendance Form (presensi.html)
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
    <form id="presensiForm" action="presensi.php" method="post">
        <label for="nama">Nama Karyawan:</label>
        <input type="text" id="nama" name="nama_karyawan" required><br><br>
        <button type="submit" name="action" value="checkin">Check In</button>
        <button type="submit" name="action" value="checkout">Check Out</button>
    </form>
</body>
</html>
```

### 6. Update Attendance Script
Update the attendance script to include user authentication.

#### Attendance Script (presensi.php)
```php
<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.html");
    exit();
}

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
    $action = $_POST['action'];
    $tanggal = date('Y-m-d');
    $waktu_sekarang = date('H:i:s');

    if ($action == 'checkin') {
        $sql = "INSERT INTO PresensiKaryawan (nama_karyawan, tanggal, jam_datang) VALUES ('$nama_karyawan', '$tanggal', '$waktu_sekarang')";
    } elseif ($action == 'checkout') {
        $sql = "UPDATE PresensiKaryawan SET jam_pulang='$waktu_sekarang', total_jam_kerja=TIMEDIFF('$waktu_sekarang', jam_datang) WHERE nama_karyawan='$nama_karyawan' AND tanggal='$tanggal'";
    }

    if ($conn->query($sql) === TRUE) {
        echo "Presensi berhasil disimpan!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
```

This implementation includes user roles, allowing for differentiated access between employees and administrators. Employees can record their attendance, while administrators can view attendance records.

If you have any more questions or need further assistance, feel free to ask! 😊
