package com.kh.elecshop.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.DayInfoDTO;
import com.kh.elecshop.domain.VisitCountVO;
import com.kh.elecshop.mapper.VisitCountMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class VisitCountServiceImpl implements VisitCountService {

	@Autowired
	private VisitCountMapper visitCountMapper;
	
	@Override
	public boolean isDateExist(String vdate) {
//		log.info("vdate: " + vdate);
		int isExist = visitCountMapper.isDateExist(vdate);
//		log.info("isExist: " + isExist);
		int count = 0;
		if(isExist == 0) {
			count = visitCountMapper.insertDate(vdate);
		}
		
		return (count == 0) ? true : false;
	}

	@Override
	public boolean increasedCount(String vdate) {
		int count = visitCountMapper.increasedCount(vdate);
		return (count == 0) ? true : false;
	}

	@Override
	public List<VisitCountVO> getVisitCountChart() {
		List<VisitCountVO> chartVO = visitCountMapper.selectVisitChart();
		return chartVO;
	}

	@Override
	public List<DayInfoDTO> getDayInfo(LocalDate date) {
		LocalDate newDate = date;
		List<DayInfoDTO> list = new ArrayList<>();
		
		for (int i = 0; i < 8; i++) {
//			log.info("newDate: " + newDate);
			String vdate = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//			log.info("vdate: " + vdate);
			DayInfoDTO info = visitCountMapper.selectDayInfo(vdate);
			list.add(info);
//			log.info(vdate + " : " + info);
			
			newDate = newDate.minusDays(1);
		}
		
		
		return list;
	}

}
