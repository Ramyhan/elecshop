package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.OrderDetailVO;

public interface OrderDetailMapper {

	public int insertOrderDetail(OrderDetailVO orderDetailVO);
	
	public List<OrderDetailVO> selectMyOrder(int ono);
}
