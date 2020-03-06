package com.webapp.services;

import java.util.List;

import com.webapp.enity.Battries;


public interface BattriesService {

	public List<Battries> getAllBattries();

	public void saveBattry(Battries theSalles);

	public Battries getBattry(int theId);

	public void deleteBattries(int theId);
	
	public List<Battries> getPagentionBattries();
	
	public List<Battries> top15Item();
	
	public List<Battries> refillBattry();
	
	public long TotalPrice();
	
	public long TotalLength();
	
}
