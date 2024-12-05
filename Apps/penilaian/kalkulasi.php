<?php

require_once '../../config/db_cbt_v1.php';

// Get peserta data
$kd_pegawai = $_SESSION['username'];
$query = "SELECT 
    pu.id_peserta,
    pu.tgl_ujian,
    pu.jml_soal,
    p.nm_pegawai,
    bs.nm_bidang_soal,
    COUNT(CASE WHEN hu.nilai_per_soal = 1 THEN 1 END) as total_benar
FROM t_peserta_ujian pu
JOIN t_pegawai p ON pu.kd_pegawai = p.kd_pegawai
JOIN t_bidang_soal bs ON pu.id_bidang_soal = bs.id_bidang_soal
LEFT JOIN t_hasil_ujian hu ON pu.id_peserta = hu.id_peserta
WHERE pu.kd_pegawai = ? 
AND pu.flag_aktif = 0
GROUP BY pu.id_peserta
ORDER BY pu.tgl_ujian DESC";

$stmt = $conn->prepare($query);
$stmt->bind_param("s", $kd_pegawai);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
  $no = 1;
  while ($row = $result->fetch_assoc()) {
    // Calculate final score
    $total_nilai = ($row['total_benar'] / $row['jml_soal']) * 100;

    // Update total_nilai_ujian
    $update_query = "UPDATE t_peserta_ujian 
                        SET total_nilai_ujian = ? 
                        WHERE id_peserta = ?";
    $update_stmt = $conn->prepare($update_query);
    $update_stmt->bind_param("di", $total_nilai, $row['id_peserta']);
    $update_stmt->execute();

    // Display results
    echo "<tr>
<td>{$no}</td>
<td>" . date('d-m-Y', strtotime($row['tgl_ujian'])) . "</td>
<td>{$row['nm_pegawai']}</td>
<td>{$row['nm_bidang_soal']}</td>
<td>{$row['jml_soal']}</td>
<td>{$total_nilai}</td>
<td>" . ($total_nilai >= 65 ?
      '<span class="badge bg-success">Lulus</span>' :
      '<span class="badge bg-danger">Tidak Lulus</span>') . "</td>
<td>" .
      "<button class='btn btn-primary btn-sm' onclick='generateSertifikat({$row['id_peserta']})'>
        <i class='bi bi-file-earmark-pdf'></i> Download Hasil
    </button>" .
      "</td>
</tr>";
    $no++;
  }
} else {
  echo "<tr><td colspan='8' class='text-center'>Belum ada data hasil ujian</td></tr>";
}
