<?php
session_start();
include 'DB.php';
$user = $_SESSION["u"];
$pass = $_SESSION["p"];
if (!check($user, $pass)) {
    echo "Bạn chưa đăng nhập thành công!\nVui lòng F5 đăng nhập lại.";
    die();
}

if (!isset($_POST['key'])){
    echo "Thiếu thông tin";
    die();
}

$key = $_POST['key'];
$isDel = deleteKey($user,$key);
if ($isDel){
    echo "Xóa key '$key' thành công";
} else {
    echo "Key không tồn tại trong cơ sở dữ liệu admin của bạn!";
}