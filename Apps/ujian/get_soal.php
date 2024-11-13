<?php
session_start();
require_once '../../config/db_cbt_v1.php';

$nomor_soal = isset($_POST['nomor']) ? $_POST['nomor'] : 1;
$kd_pegawai = $_SESSION['username'];

// Ambil soal
$query = "SELECT * FROM t_bank_soal WHERE bidang_soal = 1 LIMIT 1";
$result = $conn->query($query);
$soal = $result->fetch_assoc();

if ($soal) {
    $output = [
        'status' => 'success',
        'nomor' => $nomor_soal,
        'pertanyaan' => $soal['pertanyaan'],
        'pilihan' => [
            'a' => $soal['pilihan_a'],
            'b' => $soal['pilihan_b'],
            'c' => $soal['pilihan_c'],
            'd' => $soal['pilihan_d']
        ]
    ];
} else {
    $output = ['status' => 'error', 'message' => 'Soal tidak ditemukan'];
}

header('Content-Type: application/json');
echo json_encode($output);
