package com.demo.main.services;

import com.demo.main.model.Booking;
import com.demo.main.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class BookingServices {

    @Autowired
    private BookingRepository bookingRepository;

    public List<Booking> getBookingsByUserId(int userId) {
        return bookingRepository.findByUserId(userId);
    }

    public List<Booking> getBookingsByElectriticianId(int electriticianId) {
        return bookingRepository.findByElectriticianId(electriticianId);
    }

    public List<String> getBookedSlots(int electriticianId, String date) {
        return bookingRepository.findBookedSlots(electriticianId, date);
    }

    public List<String> getAvailableSlots(int electriticianId, String date) {
        List<String> allSlots = List.of(
            "9 AM - 11 AM",
            "11 AM - 1 PM",
            "2 PM - 4 PM",
            "4 PM - 6 PM",
            "6 PM - 8 PM"
        );
        List<String> booked = getBookedSlots(electriticianId, date);
        allSlots = allSlots.stream()
                .filter(slot -> !booked.contains(slot))
                .toList();
        return allSlots;
    }

    public Booking saveBooking(Booking booking) {
        return bookingRepository.save(booking);
    }

    public List<Booking> getPendingBookings() {
        return bookingRepository.findPendingBookings();
    }

    public void updateBookingStatus(int id, String status) {
        Optional<Booking> optionalBooking = bookingRepository.findById(id);
        if (optionalBooking.isPresent()) {
            Booking booking = optionalBooking.get();
            booking.setStatus(status);

            if ("Approved".equalsIgnoreCase(status)) {
            	System.out.println("approved");
                String userName = booking.getUser().getName();
                String userLocation = booking.getUser().getAddress(); 

                booking.setMessage("You got a new work assignment from " + userName +
                        ". Location: " + userLocation +
                        ". Issue: " + booking.getIssueDescription());
            } else if ("Rejected".equalsIgnoreCase(status)) {
                booking.setMessage("This booking request has been rejected by admin.");
            }

            bookingRepository.save(booking);
        }
    }
    
    public void deleteById(int id) {
        bookingRepository.deleteById(id);
    }
    
    public List<Booking> getBookingsByElectritician(int electriticianId) {
        return bookingRepository.findByElectriticianId(electriticianId);
    }
}
