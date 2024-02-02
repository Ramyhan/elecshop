package com.kh.elecshop.service;

import java.util.List;
import java.util.Map;

import com.kh.elecshop.domain.AdminProductDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;

public interface AdminService {
	public List<SubNoticeDTO> getSearchByNotice(SearchDTO searchDTO);
	public Map<String, Object> getUserList(Criteria criteria);
	public boolean registerTestUser(AdminUserDTO adminUserDTO);
	public int modifysusend(int[] nnos);
	public int modifyRepair(int[] nnos);
	public Map<String, Object> getProductList(Criteria criteria);
}
