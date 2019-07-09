package com.app.springdemo.dao.intefaces;

import java.util.List;

import com.app.springdemo.entity.Tires;

public interface TiresDAO {

	public List<Tires> getAllTires();

	public void saveSalles(Tires theTires);

	public Tires getTires(int theId);

	public void deleteTires(int theId);
	
}
