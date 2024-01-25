package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.QuestionVO;
import com.kh.elecshop.domain.SubNoticeDTO;

public interface NoticeMapper {
	
	public List<SubNoticeDTO> subselectAll();
	public NoticeVO selectByNno(int nno);
}

