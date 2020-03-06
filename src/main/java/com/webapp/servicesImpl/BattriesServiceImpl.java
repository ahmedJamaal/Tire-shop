package com.webapp.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.dao.BattryDAO;
import com.webapp.enity.Battries;
import com.webapp.services.BattriesService;


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

	@Override
	@Transactional
	public List<Battries> getPagentionBattries() {
		
		return battryDAO.getPagentionBattries();
	}

	@Override
	@Transactional
	public List<Battries> top15Item() {
		
		return battryDAO.top15Item();
	}

	@Override
	@Transactional
	public long TotalPrice() {
		
		return battryDAO.TotalPrice();
	}

	@Override
	@Transactional
	public long TotalLength() {
		
		return battryDAO.TotalLength();
	}

	@Override
	@Transactional
	public List<Battries> refillBattry() {
		// TODO Auto-generated method stub
		return battryDAO.getRefillBattry();
	}

}
