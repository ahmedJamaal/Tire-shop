package com.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.webapp.enity.Rimes;
import com.webapp.enity.Supplying;
import com.webapp.enity.Tires;
import com.webapp.services.BattriesService;
import com.webapp.services.RimesServices;
import com.webapp.services.SupplyingService;
import com.webapp.services.TiresService;
import com.webapp.utils.CustomDate;

@Controller
public class SupplyingController {

	@Autowired
	private SupplyingService supplyService;
	
	@Autowired
	private BattriesService battriesService;
	
	@Autowired
	private TiresService tiresService;
	
	@Autowired
	private RimesServices rimesService;
	
	@RequestMapping("/Supplying")
	public String Supplying(Model theModel,HttpServletRequest request) {
		
		CustomDate d = new CustomDate();
		Supplying supplying=new Supplying();
		
		theModel.addAttribute("supplying", supplying);
		
		theModel.addAttribute("thisMonthName", d.CurrentMonthName());
		
		theModel.addAttribute("totalThisMonth", supplyService.totalThisMonth());
		theModel.addAttribute("totalTire", supplyService.totalThisMonthByType("tire"));
		theModel.addAttribute("totalBattry", supplyService.totalThisMonthByType("battry"));
		theModel.addAttribute("totalRimes", supplyService.totalThisMonthByType("rimes"));
		
		theModel.addAttribute("supplyingThisMonth", supplyService.SupplyingThisMonth());
		
		return "supplying/supplying";
	}
	@RequestMapping("/Supplying-list")
	public ModelAndView listSalles(@RequestParam(required = false) Integer page , Model theModel) {
		ModelAndView modelAndView = new ModelAndView("supplying/supplying-list");

		List <Supplying> theSupplying = supplyService.getAllSupplying();
		
		theModel.addAttribute("theSupplying",theSupplying);
		
		PagedListHolder<Supplying> pagedListHolder = new PagedListHolder<>(theSupplying);
	        pagedListHolder.setPageSize(10);
	        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

	        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;

	        modelAndView.addObject("page", page);
	        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
	            pagedListHolder.setPage(0);
	            modelAndView.addObject("supplying", pagedListHolder.getPageList());
	        }
	        else if(page <= pagedListHolder.getPageCount()) {
	            pagedListHolder.setPage(page-1);
	            modelAndView.addObject("supplying", pagedListHolder.getPageList());
	        }
		
		return modelAndView;
	}
	@PostMapping("/Save-Supplying")
	public String saveSalles(@ModelAttribute("supplying") Supplying theSupplying)
	{
		theSupplying.toString();
		
		String type=theSupplying.getType();
		if(type.equals("Tire"))
		{
			Tires tire=tiresService.getTires(theSupplying.getProductId());
			theSupplying.setProductId(tire.getId());
			theSupplying.setQuantity_Before(tire.getQuatity());
			int x=tire.getQuatity()+theSupplying.getQuantity();
			tire.setQuatity(x);
			tiresService.saveTires(tire);
			
			
		}
		else if(type.equals("Rimes"))
		{
			Rimes rimes=rimesService.getRimes(theSupplying.getProductId());
			theSupplying.setProductId(rimes.getId());
			theSupplying.setQuantity_Before(rimes.getQuatity());
			int r=rimes.getQuatity() + theSupplying.getQuantity();
			rimes.setQuatity(r);
			rimesService.saveRimes(rimes);
			
		}
		else if(type.equals("Battry"))
		{
			Battries battry=battriesService.getBattry(theSupplying.getProductId());
			
			theSupplying.setProductId(battry.getId());
			theSupplying.setQuantity_Before(battry.getQuatity());
			
			int y=battry.getQuatity()+theSupplying.getQuantity();
			battry.setQuatity(y);
			battriesService.saveBattry(battry);
		}
		
		supplyService.saveSupplying(theSupplying);
		
		return "redirect:/Supplying";
	}
	
	@GetMapping("/Delete-Supplying")
	public String deletSalles(@RequestParam ("supplyingId") int theId ,Model theModel) {

		Supplying theSupplying=supplyService.getSupplying(theId);
		
		supplyService.deleteSupplying(theId);
		String type=theSupplying.getType();
		if(type.equals("Tire"))
		{
			Tires tire=tiresService.getTires(theSupplying.getProductId());
			int x=tire.getQuatity()-theSupplying.getQuantity();
			tire.setQuatity(x);
			tiresService.saveTires(tire);
			
		}
		else if(type.equals("Rimes"))
		{
			Rimes rimes=rimesService.getRimes(theSupplying.getProductId());
			int r=rimes.getQuatity() - theSupplying.getQuantity();
			rimes.setQuatity(r);
			rimesService.saveRimes(rimes);
			
		}
		else if(type.equals("Battry"))
		{
			Battries battry=battriesService.getBattry(theSupplying.getProductId());
			int y=battry.getQuatity()-theSupplying.getQuantity();
			battry.setQuatity(y);
			battriesService.saveBattry(battry);
			System.out.println(battry.toString());
		}
		return "redirect:/Supplying";
	}
}
