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
public class MemberVO {
	private String mname;
	private String mid;
	private String mpw;
	private String memail;
	private String maddr;
	private String maddr_detail;
	private Integer mphone;
	private Date mregdate;
}


