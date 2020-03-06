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

import com.webapp.enity.ItemList;
import com.webapp.enity.Rimes;
import com.webapp.services.RimesServices;

@Controller
public class RimesController {

	@Autowired
	private RimesServices rimesService;
	
	@RequestMapping("/Rimes")
	public ModelAndView listBattry(@RequestParam(required = false) Integer page ,Model model) {
		
		ModelAndView modelAndView = new ModelAndView("rimes/Rimes");
		List<Rimes> theRimes = rimesService.getRimes();	
			
		model.addAttribute("theRimes",theRimes);
		
		PagedListHolder<Rimes> pagedListHolder = new PagedListHolder<>(theRimes);
	        pagedListHolder.setPageSize(10);
	        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

	        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;

	        modelAndView.addObject("page", page);
	        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
	            pagedListHolder.setPage(0);
	            modelAndView.addObject("rimes", pagedListHolder.getPageList());
	        }
	        else if(page <= pagedListHolder.getPageCount()) {
	            pagedListHolder.setPage(page-1);
	            modelAndView.addObject("rimes", pagedListHolder.getPageList());
	        }
		
		return modelAndView;
	}

	@GetMapping("/Add-Rimes")
	public String AddBattry(Model theModel) {
		
		Rimes theRimes=new Rimes();
		
		theModel.addAttribute("Rimes",theRimes);
		
		return "rimes/Add-Rimes";
	}
	

	@PostMapping("/Save-Rimes")
	public String saveBattry(@ModelAttribute("theRimes") Rimes theRimes)
	{	
		rimesService.saveRimes(theRimes);
		return "redirect:/Rimes";
	}
	
	/// Update Customer Form
	@GetMapping("/Update-Rimes")
	public String UpdateBattry(@RequestParam ("rimesId") int theId ,Model theModel) {
		
		//get customer from services
		Rimes theRimes =rimesService.getRimes(theId);
		//set customer as model attibute to form
		theModel.addAttribute("rimes", theRimes);
		//send over to our form
		
		return "rimes/Add-Rimes";
	}
	
	@GetMapping("/Delete-Rimes")
	public String deleteBattry(@RequestParam ("rimesId") int theId ,Model theModel) {
		
		//delete customer from services
		rimesService.deleteRimes(theId);
	
		return "redirect:/Rimes";
	}

	  @ModelAttribute("CountryList")
	    public List<String> getCountryList(){
		  	ItemList list=new ItemList();
	        List<String> countryLists = list.getCountryList();
	        return countryLists;
	    }
	
}
