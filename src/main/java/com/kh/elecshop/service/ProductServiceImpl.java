package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.domain.ProductVO;
import com.kh.elecshop.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<ProductDTO> getProductList(int ptype) {
		List<ProductDTO> list = productMapper.selectProductList(ptype);
		return list;
	}

	@Override
	public ProductVO getProduct(int pno) {
		ProductVO productVO = productMapper.selectProduct(pno);
		return productVO;
	}
	
}
