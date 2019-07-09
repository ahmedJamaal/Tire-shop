package com.app.springdemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.app.springdemo.entity.Battries;
import com.app.springdemo.entity.Tires;
import com.app.springdemo.service.interfaces.BattriesService;
import com.app.springdemo.service.interfaces.TiresService;

@Controller
public class NavController {


	@Autowired
	private BattriesService battriesService;
	
	@Autowired
	private TiresService tiresService;
	
	public String EditProduct(int id,int Quantity ,String Type)
	{
		if(Type=="Tires")
		{
			Tires tire=tiresService.getTires(id);
			int x=tire.getQuatity()-Quantity;
			tire.setQuatity(x);
			tiresService.saveSalles(tire);
			System.out.println(tire);
			
		}
		else
		{
			Battries battry=battriesService.getBattry(id);
			int y=battry.getQuatity()-Quantity;
			battry.setQuatity(y);
			battriesService.saveBattry(battry);
			System.out.println(battry);
		}
		return "redirect:/Salles";
	}
	/*@GetMapping("/")
	public String home() {
		
		return "index";
	}*/

}
