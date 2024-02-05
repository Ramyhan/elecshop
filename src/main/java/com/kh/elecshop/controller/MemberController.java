package com.kh.elecshop.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.elecshop.domain.CouponVO;
import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.mapper.CouponMapper;
import com.kh.elecshop.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponMapper couponMapper;
	
	@GetMapping("/main")
	public void main() {
//		ModelMap map = (ModelMap)modelAndView.getModel();
//		String isVisit = (String)map.get("visit");
//		if(isVisit == null || isVisit.equals("")) {
//			Cookie cookie = new Cookie("visit", "visit");
//			cookie.setMaxAge(60 * 60 * 24);
//			response.addCookie(cookie);
//		}
//		modelAndView.setViewName("redirect:/main");
	}
	@GetMapping("/signup")
	public void signup() {
		
	}
	@PostMapping("/registerMember")
	public String registerMember(MemberVO memberVO, RedirectAttributes rttr) {
		log.info(memberVO);
		boolean result = memberService.registerMember(memberVO);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, +7);
		Date expiry_date = cal.getTime();
		CouponVO couponVO = CouponVO.builder()
				.coupon_name("신규가입 10% 할인 쿠폰")
				.mid(memberVO.getMid())
				.sale(10)
				.expiry_date(expiry_date)
				.build();
		couponMapper.insertCoupon(couponVO);
		rttr.addFlashAttribute("registerResult", "success");
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public void login() {
	}
	
	@PostMapping("/loginPost")
	public void loginPost(LoginDTO loginDTO, Model model, RedirectAttributes rttr) {
		MemberVO memberVO = memberService.login(loginDTO);
		if(memberVO == null) {
			rttr.addFlashAttribute("loginResult", "fail");
			return;
		}
		model.addAttribute("loginInfo", memberVO);
		model.addAttribute("useCookie", loginDTO.isUseCookie());
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	@PostMapping("/checkLogin")
	@ResponseBody
	public String checkLogin(HttpSession session) {
		boolean result = 
				session.getAttribute("loginInfo") != null ? true : false;
		return String.valueOf(result);
	
	}
	
	@GetMapping("/getPoint")
	@ResponseBody
	public String getPoint(HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		
		 int count = memberService.selectPoint(memberVO.getMid());
		 session.removeAttribute("loginInfo");
		 memberVO.setMpoint(count);
		 session.setAttribute("loginInfo", memberVO);
		 return String.valueOf(count);
	}
	
	
}
