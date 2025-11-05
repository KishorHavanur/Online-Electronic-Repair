package com.demo.main.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.demo.main.model.ChatMessage;
import com.demo.main.repository.ChatRepository;

@Service
public class ChatService {

    @Autowired
    private ChatRepository chatRepo;

    /**
     * Send a message from either user or electrician.
     * 
     * @param userId - the user's ID
     * @param electriticianId - the electrician's ID
     * @param senderType - "user" or "electritician"
     * @param senderName - sender's display name
     * @param message - chat content
     */
    public void sendMessage(int userId, int electriticianId, String senderType, String senderName, String message) {
        ChatMessage msg = new ChatMessage();
        msg.setUserId(userId);
        msg.setElectriticianId(electriticianId);
        msg.setSenderType(senderType);
        msg.setSenderName(senderName);
        msg.setMessage(message);
        chatRepo.save(msg);
    }

    /**
     * Fetch all messages between a user and electrician.
     */
    public List<ChatMessage> getMessages(int userId, int electriticianId) {
        return chatRepo.findByUserAndElectritician(userId, electriticianId);
    }

    
    /**
     * Send a message specifically from the user side.
     */
    public void sendUserMessage(int userId, int electriticianId, String userName, String message) {
        sendMessage(userId, electriticianId, "user", userName, message);
    }

    /**
     * Send a message specifically from the electrician side.
     */
    public void sendElectriticianMessage(int userId, int electriticianId, String electricianName, String message) {
        sendMessage(userId, electriticianId, "electritician", electricianName, message);
    }
   
}
