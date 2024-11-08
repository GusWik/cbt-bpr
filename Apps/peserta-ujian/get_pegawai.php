<?php
require_once '../../config/db_cbt_v1.php';

$kode_kantor = $_POST['kode_kantor'];

$query = "SELECT p.* FROM t_pegawai p 
          WHERE p.kode_kantor = ? 
          AND NOT EXISTS (
              SELECT 1 FROM t_peserta_ujian pu 
              WHERE pu.kd_pegawai = p.kd_pegawai 
              AND pu.flag_aktif = 1
          )
          ORDER BY p.nm_pegawai";

$stmt = $conn->prepare($query);
$stmt->bind_param("s", $kode_kantor);
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    echo "<tr>
            <td><input type='checkbox' class='pegawai-checkbox' value='{$row['kd_pegawai']}'></td>
            <td>{$row['kd_pegawai']}</td>
            <td>{$row['nm_pegawai']}</td>
            <td>{$row['jabatan_pegawai']}</td>
            <td>{$row['kode_kantor']}</td>
          </tr>";
}
