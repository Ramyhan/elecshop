package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewGradeDTO {
	
	private Long count;
	private double average;
	private int persent;

}
