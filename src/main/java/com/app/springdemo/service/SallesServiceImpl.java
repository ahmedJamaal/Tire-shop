package com.app.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.springdemo.dao.intefaces.SallesDAO;
import com.app.springdemo.entity.Salles;
import com.app.springdemo.service.interfaces.SallesService;

@Service
public class SallesServiceImpl implements SallesService{

	@Autowired
	private SallesDAO sallesDAO;
	
	@Override
	@Transactional
	public List<Salles> getAllSalles() {
		// TODO Auto-generated method stub
		return sallesDAO.getAllSalles();
	}

	@Override
	@Transactional
	public void saveSalles(Salles theSalles) {

		sallesDAO.saveSalles(theSalles);
		
	}

	@Override
	@Transactional
	public Salles getSalles(int theId) {
		// TODO Auto-generated method stub
		return sallesDAO.getSalles(theId);
	}

	@Override
	@Transactional
	public void deleteSalles(int theId) {

		sallesDAO.deleteSalles(theId);
		
	}

}
