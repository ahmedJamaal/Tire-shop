package com.app.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.springdemo.dao.intefaces.SupplierDAO;
import com.app.springdemo.entity.Supplier;
import com.app.springdemo.service.interfaces.SupplierService;

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
