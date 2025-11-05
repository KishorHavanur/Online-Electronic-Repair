package com.demo.main.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.servlet.http.HttpSession;

import com.demo.main.model.ChatMessage;
import com.demo.main.model.electritician;
import com.demo.main.model.user;
import com.demo.main.services.ChatService;
import com.demo.main.services.electriticianServices;
import com.demo.main.services.userServices;

@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private electriticianServices electriticianService;
    
    @Autowired
    private userServices userService;

    @GetMapping("/start")
    public String startChat(@RequestParam int electriticianId, HttpSession session, Model model) {
        user loggedUser = (user) session.getAttribute("loggeduser");
        if (loggedUser == null) {
            return "redirect:/login";
        }

        electritician e = electriticianService.getById(electriticianId);
        List<ChatMessage> messages = chatService.getMessages(loggedUser.getId(), electriticianId);

        model.addAttribute("electritician", e);
        model.addAttribute("messages", messages);
        return "user/chatpage";
    }

    @PostMapping("/send")
    public String sendMessage(@RequestParam int electriticianId,
                              @RequestParam String message,
                              HttpSession session,
                              RedirectAttributes ra) {

        user u = (user) session.getAttribute("loggeduser");
        if (u == null) return "redirect:/login";

        chatService.sendMessage(u.getId(), electriticianId, "user", u.getName(), message);
        return "redirect:/chat/start?electriticianId=" + electriticianId;
    }
   
}
