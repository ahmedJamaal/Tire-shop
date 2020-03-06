package com.webapp.dao;

import java.util.List;

import com.webapp.enity.Salles;

public interface SallesDAO {

	public List<Salles> getAllSalles();

	public void saveSalles(Salles theSalles);

	public Salles getSalles(int theId);

	public void deleteSalles(int theId);
	
	public long totalSales();
	
	public long totalThisMonth();
	
	public long totalThisMonthByType(String Type);
	
	public long totalLastMonth();
	
	public long totalLastMonthByType(String Type);
	
	public List<Salles> topSallesItem();
	
	public List<Object> top5SallesItem();
	
	public List<Salles> SallesThisMonth();
	
}
