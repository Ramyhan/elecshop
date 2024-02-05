package com.kh.elecshop.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VisitCountVO {
	
	private Date vdate;
	private int vcount;
	
}
