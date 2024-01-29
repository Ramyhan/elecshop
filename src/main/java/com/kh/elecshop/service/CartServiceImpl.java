package com.kh.elecshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.CartVO;
import com.kh.elecshop.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;

	@Override
	public boolean addCart(CartVO cartVO) {
		int count = cartMapper.insertCart(cartVO);
		return (count == 1) ? true : false;
	}

}
