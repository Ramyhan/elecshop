package com.kh.elecshop.mapper;

import java.util.List;


import com.kh.elecshop.domain.AdminNoticeDTO;
import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;

public interface NoticeMapper {
	
	public List<SubNoticeDTO> subselectAll();
	public NoticeVO selectByNno(int nno);
	public List<SubNoticeDTO> selectByTop5();
	public List<AdminNoticeDTO> selectAdminNotice();
	public int updateCloseNoticeState(int[] nnos);
	public int updateOpenNoticeState(int[] nnos);
	public int deleteNotice(int[] nnos);
	public int insertNotice(NoticeVO noticeVO);
	public List<SubNoticeDTO> selectSearchWord(SearchDTO searchDTO);
	public int selectSearchTotal(SearchDTO searchDTO);
	public List<NoticeVO> selectLatestNotice();
}

