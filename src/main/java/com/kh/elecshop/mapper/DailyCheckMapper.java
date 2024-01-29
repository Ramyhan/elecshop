package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.DailyCheckVO;

public interface DailyCheckMapper {

	public int insertDailyCheck(String mid);
	
	public List<DailyCheckVO> selectDailyCheck(String mid);
	public DailyCheckVO checkDaily(String mid);
}
