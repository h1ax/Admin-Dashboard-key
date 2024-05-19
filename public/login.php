<?php
include 'php/DB.php';
if (!isset($_POST['key']) || !isset($_POST['id'])){
    echo "Thiếu thông Tin";
    die();
}

$key = $_POST['key'];
$id  = $_POST['id'];

if (readKey($key, $id)){
    echo 'com.riotgames.league.wildriftvn';
    die();
}