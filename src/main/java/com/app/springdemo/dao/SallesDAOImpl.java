package com.app.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.springdemo.dao.intefaces.SallesDAO;
import com.app.springdemo.entity.Salles;

@Repository
public class SallesDAOImpl implements SallesDAO {
	
	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Salles> getAllSalles() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// create a query  ... sort by last name
		Query<Salles> theQuery = 
				currentSession.createQuery("from Salles",Salles.class);
		
		// execute query and get result list
		List<Salles> salles = theQuery.getResultList();
				
		// return the results		
		return salles;
	}

	@Override
	public void saveSalles(Salles theSalles) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/upate the customer ... finally LOL
		currentSession.saveOrUpdate(theSalles);
		
	}

	@Override
	public Salles getSalles(int theId) {
		// get the current hibernate session
				Session currentSession = sessionFactory.getCurrentSession();
				
				// now retrieve/read from database using the primary key
				Salles theSalles = currentSession.get(Salles.class, theId);
				
				return theSalles;
	}

	@Override
	public void deleteSalles(int theId) {
	
		// get the current hibernate session
				Session currentSession = sessionFactory.getCurrentSession();
				
				// delete object with primary key
				Query theQuery = 
						currentSession.createQuery("delete from Salles where id=:SallesId");
				theQuery.setParameter("SallesId", theId);
				
				theQuery.executeUpdate();	
		
	}

	
}
