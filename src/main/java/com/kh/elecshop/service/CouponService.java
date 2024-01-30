package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.CouponVO;

public interface CouponService {

	public boolean insertCoupon(CouponVO couponVO);
	public List<CouponVO> selectCoupon(String mid);
}
