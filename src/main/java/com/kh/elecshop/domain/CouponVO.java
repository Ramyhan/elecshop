package com.kh.elecshop.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CouponVO {
	private int cno;
	private String mid;
	private String coupon_name;
	private int use;
	private int sale;
	private Date regdate;
	private Date expiry_date;
	
}
