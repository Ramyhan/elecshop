package com.kh.elecshop.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderVO {

	private int ono;
	private String mid;
	private String oname;
	private String ophone;
	private int oprice;
	private String oaddr;
	private String oaddr_detail;
	private String opost_code;
	private int odelivery;
	private int delivery_status;
	private Date regdate;

	
	private List<OrderDetailVO> list;
	
}
