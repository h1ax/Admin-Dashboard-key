<?php
session_start();

// Kiểm tra session
if (isset($_SESSION['u']) && isset($_SESSION['p'])) {
    echo 1; // Trả về 1 nếu session tồn tại
} else {
    echo 0; // Trả về 0 nếu session không tồn tại
}
?>
