package com.webapp.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.dao.BudgetDAO;
import com.webapp.enity.Budget;
import com.webapp.services.BudgetService;


@Service
public class BudgetServiceImpl implements BudgetService{
	
	@Autowired
	private BudgetDAO expencessDAO;
	
	@Override
	@Transactional
	public List<Budget> getAllBudget() {
		// TODO Auto-generated method stub
		return expencessDAO.getAllBudget();
	}

	@Override
	@Transactional
	public void saveBudget(Budget theBudget) {
		expencessDAO.saveBudget(theBudget);
		
	}

	@Override
	@Transactional
	public Budget getBudget(int theId) {
		
		return expencessDAO.getBudget(theId);
	}

	@Override
	@Transactional
	public void deleteBudget(int theId) {

		expencessDAO.deleteBudget(theId);
		
	}

	@Override
	@Transactional
	public List<Budget> getAllIncome() {
	
		return expencessDAO.getAllIncome();
	}

	@Override
	@Transactional
	public List<Budget> getAllExpences() {
		
		return expencessDAO.getAllExpences();
	}

	@Override
	@Transactional
	public List<Budget> getIncomeThisMonth() {
		
		return expencessDAO.getIncomeThisMonth();
	}

	@Override
	@Transactional
	public List<Budget> getExpencesThisMonth() {
	
		return expencessDAO.getExpencesThisMonth();
	}

	@Override
	@Transactional
	public long totalIncomeLastMonth() {
		
		return expencessDAO.totalIncomeLastMonth();
	}

	@Override
	@Transactional
	public long totalExpencesLastMonth() {
		// TODO Auto-generated method stub
		return expencessDAO.totalExpencesLastMonth();
	}

	@Override
	@Transactional
	public long totalIncomeThisMonth() {
		// TODO Auto-generated method stub
		return expencessDAO.totalIncomeThisMonth();
	}

	@Override
	@Transactional
	public long totalExpencesThisMonth() {
		// TODO Auto-generated method stub
		return expencessDAO.totalExpencesThisMonth();
	}



}
