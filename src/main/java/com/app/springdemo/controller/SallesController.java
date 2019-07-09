package com.app.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.springdemo.entity.Battries;
import com.app.springdemo.entity.Salles;
import com.app.springdemo.entity.Tires;
import com.app.springdemo.service.interfaces.BattriesService;
import com.app.springdemo.service.interfaces.SallesService;
import com.app.springdemo.service.interfaces.TiresService;


@Controller
public class SallesController {
	

	@Autowired
	private SallesService sallesService;
	
	@Autowired
	private BattriesService battriesService;
	
	@Autowired
	private TiresService tiresService;

	@RequestMapping("/Salles")
	public String listSalles(Model theModel) {
		
		List <Salles> theSalles = sallesService.getAllSalles();
		
		for (Salles salles : theSalles) {
			
			System.out.println(salles);
		}
		
	
		theModel.addAttribute("salles", theSalles);
		
		return "salles";
	}

	@GetMapping("/Add-Salles")
	public String AddSalles(Model theModel) {

		Salles theSalles=new Salles();
		
		theModel.addAttribute("salles",theSalles);
		
		return "Add-Salles";
	}

	
	@PostMapping("/Save-Salles")
	public String saveSalles(@ModelAttribute("salles") Salles theSalles)
	{
		sallesService.saveSalles(theSalles);
		
		String type=theSalles.getType();
		if(type.equals("Tires"))
		{
			Tires tire=tiresService.getTires(theSalles.getProductId());
			int x=tire.getQuatity()-theSalles.getQuantity();
			tire.setQuatity(x);
			tiresService.saveSalles(tire);
			System.out.println(tire.toString());
			
		}
		else
		{
			Battries battry=battriesService.getBattry(theSalles.getProductId());
			int y=battry.getQuatity()-theSalles.getQuantity();
			battry.setQuatity(y);
			battriesService.saveBattry(battry);
			System.out.println(battry.toString());
		}
		return "redirect:/Salles";
	}
	
	@GetMapping("/Update-Salles")
	public String UpdateSalles(@RequestParam ("sallesId") int theId ,Model theModel) {
		
		Salles theSalles =sallesService.getSalles(theId);
		theModel.addAttribute("salles", theSalles);
		
		return "Add-Salles";
	}
	
	@GetMapping("/Delete-Salles")
	public String deletSalles(@RequestParam ("sallesId") int theId ,Model theModel) {


		sallesService.deleteSalles(theId);
	
		return "redirect:/Salles";
	}
	
	
}
