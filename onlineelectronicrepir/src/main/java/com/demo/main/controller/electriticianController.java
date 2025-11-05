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
import com.demo.main.model.electritician;
import com.demo.main.model.user;
import com.demo.main.repository.BookingRepository;
import com.demo.main.services.BookingServices;
import com.demo.main.services.ChatService;
import com.demo.main.services.electriticianServices;
import jakarta.servlet.http.HttpSession;

@Controller
public class electriticianController {
@Autowired
private electriticianServices electriticianService;


@GetMapping("/createelectritician")
public String showUserForm(Model m) {
	m.addAttribute("user", new electritician());
	return "electritician/electriticianaddform";
}

@PostMapping("/saveelectritician")
public String saveElectritician(@ModelAttribute electritician electritician,Model model) {
	electritician u = electriticianService.createElectritician(electritician);
	model.addAttribute("electritician", u);
	return "electritician/electriticianlogin";
}

@GetMapping("/electriticianlogin")
public String electriticianlogin(Model m) {
	m.addAttribute("electritician", new electritician());
	return "electritician/electriticianlogin";
}

@PostMapping("/electriticianlogin")
public String verifyelectritician(@ModelAttribute("electritician") electritician electritician,Model model,HttpSession session) {
	electritician u = electriticianService.verifyElectritician(electritician);
	if(u != null) {
		session.setAttribute("loggedelectritician",u);
		return "electritician/electriticianhomepage";
	}
	else {
		model.addAttribute("error","Invaid email or password");
		return "electritician/electriticianlogin";
	}
}

@GetMapping("/viewelectriticians")
public String findAll(Model model,HttpSession session) {
	List<electritician> electritician = electriticianService.findAll(); 
	model.addAttribute("ul", electritician);
	session.setAttribute("electritician", electritician);
	if(!electritician.isEmpty()) {
		return "electritician/viewelectriticians";
	}
	else {
		return "electritician/electriticianhomepage";
	}
}

@GetMapping("/editelectritician/{id}")
public String findById(Model model,@PathVariable int id) {
	Optional<electritician> u = electriticianService.findById(id);
	model.addAttribute("electritician", u.get());
	return "electritician/editelectritician";
}

@PostMapping("/updateelectritician")
public String updateElectritician(@ModelAttribute electritician electritician) {
	electriticianService.createElectritician(electritician);
	return "admin/viewelectriticians";
}

@GetMapping("/deleteelectritician/{id}")
public String deleteElectritician (@PathVariable int id) {
	electriticianService.deleteById(id);
	return "admin/viewelectriticians";
}
}
