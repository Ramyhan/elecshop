package com.kh.elecshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.elecshop.domain.BuyDTO;
import com.kh.elecshop.domain.CartVO;
import com.kh.elecshop.domain.CouponVO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.OrderDTO;
import com.kh.elecshop.domain.OrderVO;
import com.kh.elecshop.mapper.OrderMapper;
import com.kh.elecshop.service.CartService;
import com.kh.elecshop.service.CouponService;
import com.kh.elecshop.service.OrderService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BuyController {

	@Autowired
	private CouponService couponService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/buy")
	public void buy(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		List<CouponVO> couponList = couponService.selectUserCoupon(memberVO.getMid());
		List<BuyDTO> cartList = cartService.getBuyList(memberVO.getMid());
		
		model.addAttribute("myCoupon", couponList);
		model.addAttribute("cartList", cartList);
	}
	
	@PostMapping("/checkout")
	@ResponseBody
	public String checkout(CartVO cartVO) {
		boolean result = cartService.addCart(cartVO);
		
		return String.valueOf(result);
	}
	
	@PostMapping("/order")
	public String order(OrderDTO OrderDTO) {
		log.info(OrderDTO);
		orderService.insertOrder(OrderDTO);
		return "redirect:/main";
	}
}
