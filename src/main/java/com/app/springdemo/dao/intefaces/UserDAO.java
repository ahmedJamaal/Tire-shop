package com.app.springdemo.dao.intefaces;

import java.util.List;

import com.app.springdemo.entity.User;

public interface UserDAO {

	public List<User> getAllUsers();

	public void saveUsers(User theUsers);

	public User getUsers(int theId);

	public void deleteUsers(int theId);
	
}
