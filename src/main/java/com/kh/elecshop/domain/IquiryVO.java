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
public class IquiryVO {

	private int ino;
	private String mid;
	private String ititle;
	private String imessage;
	private String ireply;
	private Date iregdate;
	
}
