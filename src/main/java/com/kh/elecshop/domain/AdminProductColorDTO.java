package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminProductColorDTO {
	private int pno;
	private String oname;
	private int oprice;
	private int otype;
}
