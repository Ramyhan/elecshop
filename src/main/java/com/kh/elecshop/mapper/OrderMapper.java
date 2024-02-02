package com.kh.elecshop.mapper;

import com.kh.elecshop.domain.OrderVO;

public interface OrderMapper {

	public int insertOrder(OrderVO orderVO);
	
	public int getCno(String mid);
}
