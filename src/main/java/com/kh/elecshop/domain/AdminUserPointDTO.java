package com.kh.elecshop.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminUserPointDTO {
	@JsonFormat(pattern = "yy-MM-dd")
	private Date regdate;
	private int ppoint;
	private String point_info;
}
