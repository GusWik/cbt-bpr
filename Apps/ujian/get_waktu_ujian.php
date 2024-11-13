<?php
session_start();
require_once '../../config/db_cbt_v1.php';

$kd_pegawai = $_SESSION['username'];
$query = "SELECT waktu_ujian FROM t_peserta_ujian WHERE kd_pegawai = '$kd_pegawai' AND flag_aktif = 1";
$result = $conn->query($query);
$row = $result->fetch_assoc();

echo $row['waktu_ujian'];
