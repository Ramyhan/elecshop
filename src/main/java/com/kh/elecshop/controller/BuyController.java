package com.kh.elecshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.elecshop.domain.CouponVO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.service.CouponService;

@Controller
public class BuyController {

	@Autowired
	private CouponService couponService;
	
	
	@GetMapping("/buy")
	public void buy(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		List<CouponVO> list = couponService.selectCoupon(memberVO.getMid());
		model.addAttribute("myCoupon", list);
	}
}
