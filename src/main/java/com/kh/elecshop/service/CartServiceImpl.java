package com.kh.elecshop.service;

import java.util.List;

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
		int count = cartMapper.insertItem(cartVO);
		return (count == 1) ? true : false;
	}

	@Override
	public List<CartVO> getList(String mid) {
		List<CartVO> list = cartMapper.selectCartList(mid);
		return list;
	}

	@Override
	public int getCount(String mid) {
		int count = cartMapper.selectCount(mid);
		return count;
	}

	@Override
	public boolean removeItem(String cnos) {
		int count = cartMapper.deleteItem(cnos);
		return (count > 0) ? true : false;
	}

}
