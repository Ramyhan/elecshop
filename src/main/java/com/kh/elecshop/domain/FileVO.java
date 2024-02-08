package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FileVO {
	private int ano;
	private int pno;
	private String afileName;
	private String apath;
	private String auuid;
	private String aurl;
	private String athoumbnail;
}
