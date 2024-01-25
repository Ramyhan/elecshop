package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.ProductOptionVO;
import com.kh.elecshop.mapper.ProductOptionMapper;

@Service
public class ProductOptionServiceImpl implements ProductOptionService {
	
	@Autowired
	private ProductOptionMapper productOptionMapper;

	@Override
	public List<ProductOptionVO> getOption(int pno) {
		List<ProductOptionVO> list = productOptionMapper.selectOption(pno);
		return list;
	}

}
