package com.webapp.servicesImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webapp.dao.RimesDAO;
import com.webapp.enity.Rimes;
import com.webapp.services.RimesServices;

@Service
public class RimesServicesImpl implements RimesServices{
	
	@Autowired
	private RimesDAO rimesDao;
	
	@Override
	@Transactional
	public List<Rimes> getRimes() {

		return rimesDao.getRimes();
	}

	@Override
	@Transactional
	public void saveRimes(Rimes theRimes) {
		rimesDao.saveRimes(theRimes);
		
	}

	@Override
	@Transactional
	public Rimes getRimes(int theId) {
		
		return rimesDao.getRimes(theId);
	}

	@Override
	@Transactional
	public void deleteRimes(int theId) {
		rimesDao.deleteRimes(theId);
		
	}

	@Override
	@Transactional
	public List<Rimes> getPagentionRimes() {
		
		return rimesDao.getPagentionRimes();
	}

	@Override
	@Transactional
	public List<Rimes> top15Item() {
		
		return rimesDao.top15Item();
	}

	@Override
	@Transactional
	public long TotalPrice() {
		
		return rimesDao.TotalPrice();
	}

	@Override
	@Transactional
	public long TotalLength() {
		
		return rimesDao.TotalLength();
	}

	@Override
	@Transactional
	public List<Rimes> getRefillRimes() {
		
		return rimesDao.getRefillRimes();
	}

}
