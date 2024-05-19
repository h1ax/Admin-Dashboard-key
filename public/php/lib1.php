<?php
function generateRandomString($length = 16) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
    return $randomString;
}

function encode($str, $key) {
    $len = strlen($str);
    $encodedStr = '';
    
    for ($i = 0; $i < $len; $i++) {
        $encodedStr .= chr(ord($str[$i]) ^ ord($key));
    }

    return $encodedStr;
}

function decode($str, $key) {
    return encode($str, $key);
}

function hexCharToInt($hex) {
    if ($hex >= '0' && $hex <= '9') {
        return ord($hex) - ord('0');
    } elseif ($hex >= 'A' && $hex <= 'F') {
        return ord($hex) - ord('A') + 10;
    } elseif ($hex >= 'a' && $hex <= 'f') {
        return ord($hex) - ord('a') + 10;
    }
    return -1;
}

function intToHexChar($num) {
    if ($num >= 0 && $num <= 9) {
        return chr($num + ord('0'));
    } elseif ($num >= 10 && $num <= 15) {
        return chr($num - 10 + ord('A'));
    }
    return '';
}

function encodeToHex($str) {
    $len = strlen($str);
    $hexStr = '';

    for ($i = 0; $i < $len; $i++) {
        $hexStr .= intToHexChar(ord($str[$i]) >> 4);
        $hexStr .= intToHexChar(ord($str[$i]) & 0x0F);
    }

    return $hexStr;
}

function decodeFromHex($hexStr) {
    $len = strlen($hexStr);
    if ($len % 2 != 0) {
        return null;
    }

    $str = '';

    for ($i = 0; $i < $len / 2; $i++) {
        $high = hexCharToInt($hexStr[$i * 2]);
        $low = hexCharToInt($hexStr[$i * 2 + 1]);
        $str .= chr(($high << 4) | $low);
    }

    return $str;
}

function enc($m) {
    $encoded = encode($m, 'k');
    if (!$encoded) return null;

    $encodedHex = encodeToHex($encoded);
    return $encodedHex;
}

function dec($m) {
    $decodedHex = decodeFromHex($m);
    if (!$decodedHex) return null;

    $decoded = decode($decodedHex, 'k');
    return $decoded;
}

?>
