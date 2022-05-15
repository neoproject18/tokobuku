<?php

namespace App\Controllers;

use App\Models\UsersModel;
use Myth\Auth\Models\UserModel;
use Myth\Auth\Password;

class Users extends BaseController
{
    private $userModel;
    public function __construct()
    {
        $this->userModel = new UsersModel();
    }

    public function index()
    {
        $dataUser = $this->userModel->getUsers();
        $data = [
            'title' => 'Data User',
            'result' => $dataUser
        ];
        return view('user/index', $data);
    }

    public function create()
    {
        $data = [
            'title' => 'Tambah User'
        ];
        return view('user/create', $data);
    }

    public function save()
    {
        $user_myth = new UserModel();
        $user_myth->withGroup($this->request->getVar('role'))->save([
            'firstname' => $this->request->getVar('firstname'),
            'lastname' => $this->request->getVar('lastname'),
            'username' => $this->request->getVar('username'),
            'email' => $this->request->getVar('email'),
            'password_hash' => Password::hash("123456"),
            'active' => 1
        ]);

        session()->setFlashdata('success', 'Berhasil menambahkan user');
        return redirect()->to('/users');
    }

    public function edit($id)
    {
        $dataUser = $this->userModel->getUsers($id);
        $data = [
            'title' => 'Ubah User',
            'result' => $dataUser
        ];
        return view('user/edit', $data);
    }

    public function update($id)
    {
        $user_myth = new UserModel();
        $user_myth->withGroup($this->request->getVar('role'))->save([
            'id' => $id,
            'firstname' => $this->request->getVar('firstname'),
            'lastname' => $this->request->getVar('lastname'),
            'username' => $this->request->getVar('username'),
            'email' => $this->request->getVar('email'),
        ]);

        session()->setFlashdata('success', 'Berhasil memperbarui user');
        return redirect()->to('/users');
    }


    public function delete($id)
    {
        $this->userModel->delete($id);
        session()->setFlashdata("msg", "Data berhasil dihapus!");
        return redirect()->to('/users');
    }
}
