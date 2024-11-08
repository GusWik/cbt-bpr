<?php
require_once '../../config/db_cbt_v1.php';

if (isset($_GET['id'])) {
    $id_pegawai = $_GET['id'];

    $sql = "SELECT * FROM t_pegawai WHERE id_pegawai = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_pegawai);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
        echo json_encode($row);
    } else {
        echo json_encode(["error" => "Pegawai tidak ditemukan"]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["error" => "ID pegawai tidak diberikan"]);
}
