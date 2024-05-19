<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $u = $username;
    $p = $password;
    // Bao gồm tệp kết nối cơ sở dữ liệu
    include 'DB.php';

    // Kiểm tra thông tin đăng nhập
    if (check($u, $p)) {
        //setcookie("user_session", "123", time() + 3600, "/"); // Đặt cookie trong 1 tiếng
        $_SESSION["u"] = $u;
        $_SESSION["p"] = $p;
        header('Location: ../core.html');
    } else {
        echo "Sai tài khoản hoặc mật khẩu";
    }
}
?>
