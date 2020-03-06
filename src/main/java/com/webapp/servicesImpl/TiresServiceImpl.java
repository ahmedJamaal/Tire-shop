package com.webapp.servicesImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webapp.dao.TiresDAO;
import com.webapp.enity.Tires;
import com.webapp.services.TiresService;


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
	public void saveTires(Tires theTires) {
		tiresDAO.saveTires(theTires);
		
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

	@Override
	@Transactional
	public List<Tires> getPagentionTires() {
		
		return tiresDAO.getPagentionTires();
	}

	@Override
	@Transactional
	public List<Tires> top15Item() {
		
		return tiresDAO.top15Item();
	}

	@Override
	@Transactional
	public long TotalPrice() {
		
		return tiresDAO.TotalPrice();
	}

	@Override
	@Transactional
	public long TotalLength() {
		
		return tiresDAO.TotalLength();
	}

	@Override
	@Transactional
	public List<Tires> refillTire() {
		// TODO Auto-generated method stub
		return tiresDAO.getRefillTire();
	}

}
