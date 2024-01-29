package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.PointVO;

public interface PointService {

	public List<PointVO> getPointInfo(String mid);
}
