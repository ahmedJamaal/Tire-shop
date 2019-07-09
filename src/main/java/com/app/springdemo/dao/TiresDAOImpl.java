package com.app.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.springdemo.dao.intefaces.TiresDAO;
import com.app.springdemo.entity.Tires;

@Repository
public class TiresDAOImpl implements TiresDAO {
	
	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Tires> getAllTires() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// create a query  ... sort by last name
		Query<Tires> theQuery = 
				currentSession.createQuery("from Tires",Tires.class);
		
		// execute query and get result list
		List<Tires> tires = theQuery.getResultList();
				
		// return the results		
		return tires;
	}

	@Override
	public void saveSalles(Tires theTires) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/upate the customer ... finally LOL
		currentSession.saveOrUpdate(theTires);
		
	}

	@Override
	public Tires getTires(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Tires theTires = currentSession.get(Tires.class, theId);
		
		return theTires;
	}

	@Override
	public void deleteTires(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from Tires where id=:tiressId");
		theQuery.setParameter("tiressId", theId);
		
		theQuery.executeUpdate();
		
		
	}


	
}
