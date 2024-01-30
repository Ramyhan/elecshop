package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;

public interface AdminService {
	public List<SubNoticeDTO> getSearchByNotice(SearchDTO searchDTO);
}
