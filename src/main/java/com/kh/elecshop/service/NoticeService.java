package com.kh.elecshop.service;

import java.util.List;
import java.util.Map;

import com.kh.elecshop.domain.AdminNoticeDTO;
import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.SubNoticeDTO;

public interface NoticeService {
	public List<SubNoticeDTO> getSubNotice();
	public Map<String, Object> getNoticePage(int nno);
	public List<SubNoticeDTO> getNoticeTop5();
	public List<AdminNoticeDTO> getAdminNotice();
	public boolean modifyNoticeCloseState(int[] nnos);
	public boolean modifyNoticeOpenState(int[] nnos);
	public int removeNotice(int[] nnos);
	public boolean registerNotice(NoticeVO noticeVO);
	public List<NoticeVO> getLatestNotice();
}
