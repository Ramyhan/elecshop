package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.OrderVO;

public interface OrderMapper {

	public int insertOrder(OrderVO orderVO);
	
	public int getOno(String mid);
	
	public List<OrderVO> getOrderList(String mid);
}
