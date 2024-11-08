<?php
session_start();
require_once '../../config/db_cbt_v1.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $tgl_ujian = $_POST['tgl_ujian'];
    $jml_soal = $_POST['jml_soal'];
    $id_bidang_soal = $_POST['id_bidang_soal'];
    $waktu_ujian = $_POST['waktu_ujian'];
    $pegawai = json_decode($_POST['pegawai']);

    $stmt = $conn->prepare("INSERT INTO t_peserta_ujian (tgl_ujian, kd_pegawai, jml_soal, id_bidang_soal, waktu_ujian, flag_aktif) VALUES (?, ?, ?, ?, ?, 1)");

    $success = true;
    $conn->begin_transaction();

    foreach ($pegawai as $kd_pegawai) {
        $stmt->bind_param("ssiii", $tgl_ujian, $kd_pegawai, $jml_soal, $id_bidang_soal, $waktu_ujian);
        if (!$stmt->execute()) {
            $success = false;
            break;
        }
    }

    if ($success) {
        $conn->commit();
        echo json_encode(['status' => 'success', 'message' => 'Peserta berhasil ditambahkan']);
    } else {
        $conn->rollback();
        echo json_encode(['status' => 'error', 'message' => 'Gagal menambahkan peserta']);
    }

    $stmt->close();
    $conn->close();
}
