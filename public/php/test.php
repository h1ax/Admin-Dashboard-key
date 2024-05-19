<?php
define("CIPHER_KEY", 13); // Số lượng vị trí dịch chuyển cho mỗi byte

// Hàm giải mã CipherSaber
function decrypt($input, $key) {
    $output = '';
    $length = strlen($input);
    for ($i = 0; $i < $length; $i++) {
        $output .= chr(ord($input[$i]) ^ ord($key[$i % CIPHER_KEY]));
    }
    return $output;
}

// Ví dụ về việc sử dụng hàm giải mã
$ciphertext = "Uryyb, jbeyq!";
$key = "ThisIsASecretKey";

$decrypted = decrypt($ciphertext, $key);
echo "Decrypted: $decrypted\n";
?>
