package com.webapp.dao;

import java.util.List;

import com.webapp.enity.Supplying;

public interface SupplyingDAO {

	public List<Supplying> getAllSupplying();

	public void saveSupplying(Supplying theSupplying);

	public Supplying getSupplying(int theId);

	public void deleteSupplying(int theId);
	
	public long totalThisMonthByType(String Type);
	
	public long totalLastMonth();
	
	public long totalLastMonthByType(String Type);
	
	public long totalThisMonth();
	
	public List<Supplying> SupplyingThisMonth();
}
