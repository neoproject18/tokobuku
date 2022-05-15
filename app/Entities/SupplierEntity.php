<?php

namespace App\Entities;

use CodeIgniter\Entity\Entity;

class SupplierEntity extends Entity
{
    protected $datamap = [
        "nama" => 'name',
        "alamat" => 'address',
        "email" => 'email',
        "telp" => 'phone',
    ];
    protected $dates   = ['created_at', 'updated_at', 'deleted_at'];
    protected $casts   = [];

    function setEmail(string $email)
    {
        $this->attributes["email"] = strtolower($email);
        return $this;
    }

    public function getName()
    {
        return strtoupper($this->attributes['name']);
    }

    public function full_data()
    {
        return $this->attributes['name'] . " " . $this->attributes['email'] . '<br>';
    }
}
