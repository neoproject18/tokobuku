<?= $this->extend('layout/template') ?>

<?= $this->section('content') ?>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">LAPORAN PENJUALAN</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Laporan Penjualan</li>
        </ol>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <?= $title ?>
            </div>
            <div class="card-body">
                <!-- Filter -->
                <form action="<?= base_url('jual/laporan/filter') ?>" method="post">
                    <div class="container">
                        <div class="row">
                            <div class="col-3">
                                <input type="date" class="form-control" name="tgl_awal" id="tgl_awal"
                                    value="<?= $tanggal['tgl_awal'] ?>" title="Tanggal Awal">
                            </div>
                            <div class="col-3">
                                <input type="date" class="form-control" name="tgl_akhir" id="tgl_akhir"
                                    value="<?= $tanggal['tgl_akhir'] ?>" title="Tanggal Akhir">
                            </div>
                            <div class="col-6">
                                <button class="btn btn-secondary">Filter</button>
                                <a onclick="exportPDF()" class="btn btn-dark">Export PDF</a>
                                <a onclick="exportExcel()" class="btn btn-primary"> Export Excel</a>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- Isi Report -->
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nota</th>
                            <th>Tanggal Transaksi</th>
                            <th>User</th>
                            <th>Customer</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1;
                        foreach ($result as $value): ?>
                            <tr>
                                <td>
                                    <?= $no++ ?>
                                </td>
                                <td>
                                    <?= $value['sale_id'] ?>
                                </td>
                                <td>
                                    <?= date("d/m/Y H:i:s", strtotime($value['tgl_transaksi'])) ?>
                                </td>
                                <td>
                                    <?= $value['firstname'] ?>
                                    <?= $value['lastname'] ?>
                                </td>
                                <td>
                                    <?= $value['name_cust'] ?>
                                </td>
                                <td>
                                    <?= number_to_currency($value['total'], 'IDR', 'id_ID', 2) ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                <!--  -->
            </div>
        </div>
    </div>
</main>
<script>
    function exportPDF() {
        let tgl1 = $('#tgl_awal').val()
        let tgl2 = $('#tgl_akhir').val()
        window.location.href = "/jual/exportpdf/" + tgl1 + "/" + tgl2
    }

    function exportExcel() {
        let tgl1 = $('#tgl_awal').val()
        let tgl2 = $('#tgl_akhir').val()
        window.location.href = "/jual/exportexcel/" + tgl1 + "/" + tgl2
    }
</script>

<?= $this->endSection() ?>