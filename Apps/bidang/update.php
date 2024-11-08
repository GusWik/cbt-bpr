<?php
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_bidang_soal = $_POST['id_bidang_soal'];
    $nm_bidang_soal = $_POST['nm_bidang_soal'];

    $sql = "UPDATE t_bidang_soal SET nm_bidang_soal = ? WHERE id_bidang_soal = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("si", $nm_bidang_soal, $id_bidang_soal);

    if ($stmt->execute()) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false, "error" => $conn->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "error" => "Invalid request"]);
}

$conn->close();
