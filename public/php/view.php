<?php
session_start();
include 'DB.php';

if (!isset($_POST['size']) || !isset($_POST['page'])) {
    echo json_encode(["message" => "Thi�6�5u th�0�0ng tin"]);
    die();
}

$size = (int)$_POST['size'];
$page = (int)$_POST['page'];
$search = isset($_POST['search']) ? $_POST['search'] : '';

$data = viewkey($size, $page, $search);
echo $data;
?>
