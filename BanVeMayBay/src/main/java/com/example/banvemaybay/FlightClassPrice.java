package com.example.banvemaybay;

import jakarta.persistence.*;

@Entity
@Table(name = "flight_class_price")
public class FlightClassPrice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "flight_id")
    private Integer flightId;

    @Column(name = "seat_class")
    private String seatClass;

    private Integer price;

    // --- Getter & Setter ---
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getFlightId() { return flightId; }
    public void setFlightId(Integer flightId) { this.flightId = flightId; }

    public String getSeatClass() { return seatClass; }
    public void setSeatClass(String seatClass) { this.seatClass = seatClass; }

    public Integer getPrice() { return price; }
    public void setPrice(Integer price) { this.price = price; }
}