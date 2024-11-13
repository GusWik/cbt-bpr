<?php
session_start();
require_once '../../config/db_cbt_v1.php';

$nomor_soal = $_POST['nomor'];
$jawaban = $_POST['jawaban'];
$kd_pegawai = $_SESSION['username'];

// Get peserta and soal data
$query_data = "SELECT pu.id_peserta, bs.id_soal, bs.jawaban_benar 
               FROM t_peserta_ujian pu
               JOIN t_bank_soal bs ON pu.id_bidang_soal = bs.bidang_soal
               WHERE pu.kd_pegawai = ? AND pu.flag_aktif = 1
               LIMIT ?, 1";

$stmt = $conn->prepare($query_data);
$offset = $nomor_soal - 1;
$stmt->bind_param("si", $kd_pegawai, $offset);
$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_assoc();

// Calculate nilai
$nilai = ($jawaban == $data['jawaban_benar']) ? 1 : 0;

// Save or update jawaban
$query_save = "INSERT INTO t_hasil_ujian (tgl_ujian, id_peserta, id_soal, jawaban_dipilih, nilai_per_soal) 
               VALUES (CURDATE(), ?, ?, ?, ?)
               ON DUPLICATE KEY UPDATE 
               jawaban_dipilih = VALUES(jawaban_dipilih),
               nilai_per_soal = VALUES(nilai_per_soal)";

$stmt_save = $conn->prepare($query_save);
$stmt_save->bind_param("iisi", $data['id_peserta'], $data['id_soal'], $jawaban, $nilai);
$stmt_save->execute();

echo json_encode(['success' => true]);
