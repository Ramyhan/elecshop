package com.kh.elecshop.domain;

import java.util.Date;

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
	private long pprince;
	private int ptype;
	private String pimage_thoumb;
	private int order_count;
	private Date pregdate;
}
