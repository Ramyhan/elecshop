package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DayInfoDTO {
	
	private String vdate;
	private int order_count;
	private int vcount;
	private int total_price;
	private int join_count;

}
