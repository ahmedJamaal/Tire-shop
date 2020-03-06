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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webapp.enity.Battries;
import com.webapp.enity.Rimes;
import com.webapp.enity.Salles;
import com.webapp.enity.Tires;
import com.webapp.services.BattriesService;
import com.webapp.services.RimesServices;
import com.webapp.services.SallesService;
import com.webapp.services.TiresService;
import com.webapp.utils.CustomDate;



@Controller
public class SallesController {
	

	@Autowired
	private SallesService sallesService;
	
	@Autowired
	private BattriesService battriesService;
	
	@Autowired
	private TiresService tiresService;
	
	@Autowired
	private RimesServices rimesService;
	
	@RequestMapping("/Sales")
	public String Salles(Model theModel) {
		CustomDate d = new CustomDate();
		Salles salles=new Salles();
		
		theModel.addAttribute("sales", salles);
		
		theModel.addAttribute("thisMonthName", d.CurrentMonthName());
		
		theModel.addAttribute("totalThisMonth", sallesService.totalThisMonth());
		theModel.addAttribute("totalTire", sallesService.totalThisMonthByType("tire"));
		theModel.addAttribute("totalBattry", sallesService.totalThisMonthByType("battry"));
		theModel.addAttribute("totalRimes", sallesService.totalThisMonthByType("rimes"));
		
		theModel.addAttribute("salesThisMonth", sallesService.SallesThisMonth());
		System.out.println(sallesService.SallesThisMonth().toString());
		////theModel.addAttribute("salles", theSalles);
		
		return "sales/salles";
	}
	@RequestMapping(value = "/export-sales", method = RequestMethod.GET)
	public ModelAndView getExcel() {
		List <Salles> theSales = sallesService.getAllSalles();
		return new ModelAndView("SalesListExcel", "theSales", theSales);
	}

	@RequestMapping("/Sales-list")
	public ModelAndView listSalles(@RequestParam(required = false) Integer page , Model theModel) {
		ModelAndView modelAndView = new ModelAndView("sales/salles-list");

		List <Salles> theSales = sallesService.getAllSalles();
		System.out.println(theSales.size());
		theModel.addAttribute("theSales",theSales);
		
		PagedListHolder<Salles> pagedListHolder = new PagedListHolder<>(theSales);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;

        modelAndView.addObject("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("sales", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("sales", pagedListHolder.getPageList());
        }
		return modelAndView;
	}

	@GetMapping("/Add-Sales")
	public String AddSalles(Model theModel) {

		Salles theSalles=new Salles();
		
		theModel.addAttribute("sales",theSalles);
		
		return "sales/Add-Salles";
	}

	
	@PostMapping("/Save-Sales")
	public String saveSalles(@ModelAttribute("salles") Salles theSalles)
	{
		sallesService.saveSalles(theSalles);
		
		String type=theSalles.getType();
		if(type.equals("Tire"))
		{
			Tires tire=tiresService.getTires(theSalles.getProductId());
			int x=tire.getQuatity()-theSalles.getQuantity();
			tire.setQuatity(x);
			tiresService.saveTires(tire);
			
		}
		else if(type.equals("Rimes"))
		{
			Rimes rimes=rimesService.getRimes(theSalles.getProductId());
			int r=rimes.getQuatity() - theSalles.getQuantity();
			rimes.setQuatity(r);
			rimesService.saveRimes(rimes);
			
		}
		else if(type.equals("Battry"))
		{
			Battries battry=battriesService.getBattry(theSalles.getProductId());
			int y=battry.getQuatity()-theSalles.getQuantity();
			battry.setQuatity(y);
			battriesService.saveBattry(battry);
			System.out.println(battry.toString());
		}
		return "redirect:/Sales";
	}
	
	@GetMapping("/Delete-Sales")
	public String deletSalles(@RequestParam ("sallesId") int theId ,Model theModel) {


		sallesService.deleteSalles(theId);
	
		return "redirect:/sales/Salles";
	}
	
	
}
