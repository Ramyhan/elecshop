package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.AdminProductDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;

public interface AdminMapper {
	public List<AdminUserDTO> selectUser(Criteria criteria);
	public int selectUserTotal();
	public int insertUser(AdminUserDTO adminUserDTO);
	public int updateSuspend(int[] mnos);
	public int updateRepair(int[] mnos);
	public List<AdminProductDTO> selectProduct(Criteria criteria);
	public int selectProductTotal();
}
