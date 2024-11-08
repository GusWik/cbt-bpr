<?php
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_pegawai = $_POST['id_pegawai'];
    $kd_pegawai = $_POST['kd_pegawai'];
    $nm_pegawai = $_POST['nm_pegawai'];
    $jabatan_pegawai = $_POST['jabatan_pegawai'];
    $kode_kantor = $_POST['kode_kantor'];

    $sql = "UPDATE t_pegawai SET kd_pegawai=?, nm_pegawai=?, jabatan_pegawai=?, kode_kantor=? 
            WHERE id_pegawai=?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssi", $kd_pegawai, $nm_pegawai, $jabatan_pegawai, $kode_kantor, $id_pegawai);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Data pegawai berhasil diupdate"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Gagal mengupdate data pegawai"]);
    }

    $stmt->close();
    $conn->close();
}
