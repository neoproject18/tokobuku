<?php

namespace App\Controllers;

use \App\Models\SupplierModel;
use App\Entities\SupplierEntity;

class Supplier extends BaseController
{
    private $supplierModel;
    public function __construct()
    {
        $this->supplierModel = new SupplierModel();
    }

    public function index()
    {
        $dataSupplier = $this->supplierModel->findAll();
        $data = [
            'title' => 'Data Supplier',
            'result' => $dataSupplier
        ];

        return view('supplier/list', $data);
    }

    public function create()
    {
        $data = [
            'title' => 'Tambah Supplier'
        ];
        return view('supplier/create', $data);
    }

    public function save()
    {
        $supplier = new SupplierEntity();

        // $data = [
        //     "name" => $this->request->getVar('name'),
        //     "address" => $this->request->getVar('address'),
        //     "email" => $this->request->getVar('email'),
        //     "phone" => $this->request->getVar('phone'),
        // ];
        // $supplier->fill($data);

        $supplier->name = $this->request->getVar('name');
        $supplier->address = $this->request->getVar('address');
        $supplier->email = $this->request->getVar('email');
        $supplier->phone = $this->request->getVar('phone');

        // $supplier->nama = $this->request->getVar('name');
        // $supplier->alamat = $this->request->getVar('address');
        // $supplier->email = $this->request->getVar('email');
        // $supplier->telp = $this->request->getVar('phone');

        $this->supplierModel->save($supplier);

        session()->setFlashdata("msg", "Data berhasil ditambahkan!");

        return redirect()->to('/supplier');
    }

    public function edit($id)
    {
        $dataSupplier = $this->supplierModel
            ->where(['supplier_id' => $id])->first();
        // Jika data kosong
        if (empty($dataSupplier)) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException("Supplier dengan ID: $id tidak ditemukan!");
        }

        $data = [
            'title' => 'Ubah Supplier',
            'result' => $dataSupplier
        ];

        return view('supplier/edit', $data);
    }

    public function update($id)
    {
        $supplier = new SupplierEntity();

        $data = [
            "supplier_id" => $id,
            "name" => $this->request->getVar('name'),
            "address" => $this->request->getVar('address'),
            "email" => $this->request->getVar('email'),
            "phone" => $this->request->getVar('phone'),
        ];
        $supplier->fill($data);

        $this->supplierModel->save($supplier);

        session()->setFlashdata("msg", "Data berhasil diperbarui!");

        return redirect()->to('/supplier');
    }

    public function delete($id)
    {
        $this->supplierModel->delete($id);
        session()->setFlashdata("msg", "Data berhasil dihapus!");
        return redirect()->to('/supplier');
    }
}
