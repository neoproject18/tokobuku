<?php

namespace App\Controllers;

use \App\Models\BerandaModel;

class Home extends BaseController
{
    protected $beranda;
    public function __construct()
    {
        $this->beranda = new BerandaModel();
    }

    public function index()
    {
        $data = [
            'title' => 'Beranda'
        ];
        return view('beranda', $data);
    }

    public function showChartCustomer()
    {
        $tahun = $this->request->getVar('tahun');
        $reportCust = $this->beranda->reportCustomer($tahun);
        $response = [
            'status' => true,
            'data' => $reportCust
        ];
        echo json_encode($response);
    }

    public function showChartTransaksi()
    {
        $tahun = date('Y');
        $reportTrans = $this->beranda->reportTransaksi($tahun);
        $response = [
            'status' => true,
            'data' => $reportTrans
        ];
        echo json_encode($response);
    }
}
