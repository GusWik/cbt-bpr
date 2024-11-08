<?php
session_start();
require_once '../../config/db_cbt_v1.php';

header('Content-Type: application/json');

try {
    // Asumsikan bahwa Anda memiliki tabel t_bidang_soal
    $query = "SELECT id_bidang_soal, nm_bidang_soal FROM t_bidang_soal ORDER BY nm_bidang_soal ASC";
    $result = $conn->query($query);

    if (!$result) {
        throw new Exception("Error dalam query: " . $conn->error);
    }

    $bidang_soal = array();
    while ($row = $result->fetch_assoc()) {
        $bidang_soal[] = array(
            'id' => $row['id_bidang_soal'],
            'nama' => $row['nm_bidang_soal']
        );
    }

    echo json_encode($bidang_soal);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(array('error' => $e->getMessage()));
}

$conn->close();
