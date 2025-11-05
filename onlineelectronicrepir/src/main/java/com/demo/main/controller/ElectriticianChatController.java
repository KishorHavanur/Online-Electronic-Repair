package com.demo.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.main.model.ChatMessage;
import com.demo.main.model.electritician;
import com.demo.main.model.user;
import com.demo.main.services.ChatService;
import com.demo.main.services.userServices;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/electritician/chat")
public class ElectriticianChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private userServices userService;

    @GetMapping("/start")
    public String startChat(@RequestParam int userId, HttpSession session, Model model) {
        electritician e = (electritician) session.getAttribute("loggedelectritician");
        if (e == null) {
            return "redirect:/electritician/login";
        }

        user u = userService.getById(userId);
        List<ChatMessage> messages = chatService.getMessages(userId, e.getId());

        model.addAttribute("user", u);
        model.addAttribute("messages", messages);
        model.addAttribute("electritician", e);
        return "electritician/electritician_chat"; 
    }

    @PostMapping("/send")
    public String sendMessage(@RequestParam int userId,
                              @RequestParam String message,
                              HttpSession session,
                              RedirectAttributes ra) {

        electritician e = (electritician) session.getAttribute("loggedelectritician");
        if (e == null) return "redirect:/electritician/login";

        chatService.sendElectriticianMessage(userId, e.getId(), e.getName(), message);

        return "redirect:/electritician/chat/start?userId=" + userId;
    }
}
