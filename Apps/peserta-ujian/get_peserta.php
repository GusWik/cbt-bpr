<?php
require_once '../../config/db_cbt_v1.php';

$query = "SELECT pu.*, p.nm_pegawai, p.kode_kantor 
          FROM t_peserta_ujian pu
          JOIN t_pegawai p ON pu.kd_pegawai = p.kd_pegawai
          WHERE pu.flag_aktif = 1
          ORDER BY pu.tgl_ujian DESC";

$result = $conn->query($query);

while ($row = $result->fetch_assoc()) {
    $status = "Belum Ujian";
    if ($row['total_nilai_ujian'] > 0) {
        $status = "Sudah Ujian";
    }

    echo "<tr>
    <td>{$row['kd_pegawai']}</td>
    <td>{$row['nm_pegawai']}</td>
    <td>" . date('d-m-Y', strtotime($row['tgl_ujian'])) . "</td>
    <td>{$status}</td>
    <td>
        <button class='btn btn-danger btn-sm batalkan-peserta' data-id='{$row['id_peserta']}'>
            <i class='bi bi-trash text-white'></i>
        </button>
    </td>
</tr>";
}
