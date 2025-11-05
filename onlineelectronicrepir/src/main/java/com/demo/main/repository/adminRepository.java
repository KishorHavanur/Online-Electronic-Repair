package com.demo.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.main.model.admin;

public interface adminRepository extends JpaRepository<admin, Integer>{
	admin findByNameAndPassword(String name,String password);
}
