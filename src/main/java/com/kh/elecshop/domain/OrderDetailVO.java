package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailVO {

	private int odno;
	private int pno;
	private String pname;
	private String pimage_thoumb;
	private int ono;
	private int odproduct_count;
	private String odoption;
	private int cart_no;
}
