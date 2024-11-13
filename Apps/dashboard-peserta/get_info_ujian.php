<?php
session_start();
require_once '../../config/db_cbt_v1.php';

$username = $_SESSION['username'];
$kode_kantor = $_SESSION['kode_kantor'];

// Query untuk mendapatkan kd_pegawai dari t_users dulu
$query_user = "SELECT username FROM t_users WHERE username = '$username' AND kode_kantor = '$kode_kantor'";
$result_user = $conn->query($query_user);

if ($result_user && $result_user->num_rows > 0) {
    // Username dari t_users digunakan sebagai kd_pegawai di t_pegawai
    $query_pegawai = "SELECT kd_pegawai, nm_pegawai FROM t_pegawai WHERE kd_pegawai = '$username' AND kode_kantor = '$kode_kantor'";
    $result_pegawai = $conn->query($query_pegawai);

    if ($result_pegawai && $result_pegawai->num_rows > 0) {
        $pegawai = $result_pegawai->fetch_assoc();
        $kd_pegawai = $pegawai['kd_pegawai'];
        echo "Data ditemukan - KD Pegawai: " . $kd_pegawai;
    } else {
        die("Data pegawai tidak ditemukan di t_pegawai");
    }
} else {
    die("User tidak ditemukan di t_users");
}
