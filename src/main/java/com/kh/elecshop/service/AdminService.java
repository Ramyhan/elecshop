package com.kh.elecshop.service;

import java.util.Map;

import com.kh.elecshop.domain.AdminProductRegisterDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.OrderVO;
import com.kh.elecshop.domain.SearchDTO;

public interface AdminService {
	public Map<String, Object> getSearchByNotice(SearchDTO searchDTO,Criteria criteria);
	public Map<String, Object> getUserList(Criteria criteria);
	public boolean registerTestUser(AdminUserDTO adminUserDTO);
	public int modifysusend(int[] nnos);
	public int modifyRepair(int[] nnos);
	public Map<String, Object> getProductList(Criteria criteria);
	public boolean registerProduct(AdminProductRegisterDTO adminProductRegisterDTO);
	public Map<String, Object> getAdminNoticeList(Criteria criteria);
	public Map<String, Object> getOrderList(Criteria criteria);
}
