package com.kh.elecshop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.service.MemberService;

@Controller
public class MyPageController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/myPage")
	public void myPage() {
	}
	
	@GetMapping("/myPage_modify")
	public void myPage_modify() {
	}
	
	@GetMapping("/myPage_point")
	public void myPage_point() {
	}
	
	@PostMapping("/checkId")
	public String checkId(LoginDTO loginDTO, RedirectAttributes rttr) {
		MemberVO memberVO = memberService.login(loginDTO);
		if(memberVO == null) {
			rttr.addFlashAttribute("checkIdResult", "fail");
			return "redirect:/myPage";
		}
		return "redirect:/myPage_modify";
	}
	
	@PostMapping("/modifyMember")
	public String modifyMember(MemberVO memberVO, RedirectAttributes rttr, HttpSession session) {
		boolean result = memberService.modifyMember(memberVO);
		
		if(result == true) {
			MemberVO modiMemberVO = memberService.login(memberVO.getMid(), memberVO.getMpw());
			rttr.addFlashAttribute("modifyResult", "success");
			session.removeAttribute("loginInfo");
			session.setAttribute("loginInfo", modiMemberVO);
			return "redirect:/myPage";
		}
		
		rttr.addFlashAttribute("modifyResult", "fail");
		return "redirect:/myPage";
	}
	
	
}
