package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.BuyDTO;
import com.kh.elecshop.domain.CartDTO;
import com.kh.elecshop.domain.CartVO;

public interface CartMapper {

	public int insertItem(CartVO cartVO);
	
	public List<CartDTO> selectCartList(String mid);
	
	public int selectCount(String mid);
	
	public int deleteItem(String snos);
	
	public List<BuyDTO> selectBuyList(String mid);
}
