package com.kh.elecshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/admin")
	public void admin() {
		
	}
	@GetMapping("/admin_customerCenter")
	public void admin_customerCenter() {
		
	}
}
