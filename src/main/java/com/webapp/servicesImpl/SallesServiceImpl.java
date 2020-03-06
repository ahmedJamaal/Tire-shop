package com.webapp.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.dao.SallesDAO;
import com.webapp.enity.Salles;
import com.webapp.services.SallesService;


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

	@Override
	@Transactional
	public long totalSales() {
		
		return sallesDAO.totalSales();
	}

	@Override
	@Transactional
	public long totalThisMonth() {
		
		return sallesDAO.totalThisMonth();
	}

	@Override
	@Transactional
	public long totalLastMonth() {
		
		return sallesDAO.totalLastMonth();
	}

	@Override
	@Transactional
	public List<Salles> topSallesItem() {
		return sallesDAO.topSallesItem();
	}

	@Override
	@Transactional
	public List<Object> top5SallesItem() {
		// TODO Auto-generated method stub
		return sallesDAO.top5SallesItem();
	}

	@Override
	@Transactional
	public List<Salles> SallesThisMonth() {
		// TODO Auto-generated method stub
		return sallesDAO.SallesThisMonth();
	}

	@Override
	@Transactional
	public long totalThisMonthByType(String Type) {
		// TODO Auto-generated method stub
		return sallesDAO.totalThisMonthByType(Type);
	}

	@Override
	@Transactional
	public long totalLastMonthByType(String Type) {
		// TODO Auto-generated method stub
		return sallesDAO.totalLastMonthByType(Type);
	}

}
