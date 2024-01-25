package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	public List<SubNoticeDTO> getSubNotice() {
		List<SubNoticeDTO> list = mapper.subselectAll();
		return list;
	}
	public NoticeVO  getNoticePage(int nno) {
		NoticeVO noticeVO = mapper.selectByNno(nno);
		return noticeVO;
	}
	
	
}
