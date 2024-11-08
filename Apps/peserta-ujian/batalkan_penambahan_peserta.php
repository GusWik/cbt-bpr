<?php
session_start();
require_once '../../config/db_cbt_v1.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_peserta = $_POST['id_peserta'];

    $stmt = $conn->prepare("DELETE FROM t_peserta_ujian WHERE id_peserta = ?");
    $stmt->bind_param("i", $id_peserta);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Peserta berhasil dibatalkan']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Gagal membatalkan peserta']);
    }

    $stmt->close();
    $conn->close();
}
