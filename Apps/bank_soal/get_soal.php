<?php
require_once '../../config/db_cbt_v1.php';

if (isset($_GET['id'])) {
    $id_soal = $_GET['id'];

    $sql = "SELECT * FROM t_bank_soal WHERE id_soal = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_soal);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
        echo json_encode($row);
    } else {
        echo json_encode(["error" => "Soal tidak ditemukan"]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["error" => "ID soal tidak diberikan"]);
}
