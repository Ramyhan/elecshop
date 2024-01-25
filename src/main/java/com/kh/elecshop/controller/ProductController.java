package com.kh.elecshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.domain.ProductOptionVO;
import com.kh.elecshop.domain.ProductVO;
import com.kh.elecshop.service.ProductService;
import com.kh.elecshop.service.ProductOptionService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductOptionService ProductOptionService;
	
	@GetMapping("/productList")
	public void productList(int ptype, Model model) {
		log.info("ptype: " + ptype);
		List<ProductDTO> list = productService.getProductList(ptype);
		log.info("list: " + list);
		model.addAttribute("productDTOList", list);
	}
		
	@GetMapping("/product")
	public void product(int pno, Model model) {
		ProductVO productVO = productService.getProduct(pno);
		List<ProductOptionVO> OptionVO = ProductOptionService.getOption(pno);
		log.info("productVO: " + productVO);
		model.addAttribute("productVO", productVO);
		model.addAttribute("optionVO", OptionVO);
	}

}
