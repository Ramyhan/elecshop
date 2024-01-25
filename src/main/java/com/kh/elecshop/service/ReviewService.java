package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> getReviewList(int pno);

}
