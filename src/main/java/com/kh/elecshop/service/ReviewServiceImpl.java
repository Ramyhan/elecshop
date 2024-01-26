package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.ReviewGradeDTO;
import com.kh.elecshop.domain.ReviewVO;
import com.kh.elecshop.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> getReviewList(int pno) {
		List<ReviewVO> reviewList = reviewMapper.selectReviewList(pno);
		return reviewList;
	}

	@Override
	public boolean registerReview(ReviewVO reviewVO) {
		int count = reviewMapper.insertReview(reviewVO);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean updateReview(ReviewVO reviewVO) {
		int count = reviewMapper.updateReview(reviewVO);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean deleteReview(int rno) {
		int count = reviewMapper.deleteReview(rno);
		return (count == 1) ? true : false;
	}

	@Override
	public ReviewVO getReview(int rno) {
		ReviewVO reviewVO = reviewMapper.selectReview(rno); 
		return reviewVO;
	}

	@Override
	public ReviewGradeDTO getReviewGrade(int pno) {
		ReviewGradeDTO reviewGradeDTO = reviewMapper.selectGrade(pno);
		return reviewGradeDTO;
	}
	
}
