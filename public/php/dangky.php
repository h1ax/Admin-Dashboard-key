<?php
session_start();
include 'DB.php';
//include 'lib.php';
$user = $_SESSION["u"];
$pass = $_SESSION["p"];
if (!check($user, $pass)) {
    echo "Bạn chưa đăng nhập thành công!\nVui lòng F5 đăng nhập lại.$user.$pass";
    
    die();
}

function generateRandomString($length = 16) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
    return $randomString;
}

$nums = intval($_POST['number']);
$time = intval($_POST['time']);
if (!isset($nums) || !isset($time)){
    echo "Vui lòng nhập đầy đủ thông tin!";
    die();
}

switch ($time){
        case 1:
            $prefixtime = '2H';
            $day = 2;
            break;
        case 2:
            $prefixtime = '1D';
            $day = 24;
            break;
        case 3:
            $prefixtime = '7D';
            $day = 24 * 7;
            break;
        case 4:
            $prefixtime = '30D';
            $day = 24 * 30;
            break;
    }


$prefix = $user . '_' . $prefixtime . '_';

for ($x = 0; $x < $nums; $x++) {
    $fix = generateRandomString(15);
    $key = $prefix . $fix;
    if (addKey($user, $key, NULL, NULL, $day, NULL)) {
        echo "$key\n";
    }
}


?>