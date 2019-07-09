package com.app.springdemo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.springdemo.dao.intefaces.TiresDAO;
import com.app.springdemo.entity.Tires;
import com.app.springdemo.service.interfaces.TiresService;
@Service
public class TiresServiceImpl implements TiresService{

	@Autowired
	private TiresDAO tiresDAO;
	
	@Override
	@Transactional
	public List<Tires> getAllTires() {
		// TODO Auto-generated method stub
		return tiresDAO.getAllTires();
	}

	@Override
	@Transactional
	public void saveSalles(Tires theTires) {
		tiresDAO.saveSalles(theTires);
		
	}

	@Override
	@Transactional
	public Tires getTires(int theId) {
		// TODO Auto-generated method stub
		return tiresDAO.getTires(theId);
	}

	@Override
	@Transactional
	public void deleteTires(int theId) {

		tiresDAO.deleteTires(theId);
		
	}

}
