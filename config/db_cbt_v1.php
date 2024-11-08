<?php
// Konfigurasi database
$servername = "localhost"; 
$username = "root"; 
$password = "";
$dbname = "db_cbt_v1"; 

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Mengecek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Set charset
$conn->set_charset("utf8mb4");

// Fungsi untuk menutup koneksi
function closeConnection($conn)
{
    $conn->close();
}
