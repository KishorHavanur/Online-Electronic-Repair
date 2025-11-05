package com.demo.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.main.model.electritician;

public interface electriticianRepository extends JpaRepository<electritician, Integer> {
	electritician findByNameAndPassword(String name,String password);
}
