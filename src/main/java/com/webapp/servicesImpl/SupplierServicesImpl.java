package com.webapp.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.dao.SupplierDAO;
import com.webapp.enity.Supplier;
import com.webapp.services.SupplierService;


@Service
public class SupplierServicesImpl implements SupplierService{
	
	@Autowired
	private SupplierDAO supplierDAO;
	

	@Override
	@Transactional
	public void saveSuppliers(Supplier theSuppliers) {

		supplierDAO.saveSupplier(theSuppliers);
		
	}

	@Override
	@Transactional
	public Supplier getSuppliers(int theId) {


		return supplierDAO.getSalles(theId);
	}

	@Override
	@Transactional
	public void deleteSuppliers(int theId) {
		supplierDAO.deleteSuppliers(theId);
		
	}

	@Override
	@Transactional
	public List<Supplier> getAllSuppliers() {
		
		return supplierDAO.getAllSuppliers();
	}

}
