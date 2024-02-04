package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.AdminProductDTO;
import com.kh.elecshop.domain.AdminProductRamDTO;
import com.kh.elecshop.domain.AdminProductRegisterDTO;
import com.kh.elecshop.domain.AdminProductSSdDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.FileVO;

public interface AdminMapper {
	public List<AdminUserDTO> selectUser(Criteria criteria);
	public int selectUserTotal();
	public int insertUser(AdminUserDTO adminUserDTO);
	public int updateSuspend(int[] mnos);
	public int updateRepair(int[] mnos);
	public List<AdminProductDTO> selectProduct(Criteria criteria);
	public int selectProductTotal();
	public int insertProduct(AdminProductRegisterDTO adminProductRegisterDTO);
	public int insertProductRamOption(List<AdminProductRamDTO> productRamDTO);
	public int insertProductSSDOption(List<AdminProductSSdDTO> productSSdDTO);
	public int insertProductImage(List<FileVO> list);
	public FileVO selectAttrThoumbNailImage(int pno);
}