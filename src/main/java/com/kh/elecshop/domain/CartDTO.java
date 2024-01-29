package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {

	private int cno;
	private String mid;
	private int cprice;
	private String coption;
	private String pname;
	private String pimage_thoumb;
	
}
