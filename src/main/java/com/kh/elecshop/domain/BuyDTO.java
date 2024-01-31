package com.kh.elecshop.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BuyDTO {
	
	private int cno;
	private String mid;
	private int cprice;
	private String coption;
	private int pno;
	private String pname;
	private String pimage_thoumb;
	
//	private List<BuyDTO> list;
}
