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

import com.demo.main.model.electritician;
import com.demo.main.model.user;
import com.demo.main.services.electriticianServices;
import com.demo.main.services.userServices;
import jakarta.servlet.http.HttpSession;

@Controller
public class usercontroller {
	@Autowired
	private userServices userservice;
	@Autowired
	private electriticianServices electriticianservice;

	@GetMapping("/landingpage")
	public String showlanding() {
		return "landingpage";
	}
	
	@GetMapping("/createuser")
	public String showUserForm(Model m) {
		m.addAttribute("user", new user());
		return "user/useraddform";
	}

	@PostMapping("/saveuser")
	public String saveEmployee(@ModelAttribute user user,Model model) {
		user u = userservice.createUser(user);
		model.addAttribute("user", u);
		return "user/userlogin";
	}
	
	@GetMapping("/userlogin")
	public String userlogin(Model m) {
		m.addAttribute("user", new user());
		return "user/userlogin";
	}
	
	@PostMapping("/userlogin")
	public String verifyuser(@ModelAttribute("user") user user,Model model,HttpSession session) {
		user u = userservice.verifyUser(user);
		if(u != null) {
			session.setAttribute("loggeduser",u);
			return "user/userhomepage";
		}
		else {
			model.addAttribute("error","Invaid email or password");
			return "user/userlogin";
		}
	}
	
	@GetMapping("/viewusers")
	public String findAll(Model model) {
		List<user> users = userservice.findAll(); 
		model.addAttribute("ul", users);
		if(!users.isEmpty()) {
			return "user/viewusers";
		}
		else {
			return "user/userhomepage";
		}
	}
	
	@GetMapping("/edituser/{id}")
	public String findById(Model model,@PathVariable int id) {
		Optional<user> u = userservice.findById(id);
		model.addAttribute("user", u.get());
		return "user/edituser";
	}
	
	@PostMapping("/updateuser")
	public String updateUser(@ModelAttribute user user) {
		userservice.createUser(user);
		return "admin/viewusers";
	}
	
	@GetMapping("/deleteuser/{id}")
	public String deleteuser (@PathVariable int id) {
		userservice.deleteById(id);
		return "admin/viewusers";
	}
	
	//electriticians-------------------------------------------------------------------------------------------------------------------
	@GetMapping("/user/electriticians")
	public String showAllElectriticians(Model model) {
	    List<electritician> electricians = electriticianservice.getAllElectriticians();
	    model.addAttribute("electriticians", electricians);
	    return "user/userElectriticianList"; 
	}
}
