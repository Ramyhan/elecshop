package com.kh.elecshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.elecshop.domain.LikeVO;
import com.kh.elecshop.service.LikeService;

@Controller
@RequestMapping("/like")
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	@PostMapping("/add")
	@ResponseBody
	private String addLike(LikeVO likeVO) {
		boolean result = likeService.addLike(likeVO);
		return String.valueOf(result);
	}
	
	@PostMapping("/removeByPno")
	@ResponseBody
	private String removeByPno(LikeVO likeVO) {
		boolean result = likeService.removeByPno(likeVO);
		return String.valueOf(result);
	}
	
	@PostMapping("/removeLno")
	@ResponseBody
	private String removeByLno(int lno) {
		boolean result = likeService.removeByLno(lno);
		return String.valueOf(result);
	}
	
}
