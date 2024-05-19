if (window.self === window.top) {
    alert("Vui lòng truy cập trang chính.");
    window.location.href = "https://h1ax.site/core/";
}
document.addEventListener('DOMContentLoaded', function() {
    const keyInput = document.getElementById('keyInput');
    const submitButton = document.getElementById('submitButton');
    const messageBox = document.getElementById('messageBox');

    submitButton.addEventListener('click', function() {
        const key = keyInput.value.trim(); // Lấy giá trị key và loại bỏ khoảng trắng thừa

        if (key === '') {
            showMessage('Vui lòng nhập key trước khi xóa!');
        } else {
            // Gửi yêu cầu AJAX đến php/xoakey.php
            fetch('php/reset.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'key=' + encodeURIComponent(key)
            })
            .then(response => response.text())
            .then(data => {
                showMessage(data); // Hiển thị phản hồi từ máy chủ
            })
            .catch(error => {
                showMessage('Có lỗi xảy ra: ' + error.message);
            });
        }
    });

    function showMessage(message) {
        messageBox.innerText = message;
        messageBox.style.display = 'block'; // Hiển thị khung thông báo
        
    }
});
