package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> selectReviewList(int pno);

}
