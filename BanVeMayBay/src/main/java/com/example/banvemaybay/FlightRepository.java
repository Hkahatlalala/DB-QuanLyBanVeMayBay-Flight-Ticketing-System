package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import java.util.Map;

public interface FlightRepository extends JpaRepository<Flight, Integer> {
    
    @Query(value = "SELECT f.id AS \"flightId\", al.name AS \"airlineName\", f.aircraft_id AS \"aircraftId\", " +
                   "ac.model AS \"aircraftModel\", city_dep.name AS \"departureLocation\", city_arr.name AS \"arrivalLocation\", " +
                   "f.scheduled_departure AS \"scheduledDeparture\", " +
                   "f.scheduled_arrival AS \"scheduledArrival\", " + // ĐÃ THÊM GIỜ ĐẾN
                   "f.status AS \"status\", " +
                   "(ac.total_seats - (SELECT COUNT(*) FROM ticket t WHERE t.flight_id = f.id AND t.status != 'cancelled')) AS \"availableSeats\" " +
                   "FROM flight f JOIN airline al ON f.airline_id = al.id JOIN airport ad ON f.departs_airport_id = ad.id " +
                   "JOIN city city_dep ON ad.city_id = city_dep.id JOIN airport aa ON f.arrives_airport_id = aa.id " +
                   "JOIN city city_arr ON aa.city_id = city_arr.id JOIN aircraft ac ON f.aircraft_id = ac.id", nativeQuery = true)
    List<Map<String, Object>> findAllFlightInfo();

    @Query(value = "SELECT f.id AS \"flightId\", al.name AS \"airlineName\", f.aircraft_id AS \"aircraftId\", " +
                   "ac.model AS \"aircraftModel\", city_dep.name AS \"departureLocation\", city_arr.name AS \"arrivalLocation\", " +
                   "f.scheduled_departure AS \"scheduledDeparture\", " +
                   "f.scheduled_arrival AS \"scheduledArrival\", " + // ĐÃ THÊM GIỜ ĐẾN
                   "f.status AS \"status\", " +
                   "MAX(CASE WHEN p.seat_class = 'Economy' THEN p.price ELSE 0 END) AS \"priceEconomy\", " +
                   "MAX(CASE WHEN p.seat_class = 'Premium' THEN p.price ELSE 0 END) AS \"pricePremium\", " +
                   "MAX(CASE WHEN p.seat_class = 'Business' THEN p.price ELSE 0 END) AS \"priceBusiness\", " +
                   "MAX(CASE WHEN p.seat_class = 'First' THEN p.price ELSE 0 END) AS \"priceFirst\" " +
                   "FROM flight f " +
                   "JOIN airline al ON f.airline_id = al.id " +
                   "JOIN airport ad ON f.departs_airport_id = ad.id " +
                   "JOIN city city_dep ON ad.city_id = city_dep.id " +
                   "JOIN airport aa ON f.arrives_airport_id = aa.id " +
                   "JOIN city city_arr ON aa.city_id = city_arr.id " +
                   "JOIN aircraft ac ON f.aircraft_id = ac.id " +
                   "LEFT JOIN flight_class_price p ON f.id = p.flight_id " +
                   "GROUP BY f.id", nativeQuery = true)
    List<Map<String, Object>> findAllFlightInfoWithPrices();

    @Query(value = "SELECT DATE_FORMAT(payment_time, '%d/%m/%Y %H:%i:%s') AS \"paymentDate\", " +
                   "CASE WHEN status = 2 THEN -amount ELSE amount END AS \"totalRevenue\", " +
                   "reservation_id AS \"reservationId\", " +
                   "status AS \"status\" " + 
                   "FROM payment WHERE status IN (1, 2) ORDER BY payment_time DESC", nativeQuery = true)
    List<Map<String, Object>> getDailyRevenue();
}