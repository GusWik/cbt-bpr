<?php
session_start();
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // prepared statement untuk mencegah SQL injection
    $sql = "SELECT id, username, password, nama, kode_kantor, role FROM t_users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        // Verifikasi password
        if ($password === $user['password']) {
            // Set session
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['nama'] = $user['nama'];
            $_SESSION['kode_kantor'] = $user['kode_kantor'];
            $_SESSION['role'] = $user['role'];

            // Set login status untuk SweetAlert
            $_SESSION['login_status'] = 'success';
            $_SESSION['login_message'] = "Login berhasil! Anda akan dialihkan dalam beberapa detik.";

            // Arahkan berdasarkan peran
            if ($user['role'] === 'admin') {
                $_SESSION['redirect_url'] = "../";
            } else {
                $_SESSION['redirect_url'] = "../dashboard-peserta/index.php";
            }
        } else {
            // Password salah
            $_SESSION['login_status'] = 'error';
            $_SESSION['login_message'] = "Username atau password salah";
        }
    } else {
        // Username tidak ditemukan
        $_SESSION['login_status'] = 'error';
        $_SESSION['login_message'] = "Username atau password salah";
    }

    $stmt->close();
} else {
    // Jika bukan metode POST, set error
    $_SESSION['login_status'] = 'error';
    $_SESSION['login_message'] = "Metode akses tidak valid";
}

$conn->close();

// Selalu kembali ke halaman login
header("Location: login.php");
exit();
