<?php
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $bidang_soal = $_POST['bidang_soal'];
    $pertanyaan = $_POST['pertanyaan'];
    $pilihan_a = $_POST['pilihan_a'];
    $pilihan_b = $_POST['pilihan_b'];
    $pilihan_c = $_POST['pilihan_c'];
    $pilihan_d = $_POST['pilihan_d'];
    $jawaban_benar = $_POST['jawaban_benar'];

    $sql = "INSERT INTO t_bank_soal (bidang_soal, pertanyaan, pilihan_a, pilihan_b, pilihan_c, pilihan_d, jawaban_benar) 
            VALUES (?, ?, ?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("issssss", $bidang_soal, $pertanyaan, $pilihan_a, $pilihan_b, $pilihan_c, $pilihan_d, $jawaban_benar);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Soal berhasil ditambahkan"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Gagal menambahkan soal"]);
    }

    $stmt->close();
    $conn->close();
}
