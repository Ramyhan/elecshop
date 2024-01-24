package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.domain.ProductVO;

public interface ProductService {

	public List<ProductDTO> getProductList(int ptype);
	
	public ProductVO getProduct(int pno);
	
}
