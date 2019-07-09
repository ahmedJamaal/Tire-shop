package com.app.springdemo.dao.intefaces;

import java.util.List;

import com.app.springdemo.entity.Battries;

public interface BattryDAO {

	public List<Battries> getBattries();

	public void saveBattry(Battries theSalles);

	public Battries getBattry(int theId);

	public void deleteBattries(int theId);
}
