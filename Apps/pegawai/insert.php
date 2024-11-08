<?php
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $kd_pegawai = $_POST['kd_pegawai'];
    $nm_pegawai = $_POST['nm_pegawai'];
    $jabatan_pegawai = $_POST['jabatan_pegawai'];
    $kode_kantor = $_POST['kode_kantor'];

    $sql = "INSERT INTO t_pegawai (kd_pegawai, nm_pegawai, jabatan_pegawai, kode_kantor) 
            VALUES (?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $kd_pegawai, $nm_pegawai, $jabatan_pegawai, $kode_kantor);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Pegawai berhasil ditambahkan"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Gagal menambahkan pegawai"]);
    }

    $stmt->close();
    $conn->close();
}
