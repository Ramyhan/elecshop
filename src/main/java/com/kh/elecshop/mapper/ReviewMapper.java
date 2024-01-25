package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> selectReviewList(int pno);
	
	public int insertReview(ReviewVO reviewVO);
	
	public int updateReview(int rno);
	
	public int deleteReview(int rno);
	
	public ReviewVO selectReview(int rno);

}
