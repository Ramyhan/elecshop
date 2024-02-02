package com.kh.elecshop.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.elecshop.domain.LikeVO;
import com.kh.elecshop.domain.ManufacturerVO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.domain.ProductOptionVO;
import com.kh.elecshop.domain.ProductVO;
import com.kh.elecshop.domain.ReviewGradeDTO;
import com.kh.elecshop.domain.ReviewVO;
import com.kh.elecshop.service.ProductService;
import com.kh.elecshop.service.ReviewService;
import com.kh.elecshop.service.LikeService;
import com.kh.elecshop.service.ManufacturerService;
import com.kh.elecshop.service.ProductOptionService;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/product")
@Log4j
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductOptionService ProductOptionService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private ManufacturerService manufacturerService;
	
	@GetMapping("/list")
	public void productList(int ptype, Model model) {
//		log.info("ptype: " + ptype);
		List<ProductDTO> list = productService.getProductList(ptype);
//		log.info("list: " + list);
		List<ManufacturerVO> manufacturerList = manufacturerService.getManufacturerList();
		model.addAttribute("productDTOList", list);
		model.addAttribute("manufacturerList", manufacturerList);
		model.addAttribute("ptype", ptype);
		// test
	}
		
	@GetMapping("/goods")
	public void product(int pno, Model model, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		ProductVO productVO = productService.getProduct(pno);
		List<ProductOptionVO> optionList = ProductOptionService.getOption(pno);
		List<ReviewVO> reviewList = reviewService.getReviewList(pno);
		ReviewGradeDTO reviewGradeDTO = reviewService.getReviewGrade(pno);
		double average = reviewGradeDTO.getAverage();
		int persent = (int)(average / 5 * 100);
		
		LikeVO likeVO = new LikeVO();
		boolean isLike = false;
		if(memberVO != null) {
			likeVO = LikeVO.builder()
					.mid(memberVO.getMid())
					.pno(pno)
					.build();
			isLike = likeService.isExist(likeVO);
		}
		
		reviewGradeDTO.setPersent(persent);
		model.addAttribute("productVO", productVO);
		model.addAttribute("optionList", optionList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("gradeDTO", reviewGradeDTO);
		model.addAttribute("loginInfo", memberVO);
		model.addAttribute("isLike", isLike);
	}
	
	@PostMapping(value = "/searchKeyword",
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private List<ProductDTO> searchKeyword(int ptype, String keyword, String manuval, String optionval) {
		log.info("optionval: " + optionval);
		List<ProductDTO> list = productService.searchKeyword(ptype, keyword, manuval, optionval);
		return list;
	}

}
