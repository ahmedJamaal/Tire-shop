package com.app.springdemo.service.interfaces;

import java.util.List;

import com.app.springdemo.entity.User;

public interface UserService {
	
	public List<User> getAllUsers();

	public void saveUsers(User theUsers);

	public User getUser(int theId);

	public void deleteUsers(int theId);

}
