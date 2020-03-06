package com.webapp.dao;

import java.util.List;

import com.webapp.enity.User;

public interface UserDAO {

	public List<User> getAllUsers();

	public void saveUsers(User theUsers);

	public User getUsers(int theId);

	public void deleteUsers(int theId);
	
}
