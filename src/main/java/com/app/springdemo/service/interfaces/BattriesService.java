package com.app.springdemo.service.interfaces;

import java.util.List;

import com.app.springdemo.entity.Battries;

public interface BattriesService {

	public List<Battries> getAllBattries();

	public void saveBattry(Battries theSalles);

	public Battries getBattry(int theId);

	public void deleteBattries(int theId);
}
