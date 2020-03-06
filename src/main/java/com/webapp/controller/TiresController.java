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
import com.webapp.enity.Tires;
import com.webapp.services.TiresService;

@Controller
public class TiresController {

	@Autowired
	private TiresService tiresService;

	@RequestMapping("/Tires")
	public ModelAndView listTires(@RequestParam(required = false) Integer page, Model theModel) {

		ModelAndView modelAndView = new ModelAndView("tire/Tires");
		List<Tires> theTires = tiresService.getAllTires();

		theModel.addAttribute("theTires", theTires);

		PagedListHolder<Tires> pagedListHolder = new PagedListHolder<>(theTires);
		pagedListHolder.setPageSize(10);
		modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

		if (page == null || page < 1 || page > pagedListHolder.getPageCount())
			page = 1;

		modelAndView.addObject("page", page);
		if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
			pagedListHolder.setPage(0);
			modelAndView.addObject("tire", pagedListHolder.getPageList());
		} else if (page <= pagedListHolder.getPageCount()) {
			pagedListHolder.setPage(page - 1);
			modelAndView.addObject("tire", pagedListHolder.getPageList());
		}

		return modelAndView;
	}

	@GetMapping("/Add-Tires")
	public String AddTires(Model theModel) {

		/// create model attribute to bind form data
		Tires theTires = new Tires();

		theModel.addAttribute("tires", theTires);

		return "tire/Add-Tires";
	}

	@PostMapping("/Save-Tires")
	public String saveTires(@ModelAttribute("tires") Tires theTires) {

		tiresService.saveTires(theTires);
		return "redirect:/Tires";
	}

	@GetMapping("/Delete-Tires")
	public String deleteTires(@RequestParam("tiresId") int theId, Model theModel) {

		// delete customer from services
		tiresService.deleteTires(theId);

		return "redirect:/Tires";
	}

	@ModelAttribute("CountryList")
	public List<String> getCountryList() {
		ItemList list = new ItemList();
		List<String> countryLists = list.getCountryList();
		return countryLists;
	}
}
