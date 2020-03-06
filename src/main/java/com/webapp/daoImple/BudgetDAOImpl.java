package com.webapp.daoImple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.dao.BudgetDAO;
import com.webapp.enity.Budget;
import com.webapp.utils.CustomDate;


@Repository
public class BudgetDAOImpl implements BudgetDAO {
	
	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Budget> getAllBudget() {

		CustomDate d =new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
				
		// create a query  ... sort by last name
		Query<Budget> theQuery = 
				currentSession.createQuery("from Budget where date between :startDate and :endDate",Budget.class);
		theQuery.setParameter("startDate", d.getStartYear());
		theQuery.setParameter("endDate", d.getEndYear());
		
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

	@Override
	public List<Budget> getIncomeThisMonth() {
		CustomDate d=new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query  ... sort by last name
		Query<Budget> theQuery = 
				currentSession.createQuery("from Budget where type=:budgetType and date between :startDate and :endDate",Budget.class);
		theQuery.setParameter("budgetType", "Income");
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
		// execute query and get result list
		List<Budget> theBudget = theQuery.getResultList();
		// return the results		
		return theBudget;
	}

	@Override
	public List<Budget> getExpencesThisMonth() {
		CustomDate d=new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query  ... sort by last name
		Query<Budget> theQuery = 
				currentSession.createQuery("from Budget where type=:budgetType and date between :startDate and :endDate",Budget.class);
		theQuery.setParameter("budgetType", "Expences");
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
		// execute query and get result list
		List<Budget> theBudget = theQuery.getResultList();
		// return the results		
		return theBudget;
	}


	@Override
	public long totalIncomeLastMonth() {
		CustomDate d=new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query  ... sort by last name
		Query theQuery = 
				currentSession.createQuery("select sum(value) from Budget where type=:budgetType and date between :startDate and :endDate");
		theQuery.setParameter("budgetType", "Income");
		theQuery.setParameter("startDate", d.getStartDate());
		theQuery.setParameter("endDate", d.getEndDate());
		// execute query and get result list
		long sum=0;
		try {
	         sum = (long) theQuery.uniqueResult();
	         System.out.println(sum);
	    	} 
		catch (NullPointerException e) {
	        System.out.println(e.getMessage());
	    }
		
		// return the results
		return sum;
	}

	@Override
	public long totalExpencesLastMonth() {
		CustomDate d=new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query  ... sort by last name
		Query theQuery = 
				currentSession.createQuery("select sum(value) from Budget where type=:budgetType and date between :startDate and :endDate");
		theQuery.setParameter("budgetType", "Expences");
		theQuery.setParameter("startDate", d.getStartDate());
		theQuery.setParameter("endDate", d.getEndDate());
		long sum=0;
		try {
	         sum = (long) theQuery.uniqueResult();
	    	} 
		catch (NullPointerException e) {
	        System.out.println(e.getMessage());
	    }
		
		// return the results
		return sum;
	}

	@Override
	public long totalIncomeThisMonth() {
		CustomDate d=new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query  ... sort by last name
		Query theQuery = 
				currentSession.createQuery("select sum(value) from Budget where type=:budgetType and date between :startDate and :endDate");
		theQuery.setParameter("budgetType", "Income");
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
		long sum=0;
		try {
	         sum = (long) theQuery.uniqueResult();
	    	} 
		catch (NullPointerException e) {
	        System.out.println(e.getMessage());
	    }
		
		// return the results
		return sum;
	}

	@Override
	public long totalExpencesThisMonth() {
		CustomDate d=new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query  ... sort by last name
		Query theQuery = 
				currentSession.createQuery("select sum(value) from Budget where type=:budgetType and date between :startDate and :endDate");
		theQuery.setParameter("budgetType", "Expences");
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
		long sum=0;
		try {
	         sum = (long) theQuery.uniqueResult();
	    	} 
		catch (NullPointerException e) {
	        System.out.println(e.getMessage());
	    }
		
		// return the results
		return sum;
	}




	
}
