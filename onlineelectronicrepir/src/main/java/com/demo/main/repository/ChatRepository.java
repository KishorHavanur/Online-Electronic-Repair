package com.demo.main.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.main.model.ChatMessage;

public interface ChatRepository extends JpaRepository<ChatMessage, Integer> {

    @Query("SELECT c FROM ChatMessage c WHERE c.userId = :userId AND c.electriticianId = :electriticianId ORDER BY c.sentAt ASC")
    List<ChatMessage> findByUserAndElectritician(int userId, int electriticianId);

    @Query("SELECT COUNT(c) FROM ChatMessage c WHERE c.userId = :userId AND c.electriticianId = :electriticianId AND c.senderType = 'user'")
    int countUserMessages(int userId, int electriticianId);
    
    @Query("SELECT DISTINCT c.userId FROM ChatMessage c WHERE c.electriticianId = :electriticianId")
    List<Integer> findDistinctUserIdsByElectriticianId(@Param("electriticianId") int electriticianId);
    
    // Fetch all messages between a user and an electrician
    List<ChatMessage> findByUserIdAndElectriticianIdOrderByIdAsc(int userId, int electriticianId);

}
