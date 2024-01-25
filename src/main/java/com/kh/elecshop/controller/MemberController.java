package com.kh.elecshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/main")
	public void main() {
		
	}
	@GetMapping("/signup")
	public void signup() {
		
	}
	
	@PostMapping("/registerMember")
	public String registerMember(MemberVO memberVO) {
		log.info(memberVO);
		boolean result = memberService.registerMember(memberVO);
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/loginPost")
	public void loginPost(String mid, String mpw, Model model) {
		MemberVO memberVO = memberService.login(mid, mpw);
		if(memberVO == null) {
			return;
		}
		model.addAttribute("loginInfo", memberVO);
	}
}
