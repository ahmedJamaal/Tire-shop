package com.app.springdemo.service.interfaces;

import java.util.List;


import com.app.springdemo.entity.Salles;

public interface SallesService {

	public List<Salles> getAllSalles();

	public void saveSalles(Salles theSalles);

	public Salles getSalles(int theId);

	public void deleteSalles(int theId);
}
