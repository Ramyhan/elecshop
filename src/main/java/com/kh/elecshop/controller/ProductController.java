package com.kh.elecshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.domain.ProductOptionVO;
import com.kh.elecshop.domain.ProductVO;
import com.kh.elecshop.domain.ReviewGradeDTO;
import com.kh.elecshop.domain.ReviewVO;
import com.kh.elecshop.service.ProductService;
import com.kh.elecshop.service.ReviewService;
import com.kh.elecshop.service.ProductOptionService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductOptionService ProductOptionService;
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/productList")
	public void productList(int ptype, Model model) {
		log.info("ptype: " + ptype);
		List<ProductDTO> list = productService.getProductList(ptype);
		log.info("list: " + list);
		model.addAttribute("productDTOList", list);
		// test
	}
		
	@GetMapping("/product")
	public void product(int pno, Model model, HttpSession session) {
		MemberVO memverVO = (MemberVO)session.getAttribute("loginInfo");
		ProductVO productVO = productService.getProduct(pno);
		List<ProductOptionVO> optionList = ProductOptionService.getOption(pno);
		List<ReviewVO> reviewList = reviewService.getReviewList(pno);
		ReviewGradeDTO reviewGradeDTO = reviewService.getReviewGrade(pno);
		double average = reviewGradeDTO.getAverage();
		int persent = (int)(average / 5 * 100);
		
		reviewGradeDTO.setPersent(persent);
		model.addAttribute("productVO", productVO);
		model.addAttribute("optionList", optionList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("gradeDTO", reviewGradeDTO);
		model.addAttribute("loginInfo", memverVO);
	}

}
