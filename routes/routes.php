<?php

$request = $_SERVER['REQUEST_URI'];

$base_folder = "pages/";
$page = str_replace("/juancoder-accounting/", "", $request);

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

$Menus = new Menus();
$Menus->routes($page, $dir);

require_once $Menus->dir;
$route_settings = json_encode($Menus->route_settings);

$Settings = new Settings();
$company_profile = json_encode($Settings->view());
