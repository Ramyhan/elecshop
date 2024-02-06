package com.kh.elecshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.elecshop.domain.AdminNoticeDTO;
import com.kh.elecshop.domain.AdminProductColorDTO;
import com.kh.elecshop.domain.AdminProductDTO;
import com.kh.elecshop.domain.AdminProductRamDTO;
import com.kh.elecshop.domain.AdminProductRegisterDTO;
import com.kh.elecshop.domain.AdminProductSSdDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.FileVO;
import com.kh.elecshop.domain.OrderDetailVO;
import com.kh.elecshop.domain.OrderVO;
import com.kh.elecshop.domain.PageDTO;
import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.mapper.AdminMapper;
import com.kh.elecshop.mapper.NoticeMapper;
import com.kh.elecshop.mapper.OrderDetailMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	
	@Override
	public Map<String, Object> getSearchByNotice(SearchDTO searchDTO,Criteria criteria) {
		List<SubNoticeDTO> list = noticeMapper.selectSearchWord(searchDTO);
		int total = noticeMapper.selectSearchTotal(searchDTO);
		PageDTO pageDTO = new PageDTO(criteria, total);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subNoticeList", list);
		map.put("page", pageDTO);
		return map;
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

	@Override
	public boolean registerTestUser(AdminUserDTO adminUserDTO) {
		int count = adminMapper.insertUser(adminUserDTO);
		if(count == 1) {
			return true;
		}
		return false;
	}

	@Override
	public int modifysusend(int[] nnos) {
		int count = adminMapper.updateSuspend(nnos);
		return count;
	}

	@Override
	public int modifyRepair(int[] nnos) {
		int count = adminMapper.updateRepair(nnos);
		return count;
	}

	@Override
	public Map<String, Object> getProductList(Criteria criteria) {
		int total = adminMapper.selectProductTotal();
		PageDTO pageDTO = new PageDTO(criteria, total);
		List<AdminProductDTO> list = adminMapper.selectProduct(criteria);
		for(int i = 0; i < list.size();i++) {
			AdminProductDTO productDTO = list.get(i);
			String ptypeName = adminMapper.selectPtypeName(productDTO.getPtype());
			FileVO fileVO = adminMapper.selectAttrThoumbNailImage(productDTO.getPno());
			productDTO.setFileVO(fileVO);
			productDTO.setPtypeName(ptypeName);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pageDTO);
		map.put("productList", list);
		
		
		return map;
	}

	@Override
	@Transactional
	public boolean registerProduct(AdminProductRegisterDTO adminProductRegisterDTO) {
		int count = adminMapper.insertProduct(adminProductRegisterDTO);
		int pno = adminProductRegisterDTO.getPno();
		List<FileVO> fileList = adminProductRegisterDTO.getAttrProductList();
		if(fileList != null) {
			for(int i = 0; i < fileList.size(); i++) {
				FileVO fileVO = fileList.get(i);
				fileVO.setPno(pno);
			}
		}
		List<AdminProductRamDTO> ramList = adminProductRegisterDTO.getRamList();
		if( ramList != null) {
			for(int i = 0; i < ramList.size(); i ++) {
				AdminProductRamDTO productRamDTO = ramList.get(i);
				productRamDTO.setPno(pno);
				int ramOption = adminMapper.insertProductRamOption(ramList);
			}
		}
		List<AdminProductSSdDTO> ssdList = adminProductRegisterDTO.getSsdList();
		if(ssdList != null) {
			for(int i = 0; i < ssdList.size(); i ++) {
				AdminProductSSdDTO productSSdDTO = ssdList.get(i);
				productSSdDTO.setPno(pno);
				int ssdOption = adminMapper.insertProductSSDOption(ssdList);
			}
			List<AdminProductColorDTO> colorList = adminProductRegisterDTO.getColorList();
			if(colorList != null) {
				for(int i = 0; i < colorList.size();i++) {
					AdminProductColorDTO productColorDTO = colorList.get(i);
					productColorDTO.setPno(pno);
					int colorOption = adminMapper.insertProductSSDOption(ssdList);
				}
			}
		}
		int image = adminMapper.insertProductImage(fileList);
		return true;
	}

	@Override
	public Map<String, Object> getAdminNoticeList(Criteria criteria) {
		List<AdminNoticeDTO> subNoticeList = adminMapper.selectNotice(criteria);
		int total = adminMapper.selectNoticeTotal();
		PageDTO pageDTO = new PageDTO(criteria, total);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subNoticeList", subNoticeList);
		map.put("page", pageDTO);
		return map;
	}

	@Override
	public Map<String, Object> getOrderList(Criteria criteria) {
		int total = adminMapper.selectOrderTotal();
		PageDTO pageDTO = new PageDTO(criteria, total);
		
		List<OrderVO> list = adminMapper.selectOrderList(criteria);
		log.info("리스트" + list);
		for(OrderVO vo : list) {
			List<OrderDetailVO> odVO = orderDetailMapper.selectMyOrder(vo.getOno());		
			vo.setList(odVO);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("orderList", list);
		map.put("page", pageDTO);
		return map;
	}

}
