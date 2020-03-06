package com.webapp.services;

import java.util.List;

import com.webapp.enity.Rimes;

public interface RimesServices {

	public List<Rimes> getRimes();

	public void saveRimes(Rimes theRimes);

	public Rimes getRimes(int theId);

	public void deleteRimes(int theId);
	
	public List<Rimes> getPagentionRimes();
	
	public List<Rimes> top15Item();
	
	public long TotalPrice();
	
	public long TotalLength();
	
	public List<Rimes> getRefillRimes();
}
