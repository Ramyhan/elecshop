package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.ReviewVO;
import com.kh.elecshop.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> getReviewList(int pno) {
		List<ReviewVO> reviewList = reviewMapper.selectReviewList(pno);
		return reviewList;
	}
	
}
