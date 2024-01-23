package com.kh.elecshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customerCenter")
public class DongyeongController {
	
	@GetMapping("/FAQ")
	public void FAQ() {
		
	}
	@GetMapping("/notice")
	public void notice() {
		
	}
	@GetMapping("/inquiry")
	public void inquiry() {
		
	}
	@GetMapping("/question")
	public void question() {
		
	}
}
