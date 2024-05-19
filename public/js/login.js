
        var user = sessionStorage.getItem('u');
        var pass = sessionStorage.getItem('p');
        // Kiểm tra và sử dụng giá trị đọc được
        if (user && pass) {
            window.location.href = "index.html";
        }
document.getElementById("login-button").addEventListener("click", function(event) {
    event.preventDefault(); // Ngăn chặn hành động mặc định của nút submit
    
    // Lấy giá trị từ form
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    
    // Tạo yêu cầu AJAX
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "php/login.php", true); // Đường dẫn tuyệt đối đến login.php
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Xử lý phản hồi từ server
                var response = JSON.parse(xhr.responseText);
                if (response.status === 1) {
                    // Thiết lập cookie
                    document.cookie = "core_panel=" + response.id;
                }
                document.getElementById("response-message").innerHTML = response.message;
            } else {
                // Xử lý lỗi
                console.error("Error:", xhr.statusText);
            }
        }
    };
    
    // Gửi dữ liệu form
    xhr.send("username=" + username + "&password=" + password);
});
