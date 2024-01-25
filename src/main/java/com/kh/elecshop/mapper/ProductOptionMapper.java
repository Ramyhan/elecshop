package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.ProductOptionVO;

public interface ProductOptionMapper {
	
	public List<ProductOptionVO> selectOption(int pno);

}
