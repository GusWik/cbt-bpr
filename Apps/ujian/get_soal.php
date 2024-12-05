<?php
session_start();
require_once '../../config/db_cbt_v1.php';

// Validasi session
if (!isset($_SESSION['username'])) {
    echo json_encode(['status' => 'error', 'message' => 'Session tidak valid']);
    exit;
}

$kd_pegawai = $_SESSION['username'];
$nomor_soal = isset($_POST['nomor']) ? (int)$_POST['nomor'] : 1;

// Query untuk mengambil soal berdasarkan nomor
$query = "SELECT * FROM t_bank_soal 
          WHERE id_soal NOT IN (
              SELECT id_soal 
              FROM t_hasil_ujian 
              WHERE id_peserta = {$_SESSION['id_peserta']}
          )
          ORDER BY RAND() 
          LIMIT 1 OFFSET " . ($nomor_soal - 1);

$result = $conn->query($query);

if ($result && $result->num_rows > 0) {
    $soal = $result->fetch_assoc();
    $output = [
        'status' => 'success',
        'id_soal' => $soal['id_soal'],
        'nomor' => $nomor_soal,
        'pertanyaan' => $soal['pertanyaan'],
        'pilihan_a' => $soal['pilihan_a'],
        'pilihan_b' => $soal['pilihan_b'],
        'pilihan_c' => $soal['pilihan_c'],
        'pilihan_d' => $soal['pilihan_d']
    ];
} else {
    $output = [
        'status' => 'error',
        'message' => 'Soal tidak ditemukan'
    ];
}

header('Content-Type: application/json');
echo json_encode($output);
