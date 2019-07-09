package com.app.springdemo.service.interfaces;

import java.util.List;

import com.app.springdemo.entity.Budget;

public interface BudgetService {

	public List<Budget> getAllBudget();

	public void saveBudget(Budget theBudget);

	public Budget getBudget(int theId);

	public void deleteBudget(int theId);
	
	public List<Budget> getAllIncome();
	
	public  List<Budget> getAllExpences();
	
	
	
}
