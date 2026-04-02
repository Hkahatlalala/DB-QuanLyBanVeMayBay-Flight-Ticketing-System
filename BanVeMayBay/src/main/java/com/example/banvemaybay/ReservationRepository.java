package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Map;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
    
    @Query(value = "SELECT r.id AS \"reservationId\", c.name AS \"customerName\", c.phone_no AS \"customerPhone\", " +
                   "r.created_at AS \"createdAt\", r.status AS \"status\", " +
                   "(SELECT COUNT(*) FROM ticket t WHERE t.reservation_id = r.id) AS \"ticketCount\", " +
                   "(SELECT IFNULL(SUM(price), 0) FROM ticket t WHERE t.reservation_id = r.id) AS \"totalAmount\" " +
                   "FROM reservation r JOIN customer c ON r.customer_id = c.id ORDER BY r.created_at DESC", nativeQuery = true)
    List<Map<String, Object>> findAllReservationInfo();

    // DUYỆT ĐƠN: Tạo dòng status = 1 (Chỉ tạo nếu chưa có dòng 1 nào)
    @Modifying
    @Transactional
    @Query(value = "INSERT INTO payment (reservation_id, amount, method, status, payment_time) " +
                   "SELECT ?1, (SELECT IFNULL(SUM(price), 0) FROM ticket WHERE reservation_id = ?1), 'transfer', 1, ?2 " +
                   "FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM payment WHERE reservation_id = ?1 AND status = 1)", nativeQuery = true)
    void confirmPaymentSafe(Integer reservationId, String exactTime);

    // HỦY ĐƠN: TẠO THÊM 1 DÒNG MỚI status = 2 (Chỉ tạo nếu ĐÃ CÓ dòng 1 và CHƯA CÓ dòng 2)
    @Modifying
    @Transactional
    @Query(value = "INSERT INTO payment (reservation_id, amount, method, status, payment_time) " +
                   "SELECT ?1, amount, method, 2, ?2 " +
                   "FROM payment WHERE reservation_id = ?1 AND status = 1 " +
                   "AND NOT EXISTS (SELECT 1 FROM (SELECT id FROM payment WHERE reservation_id = ?1 AND status = 2) AS tmp) LIMIT 1", nativeQuery = true)
    void refundPaymentSafe(Integer reservationId, String exactTime);
}