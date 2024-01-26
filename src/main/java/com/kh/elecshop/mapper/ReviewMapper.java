package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.ReviewGradeDTO;
import com.kh.elecshop.domain.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> selectReviewList(int pno);
	
	public int insertReview(ReviewVO reviewVO);
	
	public int updateReview(ReviewVO reviewVO);
	
	public int deleteReview(int rno);
	
	public ReviewVO selectReview(int rno);
	
	public ReviewGradeDTO selectGrade(int pno);

}
