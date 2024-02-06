package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminProductOptionDTO {
	private int ono;
	private int pno;
	private String oname;
	private int oprice;
	private int otype;
}
