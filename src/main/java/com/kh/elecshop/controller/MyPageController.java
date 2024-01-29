package com.kh.elecshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.PointVO;
import com.kh.elecshop.service.MemberService;
import com.kh.elecshop.service.PointService;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
@RequestMapping("/myPage/*")
@Controller
@Log4j
public class MyPageController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private PointService pointService;
	
	@GetMapping("/myInfo")
	public void myInfo() {
		
	}
	@GetMapping("/modify")
	public void myPage_modify() {
	}
	
	@GetMapping("/point")
	public void myPage_point(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		List<PointVO> list = pointService.getPointInfo(memberVO.getMid());
		log.info(list);
		model.addAttribute("pointInfo", list);
	}
	
	@PostMapping("/checkId")
	public String checkId(LoginDTO loginDTO, RedirectAttributes rttr) {
		MemberVO memberVO = memberService.login(loginDTO);
		if(memberVO == null) {
			rttr.addFlashAttribute("checkIdResult", "fail");
			return "redirect:/myPage/info";
		}
		return "redirect:/myPage/modify";
	}
	
	@PostMapping("/modifyMember")
	public String modifyMember(MemberVO memberVO, RedirectAttributes rttr, HttpSession session) {
		boolean result = memberService.modifyMember(memberVO);
		
		if(result == true) {
			MemberVO modiMemberVO = memberService.login(memberVO.getMid(), memberVO.getMpw());
			rttr.addFlashAttribute("modifyResult", "success");
			session.removeAttribute("loginInfo");
			session.setAttribute("loginInfo", modiMemberVO);
			return "redirect:/myPage/myInfo";
		}
		
		rttr.addFlashAttribute("modifyResult", "fail");
		return "redirect:/myPage/myInfo";
	}
	
	
}
