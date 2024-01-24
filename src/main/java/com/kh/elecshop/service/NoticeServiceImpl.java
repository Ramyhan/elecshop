package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	public List<NoticeVO> selectNotice() {
		List<NoticeVO> list = mapper.selectAll();
		return list;
	}
	
	
}
