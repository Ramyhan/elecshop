package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.BuyDTO;
import com.kh.elecshop.domain.CartDTO;
import com.kh.elecshop.domain.CartVO;
import com.kh.elecshop.mapper.CartMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;

	@Override
	public boolean addCart(CartVO cartVO) {
		int count = cartMapper.insertItem(cartVO);
		return (count == 1) ? true : false;
	}

	@Override
	public List<CartDTO> getList(String mid) {
		List<CartDTO> list = cartMapper.selectCartList(mid);
		log.info("list: " + list);
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

	@Override
	public List<BuyDTO> getBuyList(String mid) {
		List<BuyDTO> list = cartMapper.selectBuyList(mid);
		return list;
	}

}
