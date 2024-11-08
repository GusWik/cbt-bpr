<?php
session_start();
require_once '../../config/db_cbt_v1.php';

// Pastikan user sudah login
if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

// Ambil semua soal dari database
$sql = "SELECT * FROM t_bank_soal ORDER BY id_soal";
$result = $conn->query($sql);
$soal_array = $result->fetch_all(MYSQLI_ASSOC);
$total_soal = count($soal_array);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Computer-Based Test</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .soal-nav {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            gap: 5px;
        }

        .soal-nav button {
            width: 100%;
            aspect-ratio: 1;
        }

        .belum-dijawab {
            background-color: #dc3545;
        }

        .sudah-dijawab {
            background-color: #28a745;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Panel Navigasi Soal -->
            <div class="col-md-3">
                <div class="card mt-3">
                    <div class="card-body">
                        <h5 class="card-title">Navigasi Soal</h5>
                        <div class="soal-nav">
                            <?php for ($i = 1; $i <= $total_soal; $i++): ?>
                                <button class="btn btn-sm belum-dijawab" onclick="gotoSoal(<?= $i ?>)"><?= $i ?></button>
                            <?php endfor; ?>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Konten Soal -->
            <div class="col-md-9">
                <div class="card mt-3">
                    <div class="card-body">
                        <h5 class="card-title">Soal <span id="nomorSoal">1</span></h5>
                        <div id="kontenSoal"></div>
                        <div class="mt-3">
                            <button class="btn btn-secondary" onclick="prevSoal()">Sebelumnya</button>
                            <button class="btn btn-secondary" onclick="nextSoal()">Selanjutnya</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        const soalArray = <?= json_encode($soal_array) ?>;
        let currentSoal = 0;

        function showSoal(index) {
            const soal = soalArray[index];
            let html = `
                <p>${soal.pertanyaan}</p>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="jawaban" id="jawaban_a" value="a" onchange="saveJawaban(${soal.id_soal}, 'a')">
                    <label class="form-check-label" for="jawaban_a">${soal.pilihan_a}</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="jawaban" id="jawaban_b" value="b" onchange="saveJawaban(${soal.id_soal}, 'b')">
                    <label class="form-check-label" for="jawaban_b">${soal.pilihan_b}</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="jawaban" id="jawaban_c" value="c" onchange="saveJawaban(${soal.id_soal}, 'c')">
                    <label class="form-check-label" for="jawaban_c">${soal.pilihan_c}</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="jawaban" id="jawaban_d" value="d" onchange="saveJawaban(${soal.id_soal}, 'd')">
                    <label class="form-check-label" for="jawaban_d">${soal.pilihan_d}</label>
                </div>
            `;
            $('#kontenSoal').html(html);
            $('#nomorSoal').text(index + 1);
            currentSoal = index;

            // Cek jawaban yang tersimpan
            const savedJawaban = localStorage.getItem(`jawaban_${soal.id_soal}`);
            if (savedJawaban) {
                $(`#jawaban_${savedJawaban}`).prop('checked', true);
            }
        }

        function saveJawaban(idSoal, jawaban) {
            localStorage.setItem(`jawaban_${idSoal}`, jawaban);
            $(`.soal-nav button:nth-child(${currentSoal + 1})`)
                .removeClass('belum-dijawab')
                .addClass('sudah-dijawab');
        }

        function gotoSoal(index) {
            showSoal(index - 1);
        }

        function prevSoal() {
            if (currentSoal > 0) showSoal(currentSoal - 1);
        }

        function nextSoal() {
            if (currentSoal < soalArray.length - 1) showSoal(currentSoal + 1);
        }

        // Inisialisasi
        showSoal(0);

        // Cek jawaban yang tersimpan untuk navigasi
        soalArray.forEach((soal, index) => {
            if (localStorage.getItem(`jawaban_${soal.id_soal}`)) {
                $(`.soal-nav button:nth-child(${index + 1})`)
                    .removeClass('belum-dijawab')
                    .addClass('sudah-dijawab');
            }
        });
    </script>
</body>

</html>