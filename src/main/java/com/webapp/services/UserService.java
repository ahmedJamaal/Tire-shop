package com.webapp.services;

import java.util.List;

import com.webapp.enity.User;

public interface UserService {
	
	public List<User> getAllUsers();

	public void saveUsers(User theUsers);

	public User getUser(int theId);

	public void deleteUsers(int theId);

}
