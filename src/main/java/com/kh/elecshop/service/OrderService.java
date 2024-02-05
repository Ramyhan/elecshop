package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.OrderDTO;
import com.kh.elecshop.domain.OrderVO;

public interface OrderService {

	public boolean insertOrder(OrderDTO OrderDTO);
	
	public List<OrderVO> getOrderList(String mid);
}
