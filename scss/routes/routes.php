<?php

$request = $_SERVER['REQUEST_URI'];

/** SET ROUTES HERE */
// insert routes alphabetically
$routes = array(
    "customers" => array(
        'class_name' => 'Customers',
        'has_detail' => 1
    ),
    "discounts" => array(
        'class_name' => 'Discounts',
        'has_detail' => 1
    ),
    "expense" => array(
        'class_name' => 'Expense',
        'has_detail' => 1
    ),
    "expense-category" => array(
        'class_name' => 'ExpenseCategories',
        'has_detail' => 0
    ),
    "homepage" => array(
        'class_name' => '',
        'has_detail' => 0
    ),
    "inventory-report" => array(
        'class_name' => 'InventoryReport',
        'has_detail' => 0
    ),
    "products" => array(
        'class_name' => 'Products',
        'has_detail' => 0
    ),
    "product-categories" => array(
        'class_name' => 'ProductCategories',
        'has_detail' => 0
    ),
    "sales" => array(
        'class_name' => 'Sales',
        'has_detail' => 1
    ),
    "sales-return" => array(
        'class_name' => 'SalesReturn',
        'has_detail' => 1
    ),
    "stock-card" => array(
        'class_name' => 'StockCard',
        'has_detail' => 0
    ),
    "suppliers" => array(
        'class_name' => 'Suppliers',
        'has_detail' => 0
    ),
    "purchase-order" => array(
        'class_name' => 'PurchaseOrder',
        'has_detail' => 1
    ),
    "purchase-return" => array(
        'class_name' => 'PurchaseReturn',
        'has_detail' => 1
    ),
    "customer-payment" => array(
        'class_name' => 'CustomerPayment',
        'has_detail' => 1
    ),
    "supplier-payment" => array(
        'class_name' => 'SupplierPayment',
        'has_detail' => 1
    ),
    "users" => array(
        'class_name' => 'Users',
        'has_detail' => 0
    ),
    "payable-report" => array(
        'class_name' => 'PayableReport',
        'has_detail' => 0
    ),
    "payable-ledger" => array(
        'class_name' => 'PayableLedger',
        'has_detail' => 0
    ),
    "payment-option" => array(
        'class_name' => 'PaymentOption',
        'has_detail' => 0
    ),
    "job-order" => array(
        'class_name' => 'JobOrder',
        'has_detail' => 1
    )

);
/** END SET ROUTES */


$base_folder = "pages/";
$page = str_replace("/pos/", "", $request);

// chec if has parameters
if (substr_count($page, "?") > 0) {
    $url_params = explode("?", $page);
    $dir = $base_folder . $url_params[0] . '/index.php';
    //$param = $url_params[1];
    $page = $url_params[0];
} else {

    if ($page == "" || $page == null) {
        $page = "homepage";
    }
    $dir = $base_folder . $page . '/index.php';
}


if (array_key_exists($page, $routes)) {
    require_once $dir;
    $route_settings = json_encode($routes[$page]);
} else {
    require_once 'pages/404/index.php';
    $route_settings = json_encode([]);
}
