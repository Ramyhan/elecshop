package com.kh.elecshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.elecshop.domain.CartVO;
import com.kh.elecshop.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@PostMapping("/addCart")
	@ResponseBody
	private String addCart(CartVO cartVO) {
		log.info("cartVO: " + cartVO);
		boolean result = cartService.addCart(cartVO);
		return String.valueOf(result);
	}
	
	@GetMapping("/cart")
	private void cartList() {
		
	}
	
}
