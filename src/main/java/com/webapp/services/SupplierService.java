package com.webapp.services;

import java.util.List;

import com.webapp.enity.Supplier;

public interface SupplierService {

	public List<Supplier> getAllSuppliers();

	public void saveSuppliers(Supplier theSuppliers);

	public Supplier getSuppliers(int theId);

	public void deleteSuppliers(int theId);
}
