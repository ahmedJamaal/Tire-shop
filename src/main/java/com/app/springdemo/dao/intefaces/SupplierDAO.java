package com.app.springdemo.dao.intefaces;

import java.util.List;


import com.app.springdemo.entity.Supplier;

public interface SupplierDAO {

	public List<Supplier> getAllSuppliers();

	public void saveSupplier(Supplier theSuppliers);

	public Supplier getSalles(int theId);

	public void deleteSuppliers(int theId);
	
}
