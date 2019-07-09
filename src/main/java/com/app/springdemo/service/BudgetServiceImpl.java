package com.app.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.springdemo.dao.intefaces.BudgetDAO;
import com.app.springdemo.entity.Budget;
import com.app.springdemo.service.interfaces.BudgetService;

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

}
