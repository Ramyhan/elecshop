package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.SubNoticeDTO;

public interface NoticeService {
	public List<SubNoticeDTO> getSubNotice();
	public NoticeVO getNoticePage(int nno);
	public List<SubNoticeDTO> getNoticeTop5();
}
