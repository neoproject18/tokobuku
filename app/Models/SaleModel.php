<?php

namespace App\Models;

use CodeIgniter\Model;

class SaleModel extends Model
{
    // Nama Tabel
    protected $table      = 'sale';
    protected $useTimestamps = true;
    protected $allowedFields = ['sale_id', 'user_id', 'customer_id'];

    public function getReport()
    {
        return $this->db->table('sale_detail as sd')
            ->select('s.sale_id, s.created_at tgl_transaksi, us.id user_id, us.firstname, us.lastname, , us.username, c.customer_id, c.name name_cust, c.no_customer, SUM(sd.total_price) total')
            ->join('sale  s', 'sale_id')
            ->join('users us', 'us.id = s.user_id')  
            ->join('customer c', 'customer_id', 'left')
            ->groupBy('s.sale_id')
            ->get()->getResultArray();

        // return $this->db->query("SELECT s.sale_id, s.created_at tgl_transaksi, us.id user_id, us.firstname, us.lastname, us.username, c.customer_id, c.name name_cust, c.no_customer, SUM(sd.total_price) total FROM sale_detail sd
        // JOIN sale s ON s.sale_id = sd.sale_id
        // JOIN users us ON us.id = s.user_id
        // LEFT JOIN customer c ON c.customer_id = s.customer_id
        // GROUP BY s.sale_id")->getResultArray();
    }
}
