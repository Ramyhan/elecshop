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
	private int ono;
	private int odproduct_count;
	private String odoption;
}
