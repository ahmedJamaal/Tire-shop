package com.webapp.services;

import java.util.List;

import com.webapp.enity.Salles;

public interface SallesService {

	public List<Salles> getAllSalles();

	public void saveSalles(Salles theSalles);

	public Salles getSalles(int theId);

	public void deleteSalles(int theId);
	
	public long totalSales();
	
	public long totalThisMonth();
	
	public long totalThisMonthByType(String Type);
	
	
	public long totalLastMonthByType(String Type);
	
	public long totalLastMonth();
	
	public List<Salles> topSallesItem();
	
	public List<Object> top5SallesItem();
	
	public List<Salles> SallesThisMonth();
}

