<?php
session_start();

// Simpan pesan logout
$_SESSION['logout_message'] = "Anda telah berhasil logout.";

// Hapus semua data session kecuali pesan logout
$logout_message = $_SESSION['logout_message'];
$_SESSION = array();
$_SESSION['logout_message'] = $logout_message;

// Hapus cookie session jika ada
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(
        session_name(),
        '',
        time() - 42000,
        $params["path"],
        $params["domain"],
        $params["secure"],
        $params["httponly"]
    );
}

// Hancurkan session
session_destroy();

// Redirect ke halaman login dengan parameter
header("Location: /cbt-bpr/Apps/login/login.php");
exit();
