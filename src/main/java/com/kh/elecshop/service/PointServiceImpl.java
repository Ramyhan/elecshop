package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.PointVO;
import com.kh.elecshop.mapper.PointMapper;

@Service
public class PointServiceImpl implements PointService {

	@Autowired
	private PointMapper pointMapper;
	
	
	@Override
	public List<PointVO> getPointInfo(String mid) {
		List<PointVO> list = pointMapper.getPointInfo(mid);
		return list;
	}
	
	

}
