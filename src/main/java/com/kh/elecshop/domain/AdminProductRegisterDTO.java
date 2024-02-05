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
public class AdminProductRegisterDTO {
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
	private Date pregdate;
	private int order_count;
	private int pstate;
	
	
	private List<AdminProductColorDTO> colorList;
	private List<AdminProductRamDTO> ramList;
	private List<AdminProductSSdDTO> ssdList;
	private List<FileVO> attrProductList;
}
