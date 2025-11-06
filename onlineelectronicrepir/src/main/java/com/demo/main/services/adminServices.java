package com.demo.main.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.demo.main.model.admin;
import com.demo.main.model.electritician;
import com.demo.main.model.user;
import com.demo.main.repository.adminRepository;
import com.demo.main.repository.electriticianRepository;
import com.demo.main.repository.userRepository;

@Service
public class adminServices {
@Autowired
private adminRepository adminRepository;
@Autowired
private userRepository userRepository;
@Autowired
private electriticianRepository electriticianRepository;

public admin createAdmin(admin admin) {
	return adminRepository.save(admin);
}

public admin verifyAdmin(admin admin) {
	return adminRepository.findByNameAndPassword(admin.getName(), admin.getPassword());
}

public Optional<admin> findById(int id) {
	return adminRepository.findById(id);
}

public List<admin> findAll(){
	return adminRepository.findAll();
}

public void deleteById(int id) {
    adminRepository.deleteById(id);
}
//users---------------------------------------------------------------------------------------------------------------------------
public List<user> findAllusers(){
	return userRepository.findAll();
}
//electriticians------------------------------------------------------------------------------------------------------------------
public List<electritician> findAllElectriticians(){
	return electriticianRepository.findAll();
}


}