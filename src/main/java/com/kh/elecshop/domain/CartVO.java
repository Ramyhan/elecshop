package com.kh.elecshop.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
	
	private int cno;
	private int pno;
	private String mid;
	private int cprice;
	private String coption;
	private Date cregdate;

}
