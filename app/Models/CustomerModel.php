<?php

namespace App\Models;

use CodeIgniter\Model;

class CustomerModel extends Model
{
    // Nama Tabel
    protected $table      = 'customer';
    // Atribut yang digunakan menjadi primary key
    protected $primaryKey = 'customer_id';
    // Atribut untuk menyimpan created_at dan updated_at
    protected $useTimestamps = true;
    protected $allowedFields = [
        'name', 'no_customer', 'gender', 'address', 'email', 'phone'
    ];

    protected $useSoftDeletes = true;
}
