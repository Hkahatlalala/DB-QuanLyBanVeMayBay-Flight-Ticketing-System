package com.example.banvemaybay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/booking")
public class BookingController {

    @Autowired
    private ReservationRepository reservationRepository;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostMapping("/create")
    @Transactional 
    public Map<String, Object> createBooking(@RequestBody BookingPayload payload) {
        try {
            // ===============================================
            // BƯỚC 1: TẠO ĐƠN ĐẶT CHỖ (BẢNG RESERVATION)
            // ===============================================
            Reservation res = new Reservation();
            res.setCustomerId(payload.getCustomerId()); 
            res.setStatus("pending"); 
            res.setCreatedAt(LocalDateTime.now());
            
            Reservation savedRes = reservationRepository.save(res);
            Integer resId = savedRes.getId();

            // ===============================================
            // BƯỚC 2: LƯU HÀNH KHÁCH VÀ TẠO VÉ
            // ===============================================
            double pricePerTicket = payload.getTotalAmount() / payload.getPassengers().size();

            for (PassengerInfo p : payload.getPassengers()) {
                
                // --- 2A. Lưu thông tin Hành khách bay đầy đủ ---
                String dob = (p.getDob() != null && !p.getDob().isEmpty()) ? p.getDob() : "2000-01-01";
                
                // Đã cập nhật câu lệnh Insert thêm address, phone, email, nationality
                String insertPassengerSql = "INSERT INTO passenger (name, passport_no, DOB, address, phone_no, email, nationality) VALUES (?, ?, ?, ?, ?, ?, ?)";
                jdbcTemplate.update(insertPassengerSql, 
                    p.getName(), 
                    p.getPassport(), 
                    dob,
                    p.getAddress(),
                    p.getPhone(),
                    p.getEmail(),
                    p.getNationality()
                );
                
                Integer passengerId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

                // --- 2B. Tạo Vé ---
                String insertTicketSql = "INSERT INTO ticket (passenger_id, reservation_id, flight_id, seat_class, seat_no, price, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
                jdbcTemplate.update(insertTicketSql, 
                    passengerId, 
                    resId, 
                    payload.getFlightId(), 
                    payload.getSeatClass(), 
                    null,  
                    pricePerTicket, 
                    "booked" 
                );
            }

            // ===============================================
            // BƯỚC 3: BÁO CÁO THÀNH CÔNG
            // ===============================================
            return Map.of(
                "success", true,
                "reservationId", resId,
                "message", "Đặt vé thành công!"
            );

        } catch (Exception e) {
            e.printStackTrace();
            return Map.of("success", false, "message", "Lỗi hệ thống: " + e.getMessage());
        }
    }

    // ==============================================================
    // CÁC CLASS ĐỂ HỨNG DỮ LIỆU TỪ CHECKOUT
    // ==============================================================
    public static class BookingPayload {
        private Integer flightId;
        private String seatClass;
        private Double totalAmount;
        private Integer ticketCount;
        private String customerId; 
        private List<PassengerInfo> passengers;

        public Integer getFlightId() { return flightId; }
        public String getSeatClass() { return seatClass; }
        public Double getTotalAmount() { return totalAmount; }
        public Integer getTicketCount() { return ticketCount; }
        public String getCustomerId() { return customerId; }
        public List<PassengerInfo> getPassengers() { return passengers; }
    }

    public static class PassengerInfo {
        private String name;
        private String passport;
        private String dob;
        
        // CÁC TRƯỜNG MỚI ĐƯỢC BỔ SUNG
        private String nationality;
        private String phone;
        private String email;
        private String address;

        public String getName() { return name; }
        public String getPassport() { return passport; }
        public String getDob() { return dob; }
        public String getNationality() { return nationality; }
        public String getPhone() { return phone; }
        public String getEmail() { return email; }
        public String getAddress() { return address; }
    }
}