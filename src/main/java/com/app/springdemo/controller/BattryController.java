package com.app.springdemo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.springdemo.entity.Battries;
import com.app.springdemo.entity.ItemList;
import com.app.springdemo.service.interfaces.BattriesService;

@Controller
public class BattryController {
	
	@Autowired
	private BattriesService battryService;
	

	@RequestMapping("/Battries")
	public String listBattry(Model theModel) {
		
		
		List<Battries> theBattries = battryService.getAllBattries();
	
		
		for (Battries battries : theBattries) {
			
			System.out.println(battries);
		}
		
		theModel.addAttribute("battries", theBattries);
		
		return "battries";
	}

	@GetMapping("/Add-Battry")
	public String AddBattry(Model theModel) {
		
		Battries theBattry=new Battries();
		
		theModel.addAttribute("battry",theBattry);
		
		return "Add-Battry";
	}
	

	@PostMapping("/Save-Battry")
	public String saveBattry(@ModelAttribute("battry") Battries theBattry)
	{	
		battryService.saveBattry(theBattry);
		return "redirect:/Battries";
	}
	
	/// Update Customer Form
	@GetMapping("/Update-Battry")
	public String UpdateBattry(@RequestParam ("battryId") int theId ,Model theModel) {
		
		//get customer from services
		Battries theBattries =battryService.getBattry(theId);
		//set customer as model attibute to form
		theModel.addAttribute("battry", theBattries);
		//send over to our form
		
		return "Add-Battry";
	}
	
	@GetMapping("/Delete-Battry")
	public String deleteBattry(@RequestParam ("battryId") int theId ,Model theModel) {
		
		//delete customer from services
		battryService.deleteBattries(theId);
	
		return "redirect:/Battries";
	}
	
	  @ModelAttribute("CountryList")
	    public List<String> getCountryList(){
		  	ItemList list=new ItemList();
	        List<String> countryLists = list.getCountryList();
	        return countryLists;
	    }
}
