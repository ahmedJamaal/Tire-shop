package com.webapp.daoImple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.dao.BattryDAO;
import com.webapp.enity.Battries;



@Repository
public class BattryDAOImp implements  BattryDAO{
	
	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Battries> getBattries() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query  ... sort by last name
		Query<Battries> theQuery = 
				currentSession.createQuery("from Battries",Battries.class);
		
		// execute query and get result list
		List<Battries> battries = theQuery.getResultList();
				
		// return the results		
		return battries;
	}

	@Override
	public void saveBattry(Battries theBattries) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/upate the customer ... finally LOL
		currentSession.saveOrUpdate(theBattries);
		
	}

	@Override
	public Battries getBattry(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Battries theBattries = currentSession.get(Battries.class, theId);
		
		return theBattries;
	}

	@Override
	public void deleteBattries(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from Battries where id=:battryId");
		theQuery.setParameter("battryId", theId);
		
		theQuery.executeUpdate();		
	}

	@Override
	public List<Battries> getPagentionBattries() {
		/*Session currentSession = sessionFactory.getCurrentSession();
		Query query=currentSession.createQuery("from Battries");  
		query.setFirstResult(5);  
		query.setMaxResult(10);  
		*/return null;
	}

	@Override
	public List<Battries> top15Item() {
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query  ... sort by last name
		Query<Battries> theQuery = 
				currentSession.createQuery("from Battries",Battries.class);
		
		// execute query and get result list
		theQuery.setMaxResults(12);
		List<Battries> battries = theQuery.getResultList();
		
		return battries;
	}

	@Override
	public long TotalPrice() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query q=currentSession.createQuery("select sum(quatity * price) from Battries");  

		return (long) q.uniqueResult();
	}

	@Override
	public long TotalLength() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		Query q=currentSession.createQuery("select count(id) from Battries");  
		
		return (long) q.uniqueResult();
		
	}
	@Override
	public List<Battries> getRefillBattry() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Battries> theQuery = 
				currentSession.createQuery("from Battries ORDER BY quatity",Battries.class);
		
		theQuery.setMaxResults(5);
		List<Battries> battries = theQuery.getResultList();
				
		// return the results		
		return battries;
	}
	
}
