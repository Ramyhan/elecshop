package com.kh.elecshop.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class PageDTO {
	private Criteria criteria;
	private boolean prev;
	private boolean next;
	private int startPage;
	private int endPage;
	private int total;
	
	public PageDTO(Criteria criteria, int total) {
		this.criteria = criteria;
		this.total = total;
		
		endPage = (int)(Math.ceil(criteria.getPageNum() / 10.0)) * 10;
		startPage = endPage - 9;
		
		int realEnd = (int)(Math.ceil((float)total / criteria.getAmount()));
		if (realEnd < endPage) {
			endPage = realEnd;
		}
		
		prev = startPage > 1;
		next = endPage < realEnd;
	}
}
