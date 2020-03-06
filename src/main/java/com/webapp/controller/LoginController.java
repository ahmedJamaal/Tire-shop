package com.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/Login")
	public String showMyLoginPage() {
		
		// return "plain-login";

		return "login";
		
	}
}
