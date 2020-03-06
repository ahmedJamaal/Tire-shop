package com.webapp.daoImple;


import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.dao.SallesDAO;
import com.webapp.enity.Salles;
import com.webapp.utils.CustomDate;


@Repository
public class SallesDAOImpl implements SallesDAO {
	
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<Salles> getAllSalles() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Salles> theQuery = 
				currentSession.createQuery("from Salles",Salles.class);
		List<Salles> salles = theQuery.getResultList();		
		return salles;
	}

	@Override
	public void saveSalles(Salles theSalles) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theSalles);
		
	}

	@Override
	public Salles getSalles(int theId) {
		
		Session currentSession = sessionFactory.getCurrentSession();		
		Salles theSalles = currentSession.get(Salles.class, theId);
		return theSalles;
	}

	@Override
	public void deleteSalles(int theId) {
	
		Session currentSession = sessionFactory.getCurrentSession();
				
		Query<Object> theQuery = 
				currentSession.createQuery("delete from Salles where id=:SallesId");
		theQuery.setParameter("SallesId", theId);
		
		theQuery.executeUpdate();	
		
	}

	@Override
	public long totalSales() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Object> theQuery = 
				currentSession.createQuery("select sum(quantity * price) from Salles");
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
				currentSession.createQuery("select sum(quantity * price) from Salles where date between :startDate and :endDate");
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
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
	public long totalLastMonth() {
	CustomDate d =new CustomDate();
		
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Object> theQuery = 
				currentSession.createQuery("select sum(quantity * price) from Salles where date between :startDate and :endDate");
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
	public List<Salles> topSallesItem() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<?> theQuery = 
				currentSession.createQuery("FROM salles");
		
		List<?> salles = theQuery.list();	
	    	
		
		return null;
		
	}

	@Override
	public List<Object> top5SallesItem() {
		Session currentSession = sessionFactory.getCurrentSession();
		String SQL_QUERY = "SELECT productName ,type ,sum(quantity) as total FROM Salles GROUP BY productName ORDER BY total DESC";
		  Query query = currentSession.createQuery(SQL_QUERY);
		  List<Object> list=query.setMaxResults(6).getResultList();
		  
		  System.out.println(list.size());
		  
		  
		return list;
	}

	@Override
	public long totalThisMonthByType(String Type) {
		CustomDate d =new CustomDate();
		
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Object> theQuery = 
				currentSession.createQuery("select sum(quantity * price) from Salles where type=:tempType and date between :startDate and :endDate");
		theQuery.setParameter("tempType",Type);
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
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
	public long totalLastMonthByType(String Type) {
		
		CustomDate d =new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Object> theQuery = 
				currentSession.createQuery("select sum(quantity * price) from Salles where type=:tempType and date between :startDate and :endDate");
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
	public List<Salles> SallesThisMonth() {
		
		CustomDate d =new CustomDate();
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Salles> theQuery = 
				currentSession.createQuery("from Salles where date between :startDate and :endDate");
		theQuery.setParameter("startDate", d.getStartCurrentDate());
		theQuery.setParameter("endDate", d.getCurrentDate());
		List<Salles> salles = theQuery.getResultList();	
		
		return salles;
	}

	
}
