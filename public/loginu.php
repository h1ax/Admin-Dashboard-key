<?php
include 'php/DB.php';
//include 'php/lib1.php';
if (!isset($_POST['key']) || !isset($_POST['id'])){
    echo "Thi�6�5u th�0�0ng Tin";
    die();
}

$key = dec($_POST['key']);
$id  = dec($_POST['id']);

if (readKey($key, $id)){
    die();
} else {
    die();
}
?>