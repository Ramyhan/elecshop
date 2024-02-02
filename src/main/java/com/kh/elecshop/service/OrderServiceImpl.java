package com.kh.elecshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.elecshop.domain.CouponVO;
import com.kh.elecshop.domain.OrderDTO;
import com.kh.elecshop.domain.OrderDetailVO;
import com.kh.elecshop.domain.OrderVO;
import com.kh.elecshop.domain.PointVO;
import com.kh.elecshop.domain.ProductVO;
import com.kh.elecshop.mapper.CouponMapper;
import com.kh.elecshop.mapper.MemberMapper;
import com.kh.elecshop.mapper.OrderDetailMapper;
import com.kh.elecshop.mapper.OrderMapper;
import com.kh.elecshop.mapper.PointMapper;
import com.kh.elecshop.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	
	@Autowired
	private CouponMapper couponMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PointMapper pointMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	@Transactional
	public boolean insertOrder(OrderDTO orderDTO) {
		String mid = orderDTO.getMid();
		int point = orderDTO.getPoint();
//		쿠폰 사용
		int count1 = 0;
		int cno = orderDTO.getCno();
		if(cno != 0) {
			CouponVO couponVO = couponMapper.selectCouponInfo(cno);
			couponVO.setUse(1);
			count1 = couponMapper.updateCoupon(couponVO);
		}
//		포인트 사용
		PointVO pointVO = PointVO.builder()
					.mid(mid)
					.ppoint(-point)
					.point_code("PU")
					.build();
		int count2 = pointMapper.insertPoint(pointVO);
		
//		유저 포인트 업데이트
		Map<String, Object> map = new HashMap<>();
		map.put("mid", mid);
		map.put("ppoint", -point);
		memberMapper.updatePoint(map);
//		구매내역
		OrderVO orderVO = OrderVO.builder()
				.mid(mid)
				.oname(orderDTO.getOname())
				.ophone(orderDTO.getOphone())
				.oprice(orderDTO.getOprice())
				.oaddr(orderDTO.getOaddr())
				.oaddr_detail(orderDTO.getOaddr_detail())
				.opost_code(orderDTO.getOpost_code())
				.odelivery(orderDTO.getOdelivery())
				.build();
		int count3 = orderMapper.insertOrder(orderVO);
		int ono = 0;
		if(count3 == 1) {
			ono = orderMapper.getCno(mid);
			log.info("ono : " + ono);
		}
//		구매 상세 내역, 재고 감소
		List<OrderDetailVO> list = orderDTO.getList();
		for(OrderDetailVO vo : list) {
			log.info(vo);
			vo.setOno(ono);
			orderDetailMapper.insertOrderDetail(vo);
			int pno = vo.getPno();
			int order_count = vo.getOdproduct_count();
			
			productMapper.updateOrderCount(order_count, pno);
		}
		
		return (count1 + count2 + count3 == 3) ? true:false;
	}

}
