package com.kh.elecshop.service;

import java.util.List;
import java.util.Set;

import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.domain.ProductVO;

public interface ProductService {

	public List<ProductDTO> getProductList(int ptype);
	
	public ProductVO getProduct(int pno);
	
	public List<ProductDTO> searchKeyword(int ptype, String keyword, String manuval, String optionval);
	
}
