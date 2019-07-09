package com.app.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.springdemo.dao.intefaces.BudgetDAO;
import com.app.springdemo.entity.Budget;

@Repository
public class BudgetDAOImpl implements BudgetDAO {
	
	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Budget> getAllBudget() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// create a query  ... sort by last name
		Query<Budget> theQuery = 
				currentSession.createQuery("from Budget",Budget.class);
		
		// execute query and get result list
		List<Budget> theBudget = theQuery.getResultList();
				
		// return the results		
		return theBudget;
	}

	@Override
	public void saveBudget(Budget theBudget) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/upate the customer ... finally LOL
		currentSession.saveOrUpdate(theBudget);
		
	}

	@Override
	public Budget getBudget(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Budget theBudget = currentSession.get(Budget.class, theId);
		
		return theBudget;
	}

	@Override
	public void deleteBudget(int theId) {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from Budget where id=:budgetId");
		theQuery.setParameter("budgetId", theId);
		
		theQuery.executeUpdate();	
		
	}

	@Override
	public List<Budget> getAllIncome() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query  ... sort by last name
		Query<Budget> theQuery = 
				currentSession.createQuery("from Budget where type=:budgetType",Budget.class);
		theQuery.setParameter("budgetType", "Income");
		// execute query and get result list
		List<Budget> theBudget = theQuery.getResultList();
				
		// return the results		
		return theBudget;
	}

	@Override
	public List<Budget> getAllExpences() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query  ... sort by last name
		Query<Budget> theQuery = 
				currentSession.createQuery("from Budget where type=:budgetType",Budget.class);
		theQuery.setParameter("budgetType", "Expences");
		// execute query and get result list
		List<Budget> theBudget = theQuery.getResultList();
		
		// return the results		
		return theBudget;
	}

}
