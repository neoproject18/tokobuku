<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->post('/chart-transaksi', 'Home::showChartTransaksi');
$routes->post('/chart-customer', 'Home::showChartCustomer');

$routes->group('book', function ($r) {
    $r->get('/', 'Book::index');
    $r->get('create', 'Book::create');
    $r->post('create', 'Book::save');
    $r->post('import', 'Book::importData');
    $r->get('edit/(:any)', 'Book::edit/$1');
    $r->post('edit/(:any)', 'Book::update/$1');
    $r->delete('(:num)', 'Book::delete/$1');
    $r->get('exportword', 'Book::exportWord');
    $r->get('(:any)', 'Book::detail/$1');
});

$routes->group('supplier', function ($r) {
    $r->get('/', 'Supplier::index');
    $r->get('create', 'Supplier::create');
    $r->post('create', 'Supplier::save');
    $r->get('edit/(:num)', 'Supplier::edit/$1');
    $r->post('edit/(:num)', 'Supplier::update/$1');
    $r->delete('(:num)', 'Supplier::delete/$1');
});

$routes->group('users', function ($r) {
    $r->get('/', 'Users::index', ['filter' => 'role:Admin']);
    $r->get('index', 'Users::index', ['filter' => 'role:Admin']);
    $r->get('create', 'Users::create', ['filter' => 'role:Admin']);
    $r->post('create', 'Users::save', ['filter' => 'role:Admin']);
    $r->get('edit/(:num)', 'Users::edit/$1', ['filter' => 'role:Admin']);
    $r->post('edit/(:num)', 'Users::update/$1', ['filter' => 'role:Admin']);
    $r->delete('(:num)', 'Users::delete/$1', ['filter' => 'role:Admin']);
});

$routes->addRedirect('/customer', '/customer/index')->get('/customer/index', 'Customer::index')->setAutoRoute(true);

$routes->group('jual', function ($r) {
    $r->get('/', 'Penjualan::index');
    $r->get('load', 'Penjualan::loadCart');
    $r->get('gettotal', 'Penjualan::getTotal');
    $r->post('/', 'Penjualan::addCart');
    $r->post('update', 'Penjualan::updateCart');
    $r->post('bayar', 'Penjualan::pembayaran');
    $r->delete('(:any)', 'Penjualan::deleteCart/$1');
    $r->get('laporan', 'Penjualan::report');
    $r->get('exportpdf', 'Penjualan::exportPDF');
    $r->get('exportexcel', 'Penjualan::exportExcel');
});



// $routes->get('/book', 'Book::index');
// $routes->get('/book/create', 'Book::create');
// $routes->post('/book/create', 'Book::save');
// $routes->get('/book/edit/(:any)', 'Book::edit/$1');
// $routes->post('/book/edit/(:any)', 'Book::update/$1');
// $routes->delete('/book/(:num)', 'Book::delete/$1');
// $routes->get('/book/(:any)', 'Book::detail/$1');
// $routes->get('/coba/(:any)/(:num)', 'Home::about/$1/$2');

// $routes->addPlaceholder('uuid', '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}');
// $routes->get('coba2/(:uuid)', function ($uuid) {
//     echo "UUID: $uuid";
// });

// $routes->group('adm', function ($r) {
//     $r->get('users', 'Admin\Users::index');
//     $r->get('master', 'Admin\Master::index');
// });

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
