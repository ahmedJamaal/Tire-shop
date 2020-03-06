package com.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webapp.enity.*;
import com.webapp.services.*;

@Controller
public class homeController {

	@Autowired
	private BattriesService battryService;

	@Autowired
	private TiresService tireService;

	@Autowired
	private SallesService sallesService;

	@Autowired
	private RimesServices rimesService;

	@Autowired
	private BudgetService budgetService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model theModel) {

		theModel.addAttribute("tireQuantity", tireService.TotalLength());
		theModel.addAttribute("tirePrice", tireService.TotalPrice());

		theModel.addAttribute("battaryQuantity", battryService.TotalLength());
		theModel.addAttribute("battaryPrice", battryService.TotalPrice());

		theModel.addAttribute("rimesQuantity", rimesService.TotalLength());
		theModel.addAttribute("rimesPrice", rimesService.TotalPrice());

		theModel.addAttribute("sallesLastMonth", sallesService.totalLastMonth());
		theModel.addAttribute("sallesThisMonth", sallesService.totalThisMonth());

		theModel.addAttribute("budget", budgetService.totalIncomeThisMonth() - budgetService.totalExpencesThisMonth());
		theModel.addAttribute("budgetLastMonth",
				budgetService.totalIncomeLastMonth() - budgetService.totalExpencesLastMonth());

		theModel.addAttribute("topSallesProduct", sallesService.top5SallesItem());
		theModel.addAttribute("top15Tires", tireService.top15Item());
		theModel.addAttribute("top15Battry", battryService.top15Item());
		theModel.addAttribute("top15Rimes", rimesService.top15Item());

		theModel.addAttribute("topRefillTires", tireService.refillTire());
		theModel.addAttribute("topRefillBattry", battryService.refillBattry());
		theModel.addAttribute("topRefillRimes", rimesService.getRefillRimes());

		return "home";
	}


}
