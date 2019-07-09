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

import com.app.springdemo.entity.Budget;
import com.app.springdemo.service.interfaces.BudgetService;

@Controller
public class BudgetController {
	
	@Autowired
	private BudgetService budgetService;
	
	
	@RequestMapping("/Budget-Table")
	public String listBudget(Model theModel) {
		
		
		List<Budget> theBudget = budgetService.getAllBudget();
		theModel.addAttribute("budget", theBudget);
		
		return "budget-table";
	}
	
	@GetMapping("/Budget")
	public String AddBudget(Model theModel) {
		
		///create model attribute to bind form data
		Budget theBudget=new Budget();
		
		List<Budget> theIncomeList = budgetService.getAllIncome();
		int totalIncome=createTotal(theIncomeList);
		
		List<Budget> theExpensesList = budgetService.getAllExpences();
		int totalExpenses=createTotal(theExpensesList);
		theModel.addAttribute("budget",theBudget);
		
		int totals=totalIncome-totalExpenses;
		theModel.addAttribute("theIncome",theIncomeList);
		theModel.addAttribute("theExpenses",theExpensesList);
		
		theModel.addAttribute("toExpenses",totalExpenses);
		theModel.addAttribute("totIncome",totalIncome);
		theModel.addAttribute("total",totals);
		
		return "budget";
	}
	@PostMapping("/Save-Budget")
	public String saveBudget(@ModelAttribute("budget") Budget theBudget)
	{	theBudget.Calculation(theBudget.getType());
		budgetService.saveBudget(theBudget);
		return "redirect:/Budget";
	}
	
	/// Update Customer Form
	@GetMapping("/Update-Budget")
	public String UpdateBudget(@RequestParam ("budgetId") int theId ,Model theModel) {
		
		//get customer from services
		Budget theBudget =budgetService.getBudget(theId);
		//set customer as model attibute to form
		theModel.addAttribute("budget", theBudget);
		//send over to our form
		
		return "redirect:/budget";
	}
	
	@GetMapping("/Delete-Budget")
	public String deleteBudget(@RequestParam ("budgetId") int theId ,Model theModel) {
		
		//delete customer from services
		budgetService.deleteBudget(theId);
	
		return "redirect:/Budget-Table";
	}
	
	public int createTotal(List<Budget> data)
	{
		int total=0;
		for (Budget budget : data) {
			total+=budget.getValue();
		}	
		
		return total;
	}
	
	}
