package com.kh.elecshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.AdminNoticeDTO;
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
	public Map<String, Object>  getNoticePage(int nno) {
		NoticeVO noticeVO = mapper.selectByNno(nno);
		Map<String, Object> map = new HashMap<String, Object>();
		if(noticeVO.getNfileName()!= null) {
		String[] filenames = noticeVO.getNfileName().split(",");
		String[] urls = noticeVO.getNurl().split(",");
		map.put("filenames", filenames);
		map.put("urls", urls);
		}
		map.put("noticeVO", noticeVO);
		return map;
	}
	@Override
	public List<SubNoticeDTO> getNoticeTop5() {
		List<SubNoticeDTO> list = mapper.selectByTop5();
		return list;
	}
	@Override
	public List<AdminNoticeDTO> getAdminNotice() {
		List<AdminNoticeDTO> list = mapper.selectAdminNotice();
		return list;
	}
	@Override
	public boolean modifyNoticeCloseState(int[] nnos) {
		int count = mapper.updateCloseNoticeState(nnos);
		if(count > 0) {
			return true;
		}
		
		return false;
	}
	@Override
	public boolean modifyNoticeOpenState(int[] nnos) {
		int count = mapper.updateOpenNoticeState(nnos);
		if(count > 0) {
			return true;
		}
		return false;
	}
	@Override
	public int removeNotice(int[] nnos) {
		int count = mapper.deleteNotice(nnos);
		return count;
	}
	@Override
	public boolean registerNotice(NoticeVO noticeVO) {
		int count = mapper.insertNotice(noticeVO);
		if(count == 1) {
			return true;
		}
		return false;
	}
	
	
}
