package com.webapp.dao;

import java.util.List;

import com.webapp.enity.Tires;

public interface TiresDAO {

	public List<Tires> getAllTires();

	public void saveTires(Tires theTires);

	public Tires getTires(int theId);

	public void deleteTires(int theId);
	
	public List<Tires> getPagentionTires();
	
	public List<Tires> top15Item();
	
	public long TotalPrice();
	
	public long TotalLength();
	
	public List<Tires> getRefillTire();
	
	
	
}
