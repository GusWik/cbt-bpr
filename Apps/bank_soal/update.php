<?php
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_soal = $_POST['id_soal'];
    $bidang_soal = $_POST['bidang_soal'];
    $pertanyaan = $_POST['pertanyaan'];
    $pilihan_a = $_POST['pilihan_a'];
    $pilihan_b = $_POST['pilihan_b'];
    $pilihan_c = $_POST['pilihan_c'];
    $pilihan_d = $_POST['pilihan_d'];
    $jawaban_benar = $_POST['jawaban_benar'];

    $sql = "UPDATE t_bank_soal SET bidang_soal=?, pertanyaan=?, pilihan_a=?, pilihan_b=?, pilihan_c=?, pilihan_d=?, jawaban_benar=? 
            WHERE id_soal=?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("issssssi", $bidang_soal, $pertanyaan, $pilihan_a, $pilihan_b, $pilihan_c, $pilihan_d, $jawaban_benar, $id_soal);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Soal berhasil diupdate"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Gagal mengupdate soal"]);
    }

    $stmt->close();
    $conn->close();
}
