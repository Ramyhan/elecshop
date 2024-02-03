package com.kh.elecshop.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDTO {

	private int ono;
	private int coupon_no;
	private int point;
	private String mid;
	private String oname;
	private String ophone;
	private int oprice;
	private String oaddr;
	private String oaddr_detail;
	private String opost_code;
	private int odelivery;
	private Date regDate;
	
	private List<OrderDetailVO> list;
	
}
