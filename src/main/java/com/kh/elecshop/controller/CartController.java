package com.kh.elecshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.elecshop.domain.CartVO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@PostMapping(value = "/addCart")
	@ResponseBody
	private String addCart(CartVO cartVO) {
		log.info("cartVO: " + cartVO);
		boolean result = cartService.addCart(cartVO);
		return String.valueOf(result);
	}
	
	@GetMapping("/cart")
	private void cartList(HttpSession session, Model model) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		String mid = loginInfo.getMid();
		List<CartVO> cartList = cartService.getList(mid);
		int count = cartService.getCount(mid);
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("count", count);
	}
	
	@PostMapping("/removeItems")
	@ResponseBody
	private String removeItems(String cnos) {
		boolean result = cartService.removeItem(cnos);
		log.info("removeResult: " + result);
		return String.valueOf(result);
	}
	
}
