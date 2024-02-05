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
public class AdminProductDTO {
	private int pno;
	private String pname;
	private long pprice;
	private int ptype;
	private int order_count;
	private Date pregdate;
	private String ptypeName;
	
	private List<FileVO> attrProductList;
	private FileVO fileVO;
}
