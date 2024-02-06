package com.kh.elecshop.mapper;

import java.util.Date;
import java.util.List;

import com.kh.elecshop.domain.DayInfoDTO;
import com.kh.elecshop.domain.VisitCountVO;

public interface VisitCountMapper {

	public int isDateExist(String vdate);
	public VisitCountVO selectVisitCount(Date vdate);
	public int increasedCount(String vdate);	
	public int insertDate(String vdate);
	public List<VisitCountVO> selectVisitChart();
	public DayInfoDTO selectDayInfo(String vdate);
	
}
