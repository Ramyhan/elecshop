package com.kh.elecshop.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.CouponVO;
import com.kh.elecshop.mapper.CouponMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CouponServiceImpl implements CouponService{

	@Autowired
	private CouponMapper couponMapper;
	
	@Override
	public boolean insertCoupon(CouponVO couponVO) {
		int count = couponMapper.insertCoupon(couponVO);
		
		return (count == 1) ? true:false;
	}
	
	@Override
	public List<CouponVO> selectCoupon(String mid) {
		List<CouponVO> list = couponMapper.selectCoupon(mid);
		List<CouponVO> list2 = new ArrayList<>();
		Date date = new Date(System.currentTimeMillis());
		
//		유효기간 검사
		for(CouponVO vo : list) {
			Date expiry = vo.getExpiry_date();
			int count = date.compareTo(expiry);
			if(count < 0) {
				list2.add(vo);
			}
		}
		log.info(list2);
		return list2;
	}

}
