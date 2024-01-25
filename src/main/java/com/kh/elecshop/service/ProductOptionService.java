package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.ProductOptionVO;

public interface ProductOptionService {
	
	public List<ProductOptionVO> getOption(int pno);

}
