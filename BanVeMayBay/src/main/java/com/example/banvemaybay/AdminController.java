package com.example.banvemaybay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class AdminController {

    @Autowired private TicketRepository ticketRepository;
    @Autowired private CustomerRepository customerRepository;
    @Autowired private FlightRepository flightRepository;
    @Autowired private AircraftRepository aircraftRepository;
    @Autowired private ReservationRepository reservationRepository;
    
    @Autowired private JdbcTemplate jdbcTemplate;

    @GetMapping("/admin/login")
    public String showLoginPage() { return "forward:/admin/login.html"; }

    @PostMapping("/api/admin/login")
    public String handleLogin(@RequestParam String username, @RequestParam String password) {
        Optional<Customer> user = customerRepository.findByUsername(username);
        if (user.isPresent() && user.get().getPassword().equals(password)) {
            return "redirect:/admin/dashboard"; 
        }
        return "redirect:/admin/login?error=true"; 
    }

    @GetMapping("/admin/dashboard")
    public String showDashboard() { return "forward:/admin/dashboard.html"; }

    // ==========================================
    // ĐÃ SỬA: GỌI ĐÚNG HÀM CÓ KÈM BẢNG GIÁ TIỀN
    // ==========================================
    @GetMapping("/api/flights")
    @ResponseBody 
    public List<Map<String, Object>> getAllFlights() { 
        // Bắt buộc phải là findAllFlightInfoWithPrices() để có 4 cột giá
        return flightRepository.findAllFlightInfoWithPrices(); 
    }

    @GetMapping("/api/flights/detail/{id}")
    @ResponseBody 
    public Flight getFlightDetail(@PathVariable Integer id) { return flightRepository.findById(id).orElse(null); }

    @PutMapping("/api/flights/{id}")
    @ResponseBody 
    public String updateFlight(@PathVariable Integer id, @RequestBody Flight details) {
        Flight f = flightRepository.findById(id).orElse(null);
        if(f != null) {
            f.setStatus(details.getStatus());
            f.setAirlineId(details.getAirlineId());
            f.setAircraftId(details.getAircraftId());
            f.setDepartsAirportId(details.getDepartsAirportId());
            f.setArrivesAirportId(details.getArrivesAirportId());
            f.setScheduledDeparture(details.getScheduledDeparture());
            f.setScheduledArrival(details.getScheduledArrival());
            flightRepository.save(f);
            return "Cập nhật chuyến bay thành công!";
        }
        return "Lỗi: Không tìm thấy chuyến bay";
    }

    @DeleteMapping("/api/flights/{id}")
    @ResponseBody 
    public String deleteFlight(@PathVariable Integer id) {
        flightRepository.deleteById(id);
        return "Đã xóa chuyến bay.";
    }

    @GetMapping("/api/aircrafts")
    @ResponseBody 
    public List<Map<String, Object>> getAllAircrafts() { return aircraftRepository.findAllAircraftInfo(); }

    @GetMapping("/api/aircrafts/detail/{id}")
    @ResponseBody 
    public Aircraft getAircraftDetail(@PathVariable Integer id) { return aircraftRepository.findById(id).orElse(null); }

    @PutMapping("/api/aircrafts/{id}")
    @ResponseBody 
    public String updateAircraft(@PathVariable Integer id, @RequestBody Aircraft details) {
        Aircraft a = aircraftRepository.findById(id).orElse(null);
        if(a != null) {
            a.setNumber(details.getNumber()); 
            a.setModel(details.getModel());
            a.setTotalSeats(details.getTotalSeats());
            a.setAirlineId(details.getAirlineId());
            a.setStatus(details.getStatus());
            aircraftRepository.save(a);
            return "Cập nhật tàu bay thành công!";
        }
        return "Lỗi";
    }

    @PostMapping("/api/aircrafts")
    @ResponseBody 
    public String addAircraft(@RequestBody Aircraft aircraft) {
        aircraftRepository.save(aircraft);
        return "Thêm mới thành công!";
    }

    @GetMapping("/api/reservations")
    @ResponseBody 
    public List<Map<String, Object>> getAllReservations() { return reservationRepository.findAllReservationInfo(); }

    @PutMapping("/api/reservations/{id}/status")
    @ResponseBody 
    @Transactional 
    public String updateResStatus(@PathVariable Integer id, @RequestBody Map<String, String> body) {
        Reservation res = reservationRepository.findById(id).orElse(null);
        if(res != null) {
            String st = body.get("status");
            res.setStatus(st);
            reservationRepository.save(res);
            String time = java.time.LocalDateTime.now().toString().replace("T", " ").substring(0,19);
            
            if ("confirmed".equals(st)) {
                reservationRepository.confirmPaymentSafe(id, time);
                assignSeatsForReservation(id);
            }
            else if ("cancelled".equals(st)) {
                reservationRepository.refundPaymentSafe(id, time);
            }
            return "OK";
        }
        return "Error";
    }

    private void assignSeatsForReservation(Integer reservationId) {
        String getTicketsSql = "SELECT id, flight_id FROM ticket WHERE reservation_id = ? AND seat_no IS NULL";
        List<Map<String, Object>> tickets = jdbcTemplate.queryForList(getTicketsSql, reservationId);

        if (tickets.isEmpty()) return; 

        Integer flightId = (Integer) tickets.get(0).get("flight_id");
        String getTakenSeatsSql = "SELECT seat_no FROM ticket WHERE flight_id = ? AND seat_no IS NOT NULL AND status != 'cancelled'";
        List<String> takenSeats = jdbcTemplate.queryForList(getTakenSeatsSql, String.class, flightId);

        String[] seatLetters = {"A", "B", "C", "D", "E", "F"};
        int currentRow = 1;
        int currentLetterIndex = 0;

        for (Map<String, Object> t : tickets) {
            Integer ticketId = (Integer) t.get("id");
            String assignedSeat = null;

            while (assignedSeat == null) {
                String potentialSeat = currentRow + seatLetters[currentLetterIndex];
                if (!takenSeats.contains(potentialSeat)) {
                    assignedSeat = potentialSeat;
                    takenSeats.add(assignedSeat); 
                }

                currentLetterIndex++;
                if (currentLetterIndex >= seatLetters.length) {
                    currentLetterIndex = 0;
                    currentRow++; 
                }
            }
            jdbcTemplate.update("UPDATE ticket SET seat_no = ? WHERE id = ?", assignedSeat, ticketId);
        }
    }

    @GetMapping("/api/reports/revenue")
    @ResponseBody 
    public List<Map<String, Object>> getReports() { return flightRepository.getDailyRevenue(); }
    
    @GetMapping("/api/passengers")
    @ResponseBody 
    public List<Map<String, Object>> getPassengers() { return ticketRepository.findAllPassengerManifest(); }
}