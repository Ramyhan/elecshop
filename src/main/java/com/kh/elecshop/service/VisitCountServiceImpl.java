package com.kh.elecshop.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.mapper.VisitCountMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class VisitCountServiceImpl implements VisitCountService {

	@Autowired
	private VisitCountMapper visitCountMapper;
	
	@Override
	public boolean isDateExist(String vdate) {
		log.info("vdate: " + vdate);
		int isExist = visitCountMapper.isDateExist(vdate);
		log.info("isExist: " + isExist);
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

}
