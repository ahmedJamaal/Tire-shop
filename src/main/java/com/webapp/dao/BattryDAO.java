package com.webapp.dao;

import java.util.List;

import com.webapp.enity.Battries;


public interface BattryDAO {

	public List<Battries> getBattries();

	public void saveBattry(Battries theSalles);

	public Battries getBattry(int theId);

	public void deleteBattries(int theId);
	
	public List<Battries> getPagentionBattries();
	
	public List<Battries> top15Item();
	
	public long TotalPrice();
	
	public long TotalLength();
	
	public List<Battries> getRefillBattry();
	

}
