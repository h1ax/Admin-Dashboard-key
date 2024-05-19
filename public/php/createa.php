<?php
session_start();
include 'DB.php';
//include 'lib.php';
$user = $_SESSION["u"];
$pass = $_SESSION["p"];
if (!check($user, $pass)) {
    echo "Bạn chưa đăng nhập thành công!\nVui lòng F5 đăng nhập lại.";
    die();
}


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $u = $username;
    $p = $password;

    if (!isAdminDB($user)){
        echo "Bạn không phải Admin<br>Nếu muốn thêm Slot Reseller vui lòng liên hệ admin.";
        die();
    }

    if (createReseller($username, $password)){
        echo "Tạo Reseller thành công<br>";
        echo "Thông tin seller:<br>";
        echo "Username: $username<br>";
        echo "Password: $password<br>";
        die();
    } else {
        echo "Tạo seller không thành công";
    }
    
}
?>
