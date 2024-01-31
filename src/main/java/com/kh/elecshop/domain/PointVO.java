package com.kh.elecshop.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PointVO {
	private Long pno;
	private String mid;
	private int ppoint;
	private String point_code;
	private String point_info;
	private Date regdate;
}
