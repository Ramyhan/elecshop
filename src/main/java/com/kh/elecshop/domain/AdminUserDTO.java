package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminUserDTO {
	private long mno;
	private String mname;
	private String mid;
	private String memail;
	private String maddr;
	private String maddr_detail;
	private int mpoint;
	private String mphone;
}
