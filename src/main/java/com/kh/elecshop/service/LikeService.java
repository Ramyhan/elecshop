package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.LikeVO;

public interface LikeService {

	public boolean addLike(LikeVO likeVO);
	
	public boolean removeByPno(LikeVO likeVO);
	
	public boolean removeByLno(int lno);
	
	public boolean isExist(LikeVO likeVO);
	
	public List<LikeVO> getLikeList(String mid);
	
}