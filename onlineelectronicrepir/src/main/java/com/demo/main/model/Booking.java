package com.demo.main.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private user user;

    @ManyToOne
    @JoinColumn(name = "electritician_id", nullable = false)
    private electritician electritician;

    @Column(nullable = false)
    private String issueDescription;

    @Column(nullable = false)
    private String date; 

    @Column(nullable = false)
    private String timeSlot;

    @Column(nullable = false)
    private String status; 
    
    private String message;     
    private String location;    
    private LocalDateTime createdAt = LocalDateTime.now(); 


    public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public Booking() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public user getUser() { return user; }
    public void setUser(user user) { this.user = user; }

    public electritician getElectritician() { return electritician; }
    public void setElectritician(electritician electritician) { this.electritician = electritician; }

    public String getIssueDescription() { return issueDescription; }
    public void setIssueDescription(String issueDescription) { this.issueDescription = issueDescription; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getTimeSlot() { return timeSlot; }
    public void setTimeSlot(String timeSlot) { this.timeSlot = timeSlot; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

	@Override
	public String toString() {
		return "Booking [id=" + id + ", user=" + user + ", electritician=" + electritician + ", issueDescription="
				+ issueDescription + ", date=" + date + ", timeSlot=" + timeSlot + ", status=" + status + ", message="
				+ message + ", location=" + location + ", createdAt=" + createdAt + "]";
	}

   
}
