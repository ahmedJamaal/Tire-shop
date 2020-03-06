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

import com.webapp.enity.Supplier;
import com.webapp.services.SupplierService;



@Controller
public class SupplierController {
	
	@Autowired
	private SupplierService supplierService;
	

	@RequestMapping("/Supplier")
	public ModelAndView listSupplier(@RequestParam(required = false) Integer page , Model theModel) {
		
		
		List<Supplier> theSupplier = supplierService.getAllSuppliers();
		ModelAndView modelAndView = new ModelAndView("supplier/supplier");
			
		theModel.addAttribute("theSupplier",theSupplier);
		
		PagedListHolder<Supplier> pagedListHolder = new PagedListHolder<>(theSupplier);
	        pagedListHolder.setPageSize(10);
	        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

	        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;

	        modelAndView.addObject("page", page);
	        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
	            pagedListHolder.setPage(0);
	            modelAndView.addObject("supplier", pagedListHolder.getPageList());
	        }
	        else if(page <= pagedListHolder.getPageCount()) {
	            pagedListHolder.setPage(page-1);
	            modelAndView.addObject("supplier", pagedListHolder.getPageList());
	        }
		
		return modelAndView;	
	}

	@GetMapping("/Add-Supplier")
	public String AddSupplier(Model theModel) {
		
		///create model attribute to bind form data
		Supplier theSupplier=new Supplier();
		
		theModel.addAttribute("supplier",theSupplier);
		
		return "supplier/Add-Supplier";
	}
	@PostMapping("/Save-Supplier")
	public String saveSupplier(@ModelAttribute("theSupplier") Supplier theSupplier)
	{
		supplierService.saveSuppliers(theSupplier);
		return "redirect:/Supplier";
	}
	
	/// Update Customer Form
	@GetMapping("/Update-Supplier")
	public String UpdateSupplier(@RequestParam ("supplierId") int theId ,Model theModel) {
		
		//get customer from services
		Supplier theSupplier =supplierService.getSuppliers(theId);
		//set customer as model attibute to form
		theModel.addAttribute("supplier", theSupplier);
		//send over to our form
		
		return "supplier/Add-Supplier";
	}
	
	@GetMapping("/Delete-Supplier")
	public String deleteSupplier(@RequestParam ("supplierId") int theId ,Model theModel) {
		
		//delete customer from services
		supplierService.deleteSuppliers(theId);
		
		return "redirect:/Supplier";
	}
}
