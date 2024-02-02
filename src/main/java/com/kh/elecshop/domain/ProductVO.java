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
public class ProductVO {
	private int pno;
	private String pname;
	private int mno;
	private int pprice;
	private String pcode;
	private int ptype;
	private int pdno;
	private String pinfo_main;
	private String pinfo1;
	private String pinfo2;
	private String pinfo3;
	private String pimage_thoumb;
	private String pimage_info1;
	private String pimage_info2;
	private Date pregdate;
}
