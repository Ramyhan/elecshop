package com.kh.elecshop.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class FileVO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
	private String url;
}
