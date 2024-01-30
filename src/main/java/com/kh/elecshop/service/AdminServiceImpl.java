package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.mapper.NoticeMapper;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public List<SubNoticeDTO> getSearchByNotice(SearchDTO searchDTO) {
		List<SubNoticeDTO> list = noticeMapper.selectSearchWord(searchDTO);
		return list;
	}

}
