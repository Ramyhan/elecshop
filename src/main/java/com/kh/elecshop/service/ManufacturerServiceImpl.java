package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.ManufacturerVO;
import com.kh.elecshop.mapper.ManufacturerMapper;

@Service
public class ManufacturerServiceImpl implements ManufacturerService {
	
	@Autowired
	private ManufacturerMapper manufacturerMapper;

	@Override
	public List<ManufacturerVO> getManufacturerList() {
		List<ManufacturerVO> list = manufacturerMapper.selectManufacturerList();
		return list;
	}

}
