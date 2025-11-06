package com.demo.main.controller;

import com.demo.main.model.Booking;
import com.demo.main.model.electritician;
import com.demo.main.model.user;
import com.demo.main.repository.BookingRepository;
import com.demo.main.repository.electriticianRepository;
import com.demo.main.repository.userRepository;
import com.demo.main.services.BookingServices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/booking")
public class BookingController {

    @Autowired
    private BookingServices bookingService;

    @Autowired
    private electriticianRepository electriticianRepo;

    @Autowired
    private userRepository userRepo;
    
    @Autowired
    private BookingRepository bookingRepository;

    @GetMapping("/form")
    public String showBookingForm(@RequestParam("electriticianId") int electriticianId, Model model) {
        model.addAttribute("electriticianId", electriticianId);
        return "booking/bookingform"; // JSP page
    }

    @GetMapping("/available-slots")
    @ResponseBody
    public List<String> getAvailableSlots(@RequestParam int electriticianId, @RequestParam String date) {
        return bookingService.getAvailableSlots(electriticianId, date);
    }

    @PostMapping("/save")
    public String saveBooking(@RequestParam int electriticianId,
                              @RequestParam String issueDescription,
                              @RequestParam String date,
                              @RequestParam String timeSlot,
                              HttpSession session,
                              Model model) {
    	System.out.println("Session ID: " + session.getId());
    	System.out.println("Session loggeduser: " + session.getAttribute("loggeduser"));
        user us = (user) session.getAttribute("loggeduser");
        System.out.println(us);
        if (us == null) return "redirect:/userlogin";

        user u = userRepo.findById(us.getId()).orElse(null);
        electritician e = electriticianRepo.findById(electriticianId).orElse(null);

        Booking booking = new Booking();
        booking.setUser(u);
        booking.setElectritician(e);
        booking.setIssueDescription(issueDescription);
        booking.setDate(date);
        booking.setTimeSlot(timeSlot);
        booking.setStatus("Pending");

        bookingService.saveBooking(booking);

        model.addAttribute("message", "Booking submitted successfully!");
        return "redirect:/booking/user-bookings";
    }

    @GetMapping("/user-bookings")
    public String viewUserBookings(HttpSession session, Model model) {
    	  user us = (user) session.getAttribute("loggeduser");
          System.out.println(us);
        if (us.getId() == 0) return "redirect:/userlogin";

        List<Booking> bookings = bookingService.getBookingsByUserId(us.getId());
        model.addAttribute("bookings", bookings);
        return "user/userbookings"; 
    }

}
