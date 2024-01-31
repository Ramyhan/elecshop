package com.kh.elecshop.service;

import java.util.List;
import java.util.Map;

import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;

public interface AdminService {
	public List<SubNoticeDTO> getSearchByNotice(SearchDTO searchDTO);
	public Map<String, Object> getUserList(Criteria criteria);
}
