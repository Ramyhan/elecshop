package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.CartVO;

public interface CartMapper {

	public int insertItem(CartVO cartVO);
	
	public List<CartVO> selectCartList(String mid);
	
	public int selectCount(String mid);
	
	public int deleteItem(String snos);
	
}
