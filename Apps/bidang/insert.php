<?php
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nm_bidang_soal = $_POST['nm_bidang_soal'];

    $sql = "INSERT INTO t_bidang_soal (nm_bidang_soal) VALUES (?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $nm_bidang_soal);

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
