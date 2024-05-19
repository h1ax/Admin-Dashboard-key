if (window.self === window.top) {
    alert("Vui lòng truy cập trang chính.");
    window.location.href = "https://h1ax.site/core/";
}
document.addEventListener('DOMContentLoaded', function() {
    const registerForm = document.getElementById('register-form');
    const responseDiv = document.getElementById('response');
    const timeCheckboxes = document.querySelectorAll('input[name="time"]');

    // Lắng nghe sự kiện khi một checkbox được chọn
    timeCheckboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            // Nếu checkbox hiện tại được chọn, hãy loại bỏ chọn khỏi các checkbox khác
            if (this.checked) {
                timeCheckboxes.forEach(function(otherCheckbox) {
                    if (otherCheckbox !== checkbox) {
                        otherCheckbox.checked = false;
                    }
                });
            }
        });
    });

    registerForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Ngăn chặn gửi form mặc định

        // Lấy giá trị từ các phần tử trong form
        const numberInput = document.getElementById('number').value;
        const checkedTimeCheckbox = document.querySelector('input[name="time"]:checked');

        if (checkedTimeCheckbox && numberInput) {
            const formData = new FormData();
            formData.append('number', numberInput);
            formData.append('time', checkedTimeCheckbox.value);

            // Gửi dữ liệu tới php/dangky.php
            fetch('php/dangky.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                responseDiv.innerText = data;
            })
            .catch(error => {
                console.error('Error:', error);
                responseDiv.innerText = 'Đã có lỗi xảy ra. Vui lòng thử lại.';
            });
        } else {
            responseDiv.innerText = "Vui lòng chọn đầy đủ thông tin.";
        }
    });
});
