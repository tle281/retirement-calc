package com.thuy.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thuy.springboot.dao.UserRepository;
import com.thuy.springboot.pojo.User;

@Service
@Transactional
public class UserServiceImp {
	
	@Autowired
	private UserRepository dao;
	
	public List<User> getAllUsers() {
		List<User> userList = new ArrayList<>();
		dao.findAll().forEach(e -> userList.add(e));
		
		return userList;
		
	}
	
	public User addUser(User user) {
		dao.save(user); 
		return user;
	}
	
	public User updateUser(User user) {
		dao.save(user); 
		return user;
	}
	
	public User getUser(long id) {
		User user = dao.findById(id).get();		
		return user;

	}
	
	public void deleteUser(long id) {
		dao.deleteById(id); 
	}
	
	
}





