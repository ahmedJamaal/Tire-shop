package com.webapp.daoImple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.dao.SupplierDAO;
import com.webapp.enity.Supplier;


@Repository
public class SupplierDAOImpl implements SupplierDAO {
		
	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Supplier> getAllSuppliers() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// create a query  ... sort by last name
		Query<Supplier> theQuery = 
				currentSession.createQuery("from Supplier",Supplier.class);
		
		// execute query and get result list
		List<Supplier> salles = theQuery.getResultList();
				
		// return the results		
		return salles;
	}

	@Override
	public void saveSupplier(Supplier theSuppliers) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/upate the customer ... finally LOL
		currentSession.saveOrUpdate(theSuppliers);
		
	}

	@Override
	public Supplier getSalles(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Supplier theSuppliers = currentSession.get(Supplier.class, theId);
		
		return theSuppliers;
	}

	@Override
	public void deleteSuppliers(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from Supplier where id=:suppliersId");
		theQuery.setParameter("suppliersId", theId);
		
		theQuery.executeUpdate();
		
	}

}
