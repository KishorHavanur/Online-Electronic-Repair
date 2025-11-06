package com.demo.main.repository;

import com.demo.main.model.Booking;
import com.demo.main.model.electritician;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface BookingRepository extends JpaRepository<Booking, Integer> {
    List<Booking> findByUserId(int userId);

    List<Booking> findByElectriticianId(int electriticianId);

    Optional<Booking> findById(int id);

    @Query("SELECT b.timeSlot FROM Booking b WHERE b.electritician.id = :electriticianId AND b.date = :date AND b.status <> 'Rejected'")
    List<String> findBookedSlots(@Param("electriticianId") int electriticianId, @Param("date") String date);

    List<Booking> findByStatus(String status);

    @Query("SELECT b FROM Booking b WHERE b.status = 'Pending'")
    List<Booking> findPendingBookings();
    
    List<Booking> findByElectriticianAndStatus(electritician electritician, String status);

}
