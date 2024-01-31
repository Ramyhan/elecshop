package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.LikeVO;
import com.kh.elecshop.domain.ProductDTO;

public interface LikeService {

	public boolean addLike(LikeVO likeVO);
	
	public boolean removeByPno(LikeVO likeVO);
	
	public boolean removeByLno(int lno);
	
	public boolean isExist(LikeVO likeVO);
	
	public List<ProductDTO> getLikeList(String mid);
	
}