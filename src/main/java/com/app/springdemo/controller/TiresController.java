package com.app.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.springdemo.entity.ItemList;
import com.app.springdemo.entity.Tires;
import com.app.springdemo.service.interfaces.TiresService;

@Controller
public class TiresController {

	
	@Autowired
	private TiresService tiresService;
	

	@RequestMapping("/Tires")
	public String listTires(Model theModel) {
		
		
		List<Tires> theTires = tiresService.getAllTires();
	
		theModel.addAttribute("tires", theTires);
		
		return "tires";
	}

	@GetMapping("/Add-Tires")
	public String AddTires(Model theModel) {
		
		///create model attribute to bind form data
		Tires theTires=new Tires();
		
		theModel.addAttribute("tires",theTires);
		
		return "Add-Tires";
	}
	@PostMapping("/Save-Tires")
	public String saveTires(@ModelAttribute("tires") Tires theTires)
	{
		tiresService.saveSalles(theTires);
		return "redirect:/Add-Tires";
	}
	
	/// Update Customer Form
	@GetMapping("/Update-Tires")
	public String UpdateTires(@RequestParam ("tiresId") int theId ,Model theModel) {


		Tires theTires =tiresService.getTires(theId);
		theModel.addAttribute("tires", theTires);
		return "Add-Tires";
	}
	
	@GetMapping("/Delete-Tires")
	public String deleteTires(@RequestParam ("tiresId") int theId ,Model theModel) {
		
		//delete customer from services
		tiresService.deleteTires(theId);
	
		return "redirect:/Tires";
	}
	
	  @ModelAttribute("CountryList")
	    public List<String> getCountryList(){
		  	ItemList list=new ItemList();
	        List<String> countryLists = list.getCountryList();
	        return countryLists;
	    }
}
