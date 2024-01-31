package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.BuyDTO;
import com.kh.elecshop.domain.CartDTO;
import com.kh.elecshop.domain.CartVO;

public interface CartService {

	public boolean addCart(CartVO cartVO);
	
	public List<CartDTO> getList(String mid);
	
	public int getCount(String mid);
	
	public boolean removeItem(String cnos);
	
	public List<BuyDTO> getBuyList(String mid);
}
