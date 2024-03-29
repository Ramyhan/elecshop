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
	private Long mno;
	private String mname;
	private String mid;
	private String mpw;
	private String memail;
	private String maddr;
	private String maddr_detail;
	private String mpost_code;
	private String mphone;
	private Date mregdate;
	private java.sql.Date mbirthday;
	private int mpoint;
	private int mstate;
}


