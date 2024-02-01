package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;

public interface AdminMapper {
	public List<AdminUserDTO> selectUser(Criteria criteria);
	public int selectUserTotal();
}
