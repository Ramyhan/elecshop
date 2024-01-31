package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {

	private int pno;
	private int lno;
	private String pname;
	private String pcode;
	private String pinfo_main;
	private String pimage_thoumb;
	
}
