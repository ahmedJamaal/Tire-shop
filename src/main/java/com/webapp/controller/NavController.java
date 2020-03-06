package com.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.webapp.enity.Battries;
import com.webapp.enity.Tires;
import com.webapp.services.BattriesService;
import com.webapp.services.TiresService;


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
			tiresService.saveTires(tire);
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
