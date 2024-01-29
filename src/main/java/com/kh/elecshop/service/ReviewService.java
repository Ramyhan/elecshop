package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.ReviewGradeDTO;
import com.kh.elecshop.domain.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> getReviewList(int pno);
	
	public boolean registerReview(ReviewVO reviewVO);
	
	public boolean updateReview(ReviewVO reviewVO);
	
	public boolean deleteReview(int rno);
	
	public ReviewVO getReview(int rno);
	
	public ReviewGradeDTO getReviewGrade(int pno);

}
