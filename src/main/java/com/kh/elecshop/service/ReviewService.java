package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> getReviewList(int pno);
	
	public boolean registerReview(ReviewVO reviewVO);
	
	public boolean updateReview(int rno);
	
	public boolean deleteReview(int rno);
	
	public ReviewVO getReview(int rno);

}
