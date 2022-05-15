<?php

namespace App\Controllers;

use App\Libraries\GroceryCrud;
use \App\Models\CustomerModel;

class Customer extends BaseController
{
    private $custModel;
    public function __construct()
    {
        $this->custModel = new CustomerModel();
    }

    public function index()
    {
        $crud = new GroceryCrud();
        $crud->setTable('customer');
        $crud->where('deleted_at', null);
        $crud->setLanguage('Indonesian');
        $crud->columns(['name', 'no_customer', 'gender', 'address', 'email', 'phone']);
        $crud->unsetColumns(['created_at', 'updated_at']);
        $crud->displayAs(array(
            'name' => 'Nama',
            'gender' => 'L/P',
            'address' => 'Alamat',
            'phone' => 'Telp',
        ));
        $crud->unsetAddFields(['created_at', 'updated_at']);
        $crud->unsetEditFields(['created_at', 'updated_at']);
        $crud->setRule('name', 'Nama', 'required', [
            'required' => '{field} harus diisi!'
        ]);

        $crud->unsetAdd(); // Menonaktifkan tombol Tambah Data
        $crud->unsetEdit(); // Menonaktifkan tombol Ubah Data
        $crud->unsetDelete(); // Menonaktifkan tombol Hapus Data
        $crud->unsetExport(); // Menonaktifkan tombol Export Data
        $crud->unsetPrint(); // Menonaktifkan tombol Print Data
        // $crud->setTheme('datatables');

        $output = $crud->render();

        $data = [
            'title' => 'Data Customer',
            'result' => $output
        ];
        return view('customer/index', $data);
    }
}
