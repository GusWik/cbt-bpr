<?php
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_pegawai = $_POST['id_pegawai'];

    $sql = "DELETE FROM t_pegawai WHERE id_pegawai = ?";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_pegawai);
    
    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Pegawai berhasil dihapus"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Gagal menghapus pegawai"]);
    }

    $stmt->close();
    $conn->close();
}
