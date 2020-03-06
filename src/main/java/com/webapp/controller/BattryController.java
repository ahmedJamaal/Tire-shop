package com.webapp.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webapp.enity.Battries;
import com.webapp.enity.ItemList;
import com.webapp.services.BattriesService;



@Controller
public class BattryController {
	
	@Autowired
	private BattriesService battryService;
	

	@RequestMapping("/Battries")
	public ModelAndView listBattry(@RequestParam(required = false) Integer page , Model model) {
		
		ModelAndView modelAndView = new ModelAndView("battry/battries");
		List<Battries> theBattries = battryService.getAllBattries();	
		model.addAttribute("theBattries",theBattries);
		
		PagedListHolder<Battries> pagedListHolder = new PagedListHolder<>(theBattries);
	        pagedListHolder.setPageSize(10);
	        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

	        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;

	        modelAndView.addObject("page", page);
	        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
	            pagedListHolder.setPage(0);
	            modelAndView.addObject("battry", pagedListHolder.getPageList());
	        }
	        else if(page <= pagedListHolder.getPageCount()) {
	            pagedListHolder.setPage(page-1);
	            modelAndView.addObject("battry", pagedListHolder.getPageList());
	        }
		
		return modelAndView;
	}

	@GetMapping("/Add-Battry")
	public String AddBattry(Model theModel) {
		
		Battries theBattry=new Battries();
		
		theModel.addAttribute("battry",theBattry);
		
		return "battry/Add-Battry";
	}
	

	@PostMapping("/Save-Battry")
	public String saveBattry(@ModelAttribute("theBattry") Battries theBattry)
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
		
		return "battry/Add-Battry";
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
