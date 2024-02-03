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
import com.kh.elecshop.mapper.CartMapper;
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
	
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	@Transactional
	public boolean insertOrder(OrderDTO orderDTO) {
		String mid = orderDTO.getMid();
		int point = orderDTO.getPoint();
//		쿠폰 사용
		int count1 = 0;
		int count2 = 0;
		int coupon_no = orderDTO.getCoupon_no();
		if(coupon_no != 0) {
			CouponVO couponVO = couponMapper.selectCouponInfo(coupon_no);
			couponVO.setUse(1);
			count1 = couponMapper.updateCoupon(couponVO);
		}
		
//		포인트 사용
		if(point != 0) {
		PointVO pointVO = PointVO.builder()
					.mid(mid)
					.ppoint(-point)
					.point_code("PU")
					.build();
		count2 = pointMapper.insertPoint(pointVO);
		
//		유저 포인트 업데이트
		Map<String, Object> map = new HashMap<>();
		map.put("mid", mid);
		map.put("ppoint", -point);
		memberMapper.updatePoint(map);
		}
		
//		구매내역 입력
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
			ono = orderMapper.getOno(mid);
			log.info("ono : " + ono);
		}
//		구매 상세 내역 입력, 장바구니 삭제, 재고 감소
		List<OrderDetailVO> list = orderDTO.getList();
		for(OrderDetailVO vo : list) {
			log.info(vo);
			// 구매 상세 내역
			vo.setOno(ono);
			orderDetailMapper.insertOrderDetail(vo);
			// 장바구니 삭제
			int cno = vo.getCart_no();
			cartMapper.deleteByCno(cno);
			
			// 재고 감소
			int pno = vo.getPno();
			int order_count = vo.getOdproduct_count();
			
			productMapper.updateOrderCount(order_count, pno);
		}
		
		return (count1 + count2 + count3 == 3) ? true:false;
	}

	@Override
	public List<OrderVO> getOrderList(String mid) {
		List<OrderVO> list = orderMapper.getOrderList(mid);
		
		return list;
	}

}
