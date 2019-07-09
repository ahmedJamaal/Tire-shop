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


import com.app.springdemo.entity.Supplier;
import com.app.springdemo.service.interfaces.SupplierService;

@Controller
public class SupplierController {
	
	@Autowired
	private SupplierService supplierService;
	

	@RequestMapping("/Supplier")
	public String listSupplier(Model theModel) {
		
		
		List<Supplier> theSupplier = supplierService.getAllSuppliers();
	
		theModel.addAttribute("suppliers", theSupplier);
		
		return "supplier";
	}

	@GetMapping("/Add-Supplier")
	public String AddSupplier(Model theModel) {
		
		///create model attribute to bind form data
		Supplier theSupplier=new Supplier();
		
		theModel.addAttribute("supplier",theSupplier);
		
		return "Add-Supplier";
	}
	@PostMapping("/Save-Supplier")
	public String saveSupplier(@ModelAttribute("supplier") Supplier theSupplier)
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
		
		return "Add-Supplier";
	}
	
	@GetMapping("/Delete-Supplier")
	public String deleteSupplier(@RequestParam ("supplierId") int theId ,Model theModel) {
		
		//delete customer from services
		supplierService.deleteSuppliers(theId);
		
		return "redirect:/supplier";
	}
}
