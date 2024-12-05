<?php
session_start();
require_once '../../config/db_cbt_v1.php';
require_once '../../vendor/autoload.php';

$id_peserta = isset($_GET['id_peserta']) ? $_GET['id_peserta'] : null;

if (!$id_peserta) {
    die("ID Peserta tidak valid");
}

// Get report data
$query = "SELECT 
            pu.id_peserta,
            pu.tgl_ujian,
            pu.jml_soal,
            pu.total_nilai_ujian,
            p.nm_pegawai,
            bs.nm_bidang_soal
          FROM t_peserta_ujian pu
          JOIN t_pegawai p ON pu.kd_pegawai = p.kd_pegawai
          JOIN t_bidang_soal bs ON pu.id_bidang_soal = bs.id_bidang_soal
          WHERE pu.id_peserta = ?";

$stmt = $conn->prepare($query);
if ($stmt === false) {
    die("Error preparing query: " . $conn->error);
}

$stmt->bind_param("i", $id_peserta);
$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_assoc();

// Query untuk mengambil detail jawaban salah
$query_salah = "SELECT DISTINCT bs.nm_bidang_soal
                FROM t_hasil_ujian hu
                JOIN t_bank_soal bs ON hu.id_soal = bs.id_soal
                WHERE hu.id_peserta = ? AND hu.nilai_per_soal = 0";

$stmt_salah = $conn->prepare($query_salah);
if ($stmt_salah) {
    $stmt_salah->bind_param("i", $id_peserta);
    $stmt_salah->execute();
    $result_salah = $stmt_salah->get_result();
} else {
    $result_salah = false;
}

ob_clean();

// Create PDF
$pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);
$pdf->SetCreator('PT BPR NTB');
$pdf->SetAuthor('PT BPR NTB');
$pdf->SetTitle('Hasil Ujian CBT - ' . $data['nm_pegawai']);

$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);
$pdf->SetMargins(15, 15, 15);
$pdf->AddPage();

// Content
$html = '
<style>
    .header {text-align: center; font-size: 16pt; font-weight: bold; margin-bottom: 20px;}
    .table {width: 100%; border-collapse: collapse; margin-top: 20px;}
    .table th, .table td {border: 1px solid #000; padding: 8px;}
    .table th {background-color: #f0f0f0;}
    .status-lulus {color: green; font-weight: bold;}
    .status-gagal {color: red; font-weight: bold;}
    .catatan {margin-top: 30px; border: 1px solid #ddd; padding: 15px; background-color: #f9f9f9;}
    .catatan-header {font-size: 14pt; font-weight: bold; color: #333; margin-bottom: 10px;}
    .rekomendasi {margin-top: 10px; padding-left: 20px;}
</style>

<div class="header">HASIL UJIAN CBT<br>PT BPR NTB PERSERODA</div>

<table class="table">
    <tr>
        <th>No</th>
        <th>Tanggal Ujian</th>
        <th>Nama Peserta</th>
        <th>Bidang Soal</th>
        <th>Jumlah Soal</th>
        <th>Nilai</th>
        <th>Status</th>
    </tr>
    <tr>
        <td>1</td>
        <td>' . date('d-m-Y', strtotime($data['tgl_ujian'])) . '</td>
        <td>' . $data['nm_pegawai'] . '</td>
        <td>' . $data['nm_bidang_soal'] . '</td>
        <td>' . $data['jml_soal'] . '</td>
        <td>' . $data['total_nilai_ujian'] . '</td>
        <td>' . ($data['total_nilai_ujian'] >= 65 ?
    '<span class="status-lulus">Lulus</span>' :
    '<span class="status-gagal">Tidak Lulus</span>') . '</td>
    </tr>
</table>';

// Tampilkan catatan pengembangan hanya jika tidak lulus
if ($data['total_nilai_ujian'] < 65) {
    $html .= '<div class="catatan">
        <div class="catatan-header">Catatan Pengembangan:</div>
        <p></p>
        <div class="rekomendasi">';

    if ($result_salah && $result_salah->num_rows > 0) {
        while ($bidang = $result_salah->fetch_assoc()) {
            $html .= '<p>• Materi <b>' . $bidang['nm_bidang_soal'] . '</b>: ' .
                'Perlu pendalaman materi dan pemahaman lebih lanjut terkait dengan Materi yang diujikan, Tetap Semangat Semoga Berhasil dikemudian Hari.</p>';
        }
    } else {
        $html .= '<p>Perlu pendalaman materi dan pemahaman lebih lanjut terkait dengan Materi yang diujikan, Tetap Semangat Semoga Berhasil dikemudian Hari.</p>';
    }

    $html .= '</div>
        <p style="margin-top: 15px;"><i></i></p>
    </div>';
}



$pdf->writeHTML($html, true, false, true, false, '');
$pdf->Output('Hasil_Ujian_CBT_' . $data['nm_pegawai'] . '.pdf', 'D');
