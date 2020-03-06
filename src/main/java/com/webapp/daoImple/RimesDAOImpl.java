package com.webapp.daoImple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.dao.RimesDAO;
import com.webapp.enity.Rimes;

@Repository
public class RimesDAOImpl implements RimesDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Rimes> getRimes() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Rimes> theQuery = 
				currentSession.createQuery("from Rimes",Rimes.class);
		List<Rimes> rimes = theQuery.getResultList();
			
		return rimes;
	}

	@Override
	public void saveRimes(Rimes theRimes) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(theRimes);
		
	}

	@Override
	public Rimes getRimes(int theId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Rimes theRimes = currentSession.get(Rimes.class, theId);
		
		return theRimes;
	}

	@Override
	public void deleteRimes(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from Rimes where id=:RimesId");
		theQuery.setParameter("RimesId", theId);
		
		theQuery.executeUpdate();
		
	}

	@Override
	public List<Rimes> getPagentionRimes() {

		return null;
	}

	@Override
	public List<Rimes> top15Item() {
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query  ... sort by last name
		Query<Rimes> theQuery = 
				currentSession.createQuery("from Rimes",Rimes.class);
		
		// execute query and get result list
		theQuery.setMaxResults(12);
		List<Rimes> rimes = theQuery.getResultList();
		
		return rimes;
	}

	@Override
	public long TotalPrice() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query q=currentSession.createQuery("select sum(quatity * price) from Rimes");  

		return (long) q.uniqueResult();
	}

	@Override
	public long TotalLength() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query q=currentSession.createQuery("select count(id) from Rimes");  
		
		return (long) q.uniqueResult();
	}

	@Override
	public List<Rimes> getRefillRimes() {
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query  ... sort by last name
		Query<Rimes> theQuery = 
				currentSession.createQuery("from Rimes ORDER BY quatity",Rimes.class);
		
		// execute query and get result list
		theQuery.setMaxResults(5);
		List<Rimes> rimes = theQuery.getResultList();
		
		return rimes;
	}

}
