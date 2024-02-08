package com.kh.elecshop.service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

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

	@SuppressWarnings("unused")
	@Override
	public List<ProductDTO> searchKeyword(int ptype, String keyword, String manuval, String optionval) {
		List<ProductDTO> keyWordList = new ArrayList<>();
		List<ProductDTO> manuvalList = new ArrayList<>();
		List<ProductDTO> optionvalList = new ArrayList<>();
		
		keyWordList = productMapper.selectByKeyword(ptype, keyword);
		log.info("keyWordList: " + keyWordList);
		
		if(manuval != null && !manuval.equals("")) {
			manuvalList = productMapper.selectByManu(ptype, manuval);
			keyWordList.retainAll(manuvalList);
			log.info("manuvalList: " + manuvalList);
		}
		
		if(optionval != null && !optionval.equals("")) {
			if(ptype == 1 || ptype == 3) {
				String[] options = optionval.split(",");
				optionvalList = productMapper.selectByOption(ptype, options);
				keyWordList.retainAll(optionvalList);
				log.info("optionvalList: " + optionvalList);
			} else if(ptype == 4 || ptype == 5) {
				optionvalList = productMapper.selectByPdno(ptype, optionval);
				keyWordList.retainAll(optionvalList);
			}
		}
		
		return keyWordList;
	}

	@Override
	public List<ProductDTO> getTop8() {
		List<ProductDTO> list = productMapper.selectTop8();
		return list;
	}
	
}
