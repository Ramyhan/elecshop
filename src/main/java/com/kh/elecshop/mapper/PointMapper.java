package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.PointVO;

public interface PointMapper {

	public int insertPoint(PointVO pointVO);
	public List<PointVO> getPointInfo(String mid);
}
