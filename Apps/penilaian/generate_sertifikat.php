<?php
session_start();
require_once '../../config/db_cbt_v1.php';
require_once '../../vendor/autoload.php';

// Kode query database tetap sama seperti sebelumnya

// Inisialisasi TCPDF dengan orientasi landscape
$pdf = new TCPDF('L', 'mm', 'A4', true, 'UTF-8', false);

// Set document information
$pdf->SetCreator('PT BPR NTB PERSERODA');
$pdf->SetAuthor('PT BPR NTB PERSERODA');
$pdf->SetTitle('Sertifikat CBT - ' . $data['nm_pegawai']);

// Remove default header/footer
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);

// Add page
$pdf->AddPage();

// Set background
$pdf->Image('../../assets/static/images/sertifikat/background.jpg', 0, 0, 297, 210, '', '', '', false, 300);

// Add logo
$pdf->Image('../../assets/static/images/sertifikat/logo.png', 125, 20, 50, '', '', '', '', false, 300);

// Set font dan konten
$html = '
<style>
    .sertifikat {
        text-align: center; 
        line-height: 1.6;
        padding: 40px;
    }
    .header {
        font-size: 28pt; 
        font-weight: bold; 
        color: #1B3C73;
        margin-top: 40px;
    }
    .nama {
        font-size: 24pt;
        font-weight: bold;
        color: #1B3C73;
        padding: 10px 30px;
    }
    .content {
        font-size: 14pt;
        margin: 20px 0;
    }
    .footer {
        font-size: 12pt;
        margin-top: 40px;
    }
</style>

<div class="sertifikat">
    <div class="header">SERTIFIKAT<br>COMPUTER BASED TEST</div>
    <div class="content">
        Diberikan kepada:<br>
        <div class="nama">' . $data['nm_pegawai'] . '</div>
        ' . $data['jabatan_pegawai'] . '<br>
        ' . $data['nama_kantor'] . '<br><br>
        Telah menyelesaikan ujian CBT bidang:<br>
        <b>' . $data['nm_bidang_soal'] . '</b><br>
        dengan nilai: <b>' . $data['total_nilai_ujian'] . '</b>
    </div>
    <div class="footer">
        Mataram, ' . date('d F Y', strtotime($data['tgl_terbit'])) . '<br>
        PT BPR NTB PERSERODA<br><br><br><br>
        <u>Direktur Utama</u><br>
        NIP. ........................
    </div>
</div>';

$pdf->writeHTML($html, true, false, true, false, '');
$pdf->Output('Sertifikat_' . $data['no_sertifikat'] . '.pdf', 'D');
