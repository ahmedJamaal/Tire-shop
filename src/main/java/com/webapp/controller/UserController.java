package com.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webapp.enity.User;
import com.webapp.services.UserService;


@Controller
public class UserController {

	
	@Autowired
	private UserService userService;
	

	@RequestMapping("/Users")
	public String listUsers(Model theModel) {
		
		
		List<User> theUser = userService.getAllUsers();
	
		theModel.addAttribute("user", theUser);
		
		return "user/users";
	}

	@GetMapping("/Add-Users")
	public String AddUser(Model theModel) {
		
		///create model attribute to bind form data
		User theUser=new User();
		
		theModel.addAttribute("user",theUser);
		
		return "user/Add-User";
	}
	@PostMapping("/Save-User")
	public String saveUsers(@ModelAttribute("user") User theUser)
	{
		userService.saveUsers(theUser);
		return "redirect:/Add-User";
	}
	
	/// Update Customer Form
	@GetMapping("/Update-User")
	public String UpdateUser(@RequestParam ("userId") int theId ,Model theModel) {
		
		//get customer from services
		User theUser =userService.getUser(theId);
		theModel.addAttribute("user", theUser);
		//send over to our form
		
		return "Add-User";
	}
	
	@GetMapping("/Delete-User")
	public String deleteUser(@RequestParam ("userId") int theId ,Model theModel) {
		
		//delete customer from services
		userService.deleteUsers(theId);
	
		return "redirect:/User";
	}
}
