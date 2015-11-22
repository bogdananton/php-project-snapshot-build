<?php

$autoload = __DIR__ . '/../vendor/autoload.php';

if (!file_exists($autoload)) {
    die('run "composer install" first.');
}

require_once $autoload;

