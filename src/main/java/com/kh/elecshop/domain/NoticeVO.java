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
public class NoticeVO {
	private int nno;
	private String ncategory;
	private String ntitle;
	private String ncontent;
	private Date nregdate;
	private String nstate;
	private String url;
	private int count;
}
