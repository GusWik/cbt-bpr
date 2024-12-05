<?php
session_start();
require_once '../../config/db_cbt_v1.php';

$kd_pegawai = $_SESSION['username'];
$answers = $_POST['answers'];

// Get active exam data
$query = "SELECT id_peserta FROM t_peserta_ujian 
          WHERE kd_pegawai = ? AND flag_aktif = 1";
$stmt = $conn->prepare($query);
$stmt->bind_param("s", $kd_pegawai);
$stmt->execute();
$result = $stmt->get_result();
$peserta = $result->fetch_assoc();

if ($peserta) {
    foreach ($answers as $id_soal => $jawaban) {
        // Get correct answer
        $query_jawaban = "SELECT jawaban_benar FROM t_bank_soal WHERE id_soal = ?";
        $stmt = $conn->prepare($query_jawaban);
        $stmt->bind_param("i", $id_soal);
        $stmt->execute();
        $result = $stmt->get_result();
        $soal = $result->fetch_assoc();

        // Calculate nilai
        $nilai_per_soal = ($jawaban == $soal['jawaban_benar']) ? 1 : 0;

        // Insert into t_hasil_ujian
        $query_insert = "INSERT INTO t_hasil_ujian 
                        (tgl_ujian, id_peserta, id_soal, jawaban_dipilih, nilai_per_soal) 
                        VALUES (CURDATE(), ?, ?, ?, ?)";
        $stmt = $conn->prepare($query_insert);
        $stmt->bind_param(
            "iisi",
            $peserta['id_peserta'],
            $id_soal,
            $jawaban,
            $nilai_per_soal
        );
        $stmt->execute();
    }

    // Update exam status
    $query_update = "UPDATE t_peserta_ujian SET flag_aktif = 0 WHERE id_peserta = ?";
    $stmt = $conn->prepare($query_update);
    $stmt->bind_param("i", $peserta['id_peserta']);
    $stmt->execute();
}

echo json_encode(['success' => true]);
