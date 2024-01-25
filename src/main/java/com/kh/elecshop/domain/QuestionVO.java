package com.kh.elecshop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuestionVO {
	private Integer qno;
	private String qtitle;
	private String qcontent;
	private String qcategory;
	private String qsubcategory;
	private String qimage;
}
