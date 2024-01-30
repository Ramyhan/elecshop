package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.LikeVO;

public interface LikeMapper {
	
	public int insertLike(LikeVO likeVO);
	
	public int deleteByPno(LikeVO likeVO);
	
	public int deleteByLno(int lno);
	
	public int selectItem(LikeVO likeVO);
	
	public List<LikeVO> selectLike(String mid);
	
}
