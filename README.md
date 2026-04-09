# FLIGHT TICKETING SYSTEM - KAL TRAVEL

## 1. Giới thiệu dự án
---
* **Học phần:** Cơ sở dữ liệu (PTIT).
* **Đề tài:** Hệ thống quản lý và bán vé máy bay (KAL AirTravel).
* **Thời gian thực hiện:** 08 tuần (Tháng 02/2026 - 04/2026).
* **Bối cảnh:** Giải quyết bài toán quản lý lịch trình bay phức tạp, số hóa quy trình đặt vé máy bay linh hoạt (một chiều/khứ hồi) và kiểm soát doanh thu chặt chẽ cho các phòng vé, đại lý hàng không.

## 2. Thành viên thực hiện
---
* **Hoàng Kỳ Anh - B24DCGA006:** Lập trình Backend, Frontend, thiết kế cơ sở dữ liệu và kết nối API.
* **Nguyễn Đăng Bá Khôi - B24DCGA078:** Thiết kế CSDL quan hệ, chuẩn hóa dữ liệu về dạng 3NF, thiết lập khóa và các ràng buộc.
* **Lưu Hải Lộc - B24DCGA086:** Xây dựng sơ đồ thực thể liên kết (ERD), viết báo cáo và chuẩn bị slide thuyết trình.

## 3. Kiến trúc công nghệ
---
Hệ thống được phát triển trên mô hình Frontend - Backend tách biệt qua giao thức RESTful API:

**Frontend**
* **Ngôn ngữ:** HTML5, CSS3, JavaScript.
* **Xử lý API:** Fetch API (Vanilla JS).

**Backend**
* **Platform:** Java Spring Boot.
* **Framework:** Spring Web, Spring Data JPA.

**Database**
* **Engine:** MySQL.

## 4. Các chức năng chính
---
* **Quản lý Mạng lưới bay & Hạ tầng:** Lưu trữ danh mục hãng hàng không, đội tàu bay (sức chứa), và thông tin các sân bay (điểm đi/điểm đến).
* **Quản lý Chuyến bay & Giá vé:** Thiết lập lịch trình bay (giờ cất/hạ cánh) và tự động áp dụng giá vé động theo từng phân hạng ghế (Phổ thông, Thương gia,...).
* **Quản lý Đặt chỗ & Khách hàng:** Hỗ trợ quy trình tra cứu chuyến bay đa điều kiện, xử lý giỏ hàng đặt vé đa hành khách và lưu trữ thông tin thanh toán.
* **Truy vấn & Thống kê:** Tìm kiếm chuyến bay theo thời gian thực, lọc theo hãng bay và tự động tính toán tổng doanh thu hóa đơn.

## 5. Cài đặt và Chạy thử
---
### Yêu cầu hệ thống
* Java JDK 17+
* MySQL 8.0+
* Môi trường chạy Web (XAMPP / VSCode Live Server)

### Các bước cài đặt
1. **Database:**
   * Mở MySQL Workbench hoặc phpMyAdmin (XAMPP).
   * Tạo database mới tên là `ban_ve`.
   * Chạy script SQL từ file `ban_ve_setup.sql` để khởi tạo bảng và dữ liệu mẫu.
2. **Backend:**
   * Mở project Java bằng IntelliJ IDEA hoặc Eclipse.
   * Cập nhật `spring.datasource.username` và `password` trong file `application.properties` cho khớp với MySQL của máy.
   * Đợi Maven tải thư viện và chạy ứng dụng (Mặc định ở cổng `8080`).
3. **Frontend:**
   * Mở thư mục chứa các file giao diện (HTML/CSS/JS).
   * Khởi chạy thông qua XAMPP (cổng `80`) hoặc dùng extension Live Server trên VS Code.
   * Truy cập vào trình duyệt và trải nghiệm hệ thống.
