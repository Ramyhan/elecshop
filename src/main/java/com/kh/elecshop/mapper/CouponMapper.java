package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.CouponVO;

public interface CouponMapper {
	
	public int insertCoupon(CouponVO couponVO);
	public List<CouponVO> selectCoupon(String mid);
}
