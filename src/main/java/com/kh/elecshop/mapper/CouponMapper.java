package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.CouponVO;

public interface CouponMapper {
	
	public int insertCoupon(CouponVO couponVO);
	public List<CouponVO> selectUserCoupon(String mid);
	public int updateCoupon(CouponVO couponVO);
	public CouponVO selectCouponInfo(int cno);
}
