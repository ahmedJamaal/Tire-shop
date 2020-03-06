package com.webapp.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.dao.SupplyingDAO;
import com.webapp.enity.Supplying;
import com.webapp.services.SupplyingService;

@Service
public class SupplyingServiceImpl implements SupplyingService{

	@Autowired
	private SupplyingDAO supplyingDAO;
	
	@Override
	@Transactional
	public List<Supplying> getAllSupplying() {
		return supplyingDAO.getAllSupplying();
	}

	@Override
	@Transactional
	public void saveSupplying(Supplying theSupplying) {
		supplyingDAO.saveSupplying(theSupplying);
		
	}

	@Override
	@Transactional
	public Supplying getSupplying(int theId) {
		
		return supplyingDAO.getSupplying(theId);
	}

	@Override
	@Transactional
	public void deleteSupplying(int theId) {
		supplyingDAO.deleteSupplying(theId);
		
	}

	@Override
	@Transactional
	public long totalThisMonthByType(String Type) {
		
		return supplyingDAO.totalThisMonthByType(Type);
	}

	@Override
	@Transactional
	public long totalLastMonth() {
		
		return supplyingDAO.totalLastMonth();
	}

	@Override
	@Transactional
	public long totalLastMonthByType(String Type) {
	
		return supplyingDAO.totalLastMonthByType(Type);
	}

	@Override
	@Transactional
	public long totalThisMonth() {
		// TODO Auto-generated method stub
		return supplyingDAO.totalThisMonth();
	}

	@Override
	@Transactional
	public List<Supplying> SupplyingThisMonth() {
		// TODO Auto-generated method stub
		return supplyingDAO.SupplyingThisMonth();
	}

	
}
