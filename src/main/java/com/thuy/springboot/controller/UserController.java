package com.thuy.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.thuy.springboot.pojo.User;
import com.thuy.springboot.service.UserServiceImp;



@RestController
public class UserController {

	@Autowired
	UserServiceImp service;
	
	
	@RequestMapping(value = "/users/addUser" , method = RequestMethod.POST, headers = "Accept=application/json")
	public User addUser(@RequestBody User u) {
		User user = service.addUser(u);
		return user;
	}
	

	@RequestMapping(value = "/users/updateUser" , method = RequestMethod.PUT, headers = "Accept=application/json")
	public User updateUser(@RequestBody User u) {
		service.updateUser(u);
		return u;
	}	
	@RequestMapping(value = "/users/getAllUsers" , method = RequestMethod.GET, headers = "Accept=application/json")
	public List<User> getAllUsers() {
		List<User> userList = service.getAllUsers();
		return userList;
	}
	
	@RequestMapping(value="/users/deleteUser/{id}" , method = RequestMethod.DELETE, headers = "Accept=application/json")
	public void deleteUser(@PathVariable long id) {
		service.deleteUser(id);
	}
	
}










