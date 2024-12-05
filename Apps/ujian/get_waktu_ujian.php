<?php
session_start();
require_once '../../config/db_cbt_v1.php';

// Check if timer already exists in session
if (!isset($_SESSION['waktu_ujian']) || !isset($_SESSION['start_time'])) {
    $kd_pegawai = $_SESSION['username'];

    // Get waktu_ujian for active test
    $query = "SELECT waktu_ujian 
              FROM t_peserta_ujian 
              WHERE kd_pegawai = ? 
              AND flag_aktif = 1";

    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $kd_pegawai);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $_SESSION['waktu_ujian'] = $row['waktu_ujian'];
        $_SESSION['start_time'] = time();
    } else {
        echo "0"; // Return 0 if no active test found
        exit;
    }
}

// Calculate remaining time in seconds
$elapsed_time = time() - $_SESSION['start_time'];
$total_time = $_SESSION['waktu_ujian'] * 60; // Convert minutes to seconds
$remaining_time = $total_time - $elapsed_time;

// Ensure time doesn't go negative
$remaining_time = max(0, $remaining_time);

// Return remaining time in minutes (rounded up)
echo ceil($remaining_time / 60);
