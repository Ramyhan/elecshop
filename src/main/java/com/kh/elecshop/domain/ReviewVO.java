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
public class ReviewVO {

	private int rno;
	private int pno;
	private String mid;
	private String rcontent;
	private int rgrade;
	private Date rregdate;
	
}
