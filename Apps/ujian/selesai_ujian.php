<?php
session_start();
require_once '../../config/db_cbt_v1.php';

$kd_pegawai = $_SESSION['username'];

// Calculate total nilai
$query_nilai = "SELECT SUM(hu.nilai_per_soal) as total_nilai
                FROM t_peserta_ujian pu
                JOIN t_hasil_ujian hu ON pu.id_peserta = hu.id_peserta
                WHERE pu.kd_pegawai = ? AND pu.flag_aktif = 1";

$stmt = $conn->prepare($query_nilai);
$stmt->bind_param("s", $kd_pegawai);
$stmt->execute();
$result = $stmt->get_result();
$nilai = $result->fetch_assoc();

// Update total nilai in peserta_ujian
$query_update = "UPDATE t_peserta_ujian 
                 SET total_nilai_ujian = ?
                 WHERE kd_pegawai = ? AND flag_aktif = 1";

$stmt_update = $conn->prepare($query_update);
$stmt_update->bind_param("is", $nilai['total_nilai'], $kd_pegawai);
$stmt_update->execute();

echo json_encode(['success' => true]);
