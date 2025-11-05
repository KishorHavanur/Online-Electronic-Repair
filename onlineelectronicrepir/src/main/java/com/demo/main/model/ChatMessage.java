package com.demo.main.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "chat_message")
public class ChatMessage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "user_id", nullable = false)
    private int userId;

    @Column(name = "electritician_id", nullable = false)
    private int electriticianId;

    @Column(name = "sender_type", length = 20)
    private String senderType; 

    @Column(name = "sender_name", length = 100)
    private String senderName;

    @Column(columnDefinition = "TEXT")
    private String message;

    @Column(name = "sent_at")
    private LocalDateTime sentAt = LocalDateTime.now();
    
    public ChatMessage() {
		super();
	}

	
	public ChatMessage(int id, int userId, int electriticianId, String senderType, String senderName, String message,
			LocalDateTime sentAt) {
		super();
		this.id = id;
		this.userId = userId;
		this.electriticianId = electriticianId;
		this.senderType = senderType;
		this.senderName = senderName;
		this.message = message;
		this.sentAt = sentAt;
	}


	public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getElectriticianId() { return electriticianId; }
    public void setElectriticianId(int electriticianId) { this.electriticianId = electriticianId; }

    public String getSenderType() { return senderType; }
    public void setSenderType(String senderType) { this.senderType = senderType; }

    public String getSenderName() { return senderName; }
    public void setSenderName(String senderName) { this.senderName = senderName; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public LocalDateTime getSentAt() { return sentAt; }
    public void setSentAt(LocalDateTime sentAt) { this.sentAt = sentAt; }

	
	@Override
	public String toString() {
		return "ChatMessage [id=" + id + ", userId=" + userId + ", electriticianId=" + electriticianId + ", senderType="
				+ senderType + ", senderName=" + senderName + ", message=" + message + ", sentAt=" + sentAt
				+  "]";
	}
}
