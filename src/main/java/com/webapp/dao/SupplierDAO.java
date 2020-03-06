package com.webapp.dao;

import java.util.List;

import com.webapp.enity.Supplier;

public interface SupplierDAO {

	public List<Supplier> getAllSuppliers();

	public void saveSupplier(Supplier theSuppliers);

	public Supplier getSalles(int theId);

	public void deleteSuppliers(int theId);
	
}
