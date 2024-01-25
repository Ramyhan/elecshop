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
public class SubNoticeDTO {
	private int nno;
	private String ncategory;
	private String ntitle;
	private Date nregdate;
	
}
