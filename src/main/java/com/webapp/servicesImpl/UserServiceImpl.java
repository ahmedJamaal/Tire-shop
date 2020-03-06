package com.webapp.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.dao.UserDAO;
import com.webapp.enity.User;
import com.webapp.services.UserService;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	@Transactional
	public List<User> getAllUsers() {
		
		return userDAO.getAllUsers();
	}

	@Override
	@Transactional
	public void saveUsers(User theUsers) {
		userDAO.saveUsers(theUsers);
		
	}

	@Override
	@Transactional
	public User getUser(int theId) {
		
		return userDAO.getUsers(theId);
	}

	@Override
	@Transactional
	public void deleteUsers(int theId) {
		userDAO.deleteUsers(theId);
		
	}

}
