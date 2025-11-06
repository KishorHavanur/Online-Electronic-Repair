package com.demo.main.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.main.model.user;

public interface userRepository extends JpaRepository<user, Integer> {
	Optional<user> findByNameAndPassword(String name,String password);
}
