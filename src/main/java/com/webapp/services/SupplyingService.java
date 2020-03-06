package com.webapp.services;

import java.util.List;

import com.webapp.enity.Supplying;

public interface SupplyingService {
	

	public List<Supplying> getAllSupplying();

	public void saveSupplying(Supplying theSupplying);

	public Supplying getSupplying(int theId);

	public void deleteSupplying(int theId);
	
	public long totalThisMonthByType(String Type);
	
	public long totalLastMonth();
	
	public long totalThisMonth();
	
	public long totalLastMonthByType(String Type);
	
	public List<Supplying> SupplyingThisMonth();

}
