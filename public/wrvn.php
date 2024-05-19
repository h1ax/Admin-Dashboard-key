<?php
include 'php/DB.php';
//include 'php/lib1.php';

$query = dec($_POST);

if (!isset($query['key']) || !isset($query['id'])){
    echo "Thiếu thông Tin $query";
    die();
}

$key = dec($query['key']);
$id  = dec($query['id']);

if (readKey($key, $id)){
    echo enc("com.riotgames.league.wildriftvn");
} else {
    die();
}
?>