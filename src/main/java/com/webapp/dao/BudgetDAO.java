package com.webapp.dao;

import java.util.List;

import com.webapp.enity.Budget;

public interface BudgetDAO {

	public List<Budget> getAllBudget();

	public void saveBudget(Budget theBudget);

	public Budget getBudget(int theId);

	public void deleteBudget(int theId);
	
	public List<Budget> getAllIncome();
	
	public List<Budget> getAllExpences();
	
	public List<Budget> getIncomeThisMonth();
	
	public List<Budget> getExpencesThisMonth();	
	
	public long totalIncomeThisMonth();
	
	public long totalExpencesThisMonth();
	
	public long totalIncomeLastMonth();
	
	public long totalExpencesLastMonth();
	
	
}
