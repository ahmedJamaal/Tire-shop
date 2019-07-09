package com.app.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.springdemo.dao.intefaces.BattryDAO;
import com.app.springdemo.entity.Battries;
import com.app.springdemo.service.interfaces.BattriesService;

@Service
public class BattriesServiceImpl implements BattriesService{
	
	@Autowired
	private BattryDAO battryDAO;
	
	@Override
	@Transactional
	public List<Battries> getAllBattries() {
		
		return battryDAO.getBattries();
	}

	@Override
	@Transactional
	public void saveBattry(Battries theSalles) {
		
		battryDAO.saveBattry(theSalles);	
	}

	@Override
	@Transactional
	public Battries getBattry(int theId) {
		
		return battryDAO.getBattry(theId);
	}

	@Override
	@Transactional
	public void deleteBattries(int theId) {
		battryDAO.deleteBattries(theId);
		
	}

}
