if (window.self === window.top) {
    alert("Vui lòng truy cập trang chính.");
    window.location.href = "https://h1ax.site/core/";
}
document.addEventListener('DOMContentLoaded', function() {
    const keyTableBody = document.getElementById('keyTableBody');

    // Hàm để thêm dữ liệu key vào bảng
    function addKeyToTable(keyData) {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${keyData.key || ''}</td>
            <td>${keyData.startDate || 'Chưa đăng nhập'}</td>
            <td>${keyData.endDate || 'Chưa đăng nhập'}</td>
            <td>${keyData.len || ''}</td>
            <td>${keyData.udid || 'Chưa đăng nhập'}</td>
        `;
        keyTableBody.appendChild(row);
    }

    // Hàm để lấy dữ liệu từ PHP và hiển thị
    function fetchData(size, page, search) {
        fetch('php/view.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: `size=${size}&page=${page}&search=${search}`
        })
        .then(response => response.json())
        .then(data => {
            keyTableBody.innerHTML = ''; // Clear existing rows
            data.forEach(function(key) {
                addKeyToTable(key);
            });
        })
        .catch(error => console.error('Error fetching data:', error));
    }

    // Hàm tìm kiếm key
    function searchKey() {
        const searchInput = document.getElementById('search').value.trim();
        fetchData(50, 1, searchInput);
    }

    // Gọi hàm fetchData khi trang được tải với kích thước dữ liệu là 50 và trang là 1
    fetchData(50, 1, '');
});
