<?= $this->extend('layout/template') ?>

<?= $this->section('content') ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Dashboard</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">Primary Card</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body">Warning Card</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body">Success Card</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body">Danger Card</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        Grafik Transaksi Penjualan
                        <div class="col-sm-2 mt-3">
                            <input type="number" id="tahun-trans" class="form-control" value="<?= date('Y') ?>" onchange="chartTransaksi()">
                        </div>
                    </div>
                    <div class="card-body"><canvas id="chartTransaksi" width="100%" height="40"></canvas></div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button class="btn btn-outline-primary btn-sm" onclick="downloadChartTransaksi('PDF')">Unduh PDF</button>
                        <a id="download-trans" download="chart-transaksi.png">
                            <button class="btn btn-outline-secondary btn-sm" onclick="downloadChartTransaksi('img')">Unduh Image</button>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    Grafik Customer
                    <div class="col-sm-2 mt-3">
                        <input type="number" id="tahun-cust" class="form-control" value="<?= date('Y') ?>" onchange="chartCustomer()">
                    </div>
                </div>
                <div class="card-body"><canvas id="chartCust" width="100%" height="40"></canvas></div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-outline-primary btn-sm" onclick="downloadChartCustomer('PDF')">Unduh PDF</button>
                    <a id="download-cust" download="chart-customer.png">
                        <button class="btn btn-outline-secondary btn-sm" onclick="downloadChartCustomer('img')">Unduh Image</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    $(document).ready(function() {
        chartTransaksi()
        chartCustomer()
    });

    // ====================== TRANSAKSI ========================= //
    function setLineChart(dataset) {
        // Area Chart Example
        var ctx = document.getElementById("chartTransaksi");
        var myLineChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Ags", "Sep", "Okt", "Nov", "Des"],
                datasets: [{
                    label: "Total",
                    lineTension: 0.3,
                    backgroundColor: "rgba(2,117,216,0.2)",
                    borderColor: "rgba(2,117,216,1)",
                    pointRadius: 5,
                    pointBackgroundColor: "rgba(2,117,216,1)",
                    pointBorderColor: "rgba(255,255,255,0.8)",
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: "rgba(2,117,216,1)",
                    pointHitRadius: 50,
                    pointBorderWidth: 2,
                    data: dataset,
                }],
            },
            options: {
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'date'
                        },
                        gridLines: {
                            display: false
                        },
                        ticks: {
                            maxTicksLimit: 7
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            maxTicksLimit: 5
                        },
                        gridLines: {
                            color: "rgba(0, 0, 0, .125)",
                        }
                    }],
                },
                legend: {
                    display: false
                }
            }
        });
    }

    function chartTransaksi() {
        var tahun = $('#tahun-trans').val();
        $.ajax({
            url: "<?= base_url('chart-transaksi') ?>",
            method: "POST",
            data: {
                'tahun': tahun,
            },
            success: function(response) {
                var result = JSON.parse(response)

                dataset = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                $.each(result.data, function(i, val) {
                    dataset[val.month - 1] = val.total
                });
                setLineChart(dataset)
            }
        });
    }

    // ====================== CUSTOMER ================== //
    function setBarChart(dataset) {
        // Bar Chart Example

        var ctx = document.getElementById("chartCust");
        var myLineChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Ags", "Sep", "Okt", "Nov", "Des"],
                datasets: [{
                    label: "Jumlah",
                    backgroundColor: "rgba(2,117,216,1)",
                    borderColor: "rgba(2,117,216,1)",
                    data: dataset,
                }],
            },
            options: {
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'month'
                        },
                        gridLines: {
                            display: false
                        },
                        ticks: {
                            maxTicksLimit: 6
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            maxTicksLimit: 5
                        },
                        gridLines: {
                            display: true
                        }
                    }],
                },
                legend: {
                    display: false
                }
            }
        });
    }

    function chartCustomer() {
        var tahun = $('#tahun-cust').val();
        $.ajax({
            url: "<?= base_url('chart-customer') ?>",
            method: "POST",
            data: {
                'tahun': tahun,
            },
            success: function(response) {
                var result = JSON.parse(response)

                dataset = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                $.each(result.data, function(i, val) {
                    dataset[val.month - 1] = val.total
                });
                setBarChart(dataset)
            }
        });
    }

    // Download Chart
    function downloadChartTransaksi(type) {
        var download = document.getElementById('download-trans')
        var chart = document.getElementById('chartTransaksi')

        if (type === "img") {
            downloadChartImg(download, chart)
        } else {
            downloadChartPDF(chart, "Chart-Transaksi.pdf", 'Grafik Transaksi Penjualan')
        }
    }

    function downloadChartCustomer(type) {
        var button = document.getElementById('download-cust')
        var chart = document.getElementById('chartCust')

        if (type === "img") {
            downloadChartImg(button, chart)
        } else {
            downloadChartPDF(chart, "Chart-Customer.pdf", 'Grafik Jumlah Customer')
        }
    }

    function downloadChartImg(button, chart) {
        var img = chart.toDataURL("image/jpg", 1.0).replace("image/jpg",
            "image/octet-stream")
        button.setAttribute("href", img)
    }

    function downloadChartPDF(chart, filename, title) {
        var img = chart.toDataURL("image/jpg", 1.0).replace("image/jpg",
            "image/octet-stream")
        window.jsPDF = window.jspdf.jsPDF
        doc = new jsPDF('p', 'mm', 'A4')
        doc.text(10, 10, title)
        doc.addImage(img, 'jpg', 10, 15, 0, 0)
        doc.save(filename)
    }
</script>
<?= $this->endSection() ?>