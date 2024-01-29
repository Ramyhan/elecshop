package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.DailyCheckVO;

public interface DailyCheckService {

	public boolean insertDailyCheck(String mid);

	public List<DailyCheckVO> selectDailyCheck(String mid);
	public DailyCheckVO checkDaily(String mid);
}
