package com.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webapp.enity.*;
import com.webapp.services.*;



@RestController
@RequestMapping("/Api")
public class AppRestController {

	@Autowired
	private BattriesService battriesService;
	
	@Autowired
	private RimesServices rimesService;
	
	@Autowired
	private BudgetService budgetService;
	
	
	@Autowired
	private SallesService sallesService;
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private TiresService tiresService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/Salle")
	public List <Salles> getSalles()
	{
		return sallesService.getAllSalles();
	}
	
	@GetMapping("/Rimes")
	public List <Rimes> getRimes()
	{
		return rimesService.getRimes();
	}
	@GetMapping("/Tires")
	public List <Tires> getTires()
	{
		return tiresService.getAllTires();
	}
	@GetMapping("/Battries")
	public List <Battries> getBattries()
	{
		return battriesService.getAllBattries();
	}

	@GetMapping("/Budget")
	public List <Budget> getBudget()
	{
		return budgetService.getAllBudget();
	}
	@GetMapping("/User")
	public List <User> getUser()
	{
		return userService.getAllUsers();
	}
	
	
	@GetMapping("/Supplier")//erro
	public List <Supplier> getSupplier()
	{
		return supplierService.getAllSuppliers();
	}
	
	@GetMapping("/CardInfo")//erro
	public List <Tires> getCardInfo()
	{
		return tiresService.getAllTires();
	}
	
	
	

	
}
