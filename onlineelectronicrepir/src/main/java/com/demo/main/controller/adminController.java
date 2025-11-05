package com.demo.main.controller;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.demo.main.model.Booking;
import com.demo.main.model.admin;
import com.demo.main.model.electritician;
import com.demo.main.model.user;
import com.demo.main.repository.BookingRepository;
import com.demo.main.services.BookingServices;
import com.demo.main.services.adminServices;
import com.demo.main.services.electriticianServices;
import com.demo.main.services.userServices;
import jakarta.servlet.http.HttpSession;

@Controller
public class adminController {
	@Autowired
	private adminServices adminservice;
	@Autowired
	private userServices userservices;
	@Autowired
	private electriticianServices electriticianservices;
	@Autowired
	private BookingServices bookingService;
	@Autowired
	private BookingRepository bookingRepository;

	@GetMapping("/createadmin")
	public String showUserForm(Model m) {
		m.addAttribute("admin", new admin());
		return "admin/adminaddform";
	}

	@PostMapping("/saveadmin")
	public String saveadmin(@ModelAttribute admin admin,Model model) {
		admin u = adminservice.createAdmin(admin);
		model.addAttribute("admin", u);
		return "admin/adminlogin";
	}

	@GetMapping("/adminlogin")
	public String adminlogin(Model m) {
		m.addAttribute("admin", new admin());
		return "admin/adminlogin";
	}

	@PostMapping("/adminlogin")
	public String verifyadmin(@ModelAttribute("admin") admin admin,Model model,HttpSession session) {
		admin u = adminservice.verifyAdmin(admin);
		System.out.println(u);
		if(u != null) {
			session.setAttribute("loggedadmin",u);
			return "admin/adminhomepage";
		}
		else {
			model.addAttribute("error","Invaid email or password");
			return "admin/adminlogin";
		}
	}

	@GetMapping("/viewadmins")
	public String findAll(Model model) {
		List<admin> admins = adminservice.findAll(); 
		model.addAttribute("ul", admins);
		if(!admins.isEmpty()) {
			return "admin/viewadmins";
		}
		else {
			return "admin/adminhomepage";
		}
	}

	@GetMapping("/editadmin/{id}")
	public String findById(Model model,@PathVariable int id) {
		Optional<admin> u = adminservice.findById(id);
		model.addAttribute("admin", u.get());
		return "admin/editadmin";
	}

	@PostMapping("/updateadmin")
	public String updateAdmin(@ModelAttribute admin admin) {
		adminservice.createAdmin(admin);
		return "redirect:/viewadmins";
	}

	@GetMapping("/deleteadmin/{id}")
	public String deleteadmin (@PathVariable int id) {
		adminservice.deleteById(id);
		return "redirect:/viewadmins";
	}

	//users---------------------------------------------------------------------------------------------------------------------------------------------------------------
	@GetMapping("/viewadminusers")
	public String findAllusers(Model model) {
		List<user> users = userservices.findAll();
		model.addAttribute("ul", users);
		if(!users.isEmpty()) {
			return "admin/viewusers";
		}
		else {
			return "admin/adminhomepage";
		}
	}
	//electriticians------------------------------------------------------------------------------------------------------------------------------------------------------
	@GetMapping("/viewadminelectriticians")
	public String findAllElectriticians(Model model) {
		List<electritician> electritician = electriticianservices.findAll();
		model.addAttribute("ul", electritician);
		if(!electritician.isEmpty()) {
			return "admin/viewelectriticians";
		}
		else {
			return "admin/adminhomepage";
		}
	}

	@GetMapping("/pending")
	public String viewPendingBookings(Model model) {
		List<Booking> pendingBookings = bookingService.getPendingBookings();
		model.addAttribute("bookings", pendingBookings);
		return "admin/viewpendingbookings"; // This JSP must exist
	}

	// Approve booking
	@GetMapping("/approve/{id}")
	public String approveBooking(@PathVariable int id) {
		bookingService.updateBookingStatus(id, "Approved");
		return "admin/adminhomepage";
	}

	// Reject booking
	@GetMapping("/reject/{id}")
	public String rejectBooking(@PathVariable int id) {
		bookingService.updateBookingStatus(id, "Rejected");
		return "admin/viewpendingbookings";
	}
	
	@GetMapping("/getBookingsForElectrician")
	public String getBookingsForElectrician(Model model, HttpSession session) {
	    electritician electrician = (electritician) session.getAttribute("loggedelectritician");

	    if (electrician == null) {
	        model.addAttribute("error", "Please log in as an electrician first.");
	        return "electritician/electriticianlogin"; // redirect to login
	    }

	    List<Booking> bookings = bookingRepository.findByElectriticianId(electrician.getId());
	    model.addAttribute("bookings", bookings);
	    return "electritician/electricianBookingsFragment";
	}
	
	@GetMapping("/electritician/deletework/{id}")
	public String deletework(@PathVariable int id) {
		bookingService.deleteById(id);
		return "electritician/electriticianhomepage";
	}

}
