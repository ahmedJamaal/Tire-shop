package com.app.springdemo.service.interfaces;

import java.util.List;

import com.app.springdemo.entity.Supplier;

public interface SupplierService {

	public List<Supplier> getAllSuppliers();

	public void saveSuppliers(Supplier theSuppliers);

	public Supplier getSuppliers(int theId);

	public void deleteSuppliers(int theId);
}
