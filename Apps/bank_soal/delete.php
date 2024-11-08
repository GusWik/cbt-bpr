<?php
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_soal = $_POST['id_soal'];

    $sql = "DELETE FROM t_bank_soal WHERE id_soal = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_soal);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Soal berhasil dihapus"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Gagal menghapus soal"]);
    }

    $stmt->close();
    $conn->close();
}
