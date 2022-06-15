<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use CodeIgniter\I18n\Time;

class CustomerSeeder extends Seeder
{
    public function run()
    {
        $faker = \Faker\Factory::create('id_ID');
        for ($i = 0; $i < 100; $i++) {
            $data = [
                'name' => $faker->name,
                'no_customer' => $faker->nik,
                'gender' => $faker->title == "Ms" || $faker->title == "Miss" ? 'P' : 'L',
                'address' => $faker->address,
                'email' => $faker->email,
                'phone' => $faker->phoneNumber,
                'created_at' => Time::createFromTimestamp($faker->unixTime()),
                'updated_at' => Time::createFromTimestamp($faker->unixTime()),
            ];
            $this->db->table('customer')->insert($data);
        }

        // $data = [
        //     [
        //         'name' => 'Ki Anom',
        //         'no_customer' => '1',
        //         'gender' => 'L',
        //         'address' => 'Jalan janti 65',
        //         'email' => 'example@mail.com',
        //         'phone' => '08523654896',
        //         'created_at' => Time::now(),
        //         'updated_at' => Time::now(),
        //     ],
        //     [
        //         'name' => 'Dharma',
        //         'no_customer' => '2',
        //         'gender' => 'L',
        //         'address' => 'Jalan janti 65',
        //         'email' => 'example@mail.com',
        //         'phone' => '08523654896',
        //         'created_at' => Time::now(),
        //         'updated_at' => Time::now(),
        //     ],
        //     [
        //         'name' => 'Bekti',
        //         'no_customer' => '3',
        //         'gender' => 'L',
        //         'address' => 'Jalan janti 65',
        //         'email' => 'example@mail.com',
        //         'phone' => '08523654896',
        //         'created_at' => Time::now(),
        //         'updated_at' => Time::now(),
        //     ]
        // ];

        // Simple Queries
        // $this->db->query("INSERT INTO customer (name, no_customer, gender, address, email, phone, created_at, updated_at) VALUES(:name:, :no_customer:, :gender:, :address:, :email:, :phone:, :created_at:, :updated_at:)", $data);

        // Using Query Builder
        // $this->db->table('customer')->insertBatch($data);
    }
}
