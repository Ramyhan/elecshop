package com.kh.elecshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.mapper.AdminMapper;
import com.kh.elecshop.mapper.NoticeMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public List<SubNoticeDTO> getSearchByNotice(SearchDTO searchDTO) {
		List<SubNoticeDTO> list = noticeMapper.selectSearchWord(searchDTO);
		return list;
	}

	@Override
	public Map<String, Object> getUserList(Criteria criteria) {
		List<AdminUserDTO> list = adminMapper.selectUser(criteria);
		log.info("++" + list);
		int count = adminMapper.selectUserTotal();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userList", list);
		map.put("total", count);
		return map;
	}

}
