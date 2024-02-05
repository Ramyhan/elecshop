package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KakaoVO {

	private String tid;
	private String next_redirect_pc_url;
	private String created_at;
}
