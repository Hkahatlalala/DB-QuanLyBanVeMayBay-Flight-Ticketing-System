package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import java.util.Map;

public interface AircraftRepository extends JpaRepository<Aircraft, Integer> {
    
    // Đã bổ sung al.contact_info để lấy Hotline của hãng
    @Query(value = "SELECT a.id AS \"aircraftId\", " +
                   "a.number AS \"regNumber\", " + 
                   "al.name AS \"airlineName\", " +
                   "al.contact_info AS \"contactInfo\", " + // <-- THÊM DÒNG NÀY
                   "a.model AS \"aircraftModel\", " +
                   "a.total_seats AS \"totalSeat\", " +
                   "a.status AS \"status\" " +
                   "FROM aircraft a " +
                   "JOIN airline al ON a.airline_id = al.id", nativeQuery = true)
    List<Map<String, Object>> findAllAircraftInfo();
}