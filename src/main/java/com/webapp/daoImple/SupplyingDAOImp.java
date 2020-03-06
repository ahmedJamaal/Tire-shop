package com.webapp.daoImple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.dao.SupplyingDAO;
import com.webapp.enity.Supplying;
import com.webapp.utils.CustomDate;

@Repository
public class SupplyingDAOImp implements SupplyingDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Supplying> getAllSupplying() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Supplying> theQuery = 
				currentSession.createQuery("from Supplying",Supplying.class);
		List<Supplying> supplying = theQuery.getResultList();		
		return supplying;
	}

	@Override
	public void saveSupplying(Supplying theSupplying) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theSupplying);
		
	}

	@Override
	public Supplying getSupplying(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();		
		Supplying theSupplying = currentSession.get(Supplying.class, theId);
		return theSupplying;
	}

	@Override
	public void deleteSupplying(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Object> theQuery = 
				currentSession.createQuery("delete from Supplying where id=:SupplyingId");
		theQuery.setParameter("SupplyingId", theId);
		
		theQuery.executeUpdate();	
		
	}

	@Override
	public long totalThisMonthByType(String Type) {
		CustomDate d =new CustomDate();
		
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Object> theQuery = 
				currentSession.createQuery("select sum(quantity) from Supplying where type=:tempType and date between :startDate and :endDate");
		theQuery.setParameter("tempType",Type);
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
		long supplying=0;
		try {
			supplying = (long) theQuery.uniqueResult();
	    	} 
		catch (NullPointerException e) {
	        System.out.println(e.getMessage());
	    }
		return supplying;
	}

	@Override
	public long totalLastMonth() {
		
		CustomDate d =new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Object> theQuery = 
				currentSession.createQuery("select sum(quantity) from Supplying where date between :startDate and :endDate");
		theQuery.setParameter("startDate", d.getStartDate());
		theQuery.setParameter("endDate", d.getEndDate());
		////theQuery.executeUpdate();	
		
		long supplying=0;
		try {
			supplying = (long) theQuery.uniqueResult();
	    	} 
		catch (NullPointerException e) {
	        System.out.println(e.getMessage());
	    }
		
		return supplying;
	}

	@Override
	public long totalLastMonthByType(String Type) {
		CustomDate d =new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Object> theQuery = 
				currentSession.createQuery("select sum(quantity) from Supplying where type=:tempType and date between :startDate and :endDate");
		theQuery.setParameter("tempType",Type);
		theQuery.setParameter("startDate", d.getStartDate());
		theQuery.setParameter("endDate", d.getEndDate());
		////theQuery.executeUpdate();	
		
		long salles=0;
		try {
	         salles = (long) theQuery.uniqueResult();
	    	} 
		catch (NullPointerException e) {
	        System.out.println(e.getMessage());
	    }
		
		return salles;
	}

	@Override
	public long totalThisMonth() {
		CustomDate d =new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Object> theQuery = 
				currentSession.createQuery("select sum(quantity) from Supplying where date between :startDate and :endDate");
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
		long supplying=0;
		try {
			supplying = (long) theQuery.uniqueResult();
	    	} 
		catch (NullPointerException e) {
	        System.out.println(e.getMessage());
	    }
		
		return supplying;
	}

	@Override
	public List<Supplying> SupplyingThisMonth() {
		CustomDate d =new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Supplying> theQuery = 
				currentSession.createQuery("from Supplying where date between :startDate and :endDate");
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
		List<Supplying> supplying = theQuery.getResultList();	
		
		return supplying;
	}
	
	
}
