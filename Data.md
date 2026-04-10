## 🔒 Data Privacy & Security (Phân loại Dữ liệu)

Hệ thống được thiết kế với tư duy bảo mật dữ liệu đặt lên hàng đầu (Privacy-First), phân tách rõ ràng giữa dữ liệu vận hành công khai và dữ liệu cá nhân nhạy cảm của khách hàng.

### 🟢 Public Data (Dữ liệu Vận hành Công khai)
Đây là các danh mục dùng chung, cho phép mọi người dùng truy cập và tìm kiếm trên hệ thống:

* **`flight` (Lịch trình bay):** Giờ cất/hạ cánh, mã chuyến bay, trạng thái chuyến bay.
* **`class_price` (Bảng giá vé):** Giá vé công khai niêm yết theo từng hạng ghế (Economy, Business, First Class).
* **`airport` & `city` (Điểm đến):** Danh mục Sân bay và Thành phố trực thuộc.
* **`airline` & `aircraft` (Hãng & Tàu bay):** Thông tin đội tàu bay, mã IATA của hãng hàng không.

### 🔴 Private Data (Dữ liệu Nhạy cảm & Giao dịch)
Nhóm dữ liệu này được bảo vệ nghiêm ngặt. **Tuyệt đối** chỉ có chủ sở hữu tài khoản (đã xác thực) hoặc Quản trị viên hệ thống (Admin) mới có quyền truy xuất:

* **`customer` (Tài khoản Khách hàng):** Thông tin đăng nhập (`username`, `password`), số điện thoại, email liên hệ. *(Lưu ý: Mật khẩu cần được băm/mã hóa trong môi trường production).*
* **`passenger` (Định danh Hành khách):** Dữ liệu PII (Personally Identifiable Information) bao gồm: **Số CCCD/Hộ chiếu/Khai sinh**, Ngày sinh, Quốc tịch, và Địa chỉ.
* **`payment` (Lịch sử Giao dịch):** Thông tin dòng tiền, số tiền đối soát (`amount`), trạng thái thanh toán (Thu/Hoàn tiền).
* **`reservation` & `ticket` (Hành trình Cá nhân):** Chi tiết đơn đặt chỗ, lộ trình di chuyển và **vị trí ghế ngồi (Seat No)** của từng cá nhân.

> ⚠️ **Security Note:** Trong các API trả về dữ liệu Private (ví dụ: `GET /api/my-bookings`), Backend luôn yêu cầu xác thực người dùng (Authentication) để đảm bảo User A không thể truy cập vào dữ liệu lịch trình hoặc CCCD của User B.
