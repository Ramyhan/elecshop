package com.kh.elecshop.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import com.kh.elecshop.domain.DayInfoDTO;
import com.kh.elecshop.domain.VisitCountVO;

public interface VisitCountService {
	
	public boolean isDateExist(String vdate);
	
	public boolean increasedCount(String vdate);
	
	public List<VisitCountVO> getVisitCountChart();
	
	public List<DayInfoDTO> getDayInfo(LocalDate vdate);

}
