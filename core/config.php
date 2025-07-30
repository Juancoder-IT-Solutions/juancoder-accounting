<?php
error_reporting(0);
ini_set('date.timezone','Asia/Manila');
date_default_timezone_set('Asia/Manila');
require 'env.php';

// connection

// START THE SESSION
session_start();

// THIS WILL LOAD ONLY THE NEEDED CLASS
spl_autoload_register(function ($class) {

    include __DIR__ . '/autoloader.php';

    if (array_key_exists($class, $classes)) {
        require_once $classes[$class];
    }
});
