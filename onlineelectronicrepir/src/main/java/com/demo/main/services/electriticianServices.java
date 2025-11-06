package com.demo.main.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.main.model.electritician;
import com.demo.main.repository.electriticianRepository;

@Service
public class electriticianServices {
@Autowired
private electriticianRepository electriticianRepository;

public electritician createElectritician(electritician electritician) {
	return electriticianRepository.save(electritician);
}

public electritician verifyElectritician(electritician electritician) {
	return electriticianRepository.findByNameAndPassword(electritician.getName(),electritician.getPassword());
}

public Optional<electritician> findById(int id) {
	return electriticianRepository.findById(id);
}

public List<electritician> findAll(){
	return electriticianRepository.findAll();
}

public void deleteById(int id) {
	electriticianRepository.deleteById(id);
}

public List<electritician> getAllElectriticians() {
	return electriticianRepository.findAll();
}

public electritician getById(int electriticianId) {
	return electriticianRepository.getById(electriticianId);
}
}
