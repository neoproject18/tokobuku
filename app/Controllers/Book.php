<?php

namespace App\Controllers;

use \App\Models\BookModel;
use \App\Models\CategoryModel;
use PhpOffice\PhpSpreadsheet\Reader\Xls;
use PhpOffice\PhpSpreadsheet\Reader\Xlsx;

class Book extends BaseController
{
    private $bookModel, $catModel;
    public function __construct()
    {
        $this->bookModel = new BookModel();
        $this->catModel = new CategoryModel();
    }

    public function index()
    {
        // $dataBook = $this->bookModel->findAll();
        $dataBook = $this->bookModel->getBook();
        $data = [
            'title' => 'Data Buku',
            'result' => $dataBook
        ];
        return view('book/index', $data);
    }

    public function detail($slug)
    {
        $dataBook = $this->bookModel->getBook($slug);
        $data = [
            'title' => 'Detail Buku',
            'result' => $dataBook
        ];

        // Jika data bukunya kosong
        if (empty($dataBook)) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException("Judul buku $slug tidak ditemukan!");
        }
        return view('book/detail', $data);
    }

    public function create()
    {
        // session();
        $data = [
            'title' => 'Tambah Buku',
            'category' => $this->catModel->findAll(),
            'validation' => \Config\Services::validation()
        ];
        return view('book/create', $data);
    }

    public function save()
    {
        // Validasi Input
        if (!$this->validate([
            'title' => [
                'rules' => 'required|is_unique[book.title]',
                'label' => 'Judul',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'is_unique' => '{field} hanya sudah ada'
                ]
            ],
            'release_year' => [
                'rules' => 'required|integer',
                'label' => 'Tahun terbit',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'integer' => '{field} hanya boleh angka'
                ]
            ],
            'author' => [
                'rules' => 'required',
                'label' => 'Penulis',
                'errors' => [
                    'required' => '{field} harus diisi',
                ]
            ],
            'price' => [
                'rules' => 'required|numeric',
                'label' => 'Harga',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'numeric' => '{field} hanya boleh angka'
                ]
            ],
            'discount' => [
                'rules' => 'permit_empty|decimal',
                'label' => 'Diskon',
                'errors' => [
                    'decimal' => '{field} hanya boleh angka'
                ]
            ],
            'stock' => [
                'rules' => 'required|integer',
                'label' => 'Stok',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'integer' => '{field} hanya boleh angka'
                ]
            ],
            'cover' =>
            [
                'rules' => 'max_size[cover,1024]|is_image[cover]|mime_in[cover,image/jpg,image/jpeg,image/png]',
                'label' => 'Kover',
                'errors' => [
                    'max_size' => 'Gambar tidak boleh lebih dari 1MB!',
                    'is_image' => 'Yang anda pilih bukan gambar!',
                    'mime_in' => 'Yang anda pilih bukan gambar!',
                ]
            ],
        ])) {
            return redirect()->to('/book/create')->withInput();
        }

        // Mengambil File Kover
        $file_cover = $this->request->getFile('cover');
        if (
            $file_cover->getError() == 4
        ) { // Artinya tidak ada file yg diupload
            $nama_file = $this->defaultImage;
        } else {
            // Generate Nama file
            $nama_file = $file_cover->getRandomName();
            // Pindahkan File ke Folder img di public
            $file_cover->move(
                'img',
                $nama_file
            );
            // Ambil nama file
            // $nama_file = $file_cover->getName();
        }

        $slug = url_title($this->request->getVar('title'), '-', true);
        $this->bookModel->save([
            'title' => $this->request->getVar('title'),
            'author' => $this->request->getVar('author'),
            'release_year' => $this->request->getVar('release_year'),
            'price' => $this->request->getVar('price'),
            'discount' => $this->request->getVar('discount'),
            'stock' => $this->request->getVar('stock'),
            'book_category_id' => $this->request->getVar('book_category_id'),
            'slug' => $slug,
            'cover' => $nama_file
        ]);

        session()->setFlashdata("msg", "Data berhasil ditambahkan!");
        return redirect()->to('/book');
    }

    public function delete($id)
    {
        // Cari gambar by ID
        $dataBook = $this->bookModel->find($id);
        $this->bookModel->delete($id);

        // Jika sampulnya default
        if ($dataBook['cover'] != $this->defaultImage) {
            // hapus gambar
            unlink('img/' . $dataBook['cover']);
        }
        session()->setFlashdata("msg", "Data berhasil dihapus!");
        return redirect()->to('/book');
    }

    public function edit($slug)
    {
        $dataBook = $this->bookModel->getBook($slug);
        // Jika data bukunya kosong
        if (empty($dataBook)) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException("Judul buku $slug tidak ditemukan!");
        }

        $data = [
            'title' => 'Ubah Buku',
            'category' => $this->catModel->findAll(),
            'validation' => \Config\Services::validation(),
            'result' => $dataBook
        ];
        return view('book/edit', $data);
    }

    public function update($id)
    {
        // Cek judul
        $dataOld = $this->bookModel->getBook($this->request->getVar('slug'));
        if ($dataOld['title'] == $this->request->getVar('title')) {
            $rule_title = 'required';
        } else {
            $rule_title = 'required|is_unique[book.title]';
        }

        // Validasi Data
        if (!$this->validate([
            'title' => [
                'rules' => $rule_title,
                'label' => 'Judul',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'is_unique' => '{field} hanya sudah ada'
                ]
            ],
            'release_year' => [
                'rules' => 'required|integer',
                'label' => 'Tahun terbit',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'integer' => '{field} hanya boleh angka'
                ]
            ],
            'author' => [
                'rules' => 'required',
                'label' => 'Penulis',
                'errors' => [
                    'required' => '{field} harus diisi',
                ]
            ],
            'price' => [
                'rules' => 'required|numeric',
                'label' => 'Harga',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'numeric' => '{field} hanya boleh angka'
                ]
            ],
            'discount' => [
                'rules' => 'permit_empty|decimal',
                'label' => 'Diskon',
                'errors' => [
                    'decimal' => '{field} hanya boleh angka'
                ]
            ],
            'stock' => [
                'rules' => 'required|integer',
                'label' => 'Stok',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'integer' => '{field} hanya boleh angka'
                ]
            ],
            'cover' =>
            [
                'rules' => 'max_size[cover,1024]|is_image[cover]|mime_in[cover,image/jpg,image/jpeg,image/png]',
                'label' => 'Kover',
                'errors' => [
                    'max_size' => 'Gambar tidak boleh lebih dari 1MB!',
                    'is_image' => 'Yang anda pilih bukan gambar!',
                    'mime_in' => 'Yang anda pilih bukan gambar!',
                ]
            ],
        ])) {
            return redirect()->to('/book/edit/' . $this->request->getVar('slug'))->withInput();
        }

        $nama_file_lama = $this->request->getVar('coverlama');
        // Mengambil File Sampul
        $file_cover = $this->request->getFile('cover');
        // Cek gambar, apakah masih gambar lama
        if ($file_cover->getError() == 4) {
            $nama_file = $nama_file_lama;
        } else {
            // Generate Nama file
            $nama_file = $file_cover->getRandomName();
            // Pindahkan File ke Folder img di public
            $file_cover->move('img', $nama_file);

            // Jika sampulnya default
            if ($nama_file_lama != $this->defaultImage && $nama_file_lama != "") {
                // hapus gambar
                unlink('img/' . $nama_file_lama);
            }
        }

        // Membuat string menjadi huruf kecil semua dan spasinya diganti -
        $slug = url_title($this->request->getVar('title'), '-', true);
        $this->bookModel->save([
            'book_id' => $id,
            'title' => $this->request->getVar('title'),
            'author' => $this->request->getVar('author'),
            'release_year' => $this->request->getVar('release_year'),
            'price' => $this->request->getVar('price'),
            'discount' => $this->request->getVar('discount'),
            'stock' => $this->request->getVar('stock'),
            'book_category_id' => $this->request->getVar('book_category_id'),
            'slug' => $slug,
            'cover' => $nama_file
        ]);

        session()->setFlashdata("msg", "Data berhasil diubah!");

        return redirect()->to('/book');
    }

    public function importData()
    {
        $file = $this->request->getFile("file");
        $ext = $file->getExtension();
        if ($ext == "xls")
            $reader = new Xls();
        else
            $reader = new Xlsx();

        $spreadsheet = $reader->load($file);
        $sheet = $spreadsheet->getActiveSheet()->toArray();

        foreach ($sheet as $key => $value) {
            if ($key == 0) continue;

            $namaFile = $this->defaultImage;
            $slug = url_title($value[1], '-', true);

            /** Field judul, penulis, tahun, harga, stok, dan kategori
             * Tidak Boleh NULL
             */

            if (
                $value[1] != "" && $value[2] != "" &&
                $value[3] != "" && $value[4] != "" &&
                $value[6] != "" && $value[7]
            ) {
                // Cek judul
                $dataBook = $this->bookModel->getBook($slug);

                if (empty($dataBook)) {
                    $this->bookModel->save([
                        'title' => $value[1],
                        'author' => $value[2],
                        'release_year' => $value[3],
                        'price' => $value[4],
                        'discount' => $value[5] ?? 0,
                        'stock' => $value[6],
                        'book_category_id' => $value[7],
                        'slug' => $slug,
                        'cover' => $namaFile
                    ]);
                }
            }
        }
        session()->setFlashdata("msg", "Data berhasil diimport!");

        return redirect()->to('/book');
    }
}
