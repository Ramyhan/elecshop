package com.kh.elecshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.elecshop.domain.ReviewVO;
import com.kh.elecshop.service.ReviewService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/review")
@Log4j
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping(value = "/register",
			consumes = MediaType.APPLICATION_JSON_VALUE)
	public String registerReview(@RequestBody ReviewVO reviewVO) {
		log.info("reviewVO" + reviewVO);
		boolean result = reviewService.registerReview(reviewVO);
		return String.valueOf(result);
	}
	
	@PutMapping(value = "/update",
			consumes = MediaType.APPLICATION_JSON_VALUE)
	public String updateReview(@RequestBody ReviewVO reviewVO) {
		log.info("reviewVO: " + reviewVO);
		boolean result = reviewService.updateReview(reviewVO);
		return String.valueOf(result);
	}
	
	@DeleteMapping("/{rno}")
	public String deleteReview(@PathVariable("rno") int rno) {
		boolean result = reviewService.deleteReview(rno);
		return String.valueOf(result);
	}
	
	@GetMapping(value = "/{rno}",
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ReviewVO getReview(@PathVariable("rno") int rno) {
		ReviewVO reviewVO = reviewService.getReview(rno);
		return reviewVO;
	}

}
