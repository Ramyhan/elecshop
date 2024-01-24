package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.domain.ProductVO;

public interface ProductMapper {
	
	public List<ProductDTO> selectProductList(int ptype);
	
	public ProductVO selectProduct(int pno);
}
