package com.kh.elecshop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.elecshop.domain.AdminNoticeDTO;
import com.kh.elecshop.domain.AdminProductDTO;
import com.kh.elecshop.domain.AdminProductInfoDTO;
import com.kh.elecshop.domain.AdminProductRegisterDTO;
import com.kh.elecshop.domain.AdminProductOptionDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.FileVO;
import com.kh.elecshop.domain.ManufacturerVO;
import com.kh.elecshop.domain.OrderDetailVO;
import com.kh.elecshop.domain.OrderVO;
import com.kh.elecshop.domain.PageDTO;
import com.kh.elecshop.domain.PointVO;
import com.kh.elecshop.domain.ProductOptionVO;
import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.mapper.AdminMapper;
import com.kh.elecshop.mapper.NoticeMapper;
import com.kh.elecshop.mapper.OrderDetailMapper;
import com.kh.elecshop.mapper.ProductMapper;

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
	@Autowired
	private ProductMapper productmapper;
	
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
		int total = adminMapper.selectProductTotal(criteria);
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
		log.info("adminProductregisterDTO: " + adminProductRegisterDTO);
		int productResult = adminMapper.insertProduct(adminProductRegisterDTO);
		int fileResult = 0;
		List<AdminProductOptionDTO> optionList = new ArrayList<AdminProductOptionDTO>();
		int pno = adminProductRegisterDTO.getPno();
		List<FileVO> fileList = adminProductRegisterDTO.getAttrProductList();
		if(fileList != null) {
			for(int i = 0; i < fileList.size(); i++) {
				FileVO fileVO = fileList.get(i);
				fileVO.setPno(pno);
			}
			fileResult = adminMapper.insertProductImage(fileList);
		}
		List<AdminProductOptionDTO> ramList = adminProductRegisterDTO.getRamList();
		List<AdminProductOptionDTO> ssdList = adminProductRegisterDTO.getSsdList();
		List<AdminProductOptionDTO> colorList = adminProductRegisterDTO.getColorList();
		if(ramList != null) {
			optionList.addAll(ramList);
		}
		if(ssdList != null) {
			optionList.addAll(ssdList);
		}
		if(colorList != null) {
			optionList.addAll(colorList);
		}
		for(AdminProductOptionDTO dto:optionList) {
			dto.setPno(pno);
		}
		int optionResult = adminMapper.insertProductOption(optionList);
		System.out.println("optionResult:"+optionResult);
		System.out.println("fileResult:"+fileResult);
		System.out.println("productResult:"+productResult);
		if(optionResult + fileResult + productResult >= 3) {
			return true;
		}
		return false;
	}
	@Override
	public List<ManufacturerVO> getMenuFacturer() {
		List<ManufacturerVO> list = adminMapper.selectManuFacturer();
		return list;
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
	public AdminProductInfoDTO getProductInfo(int pno) {
		AdminProductInfoDTO productInfoDTO = adminMapper.selectProductInfoByPno(pno);
		List<ProductOptionVO> OptionList = adminMapper.selectProductInfoOption(pno);
		List<AdminProductOptionDTO> ramList =adminMapper.selectProductInfoRamOption(pno);
		List<AdminProductOptionDTO> ssdList =adminMapper.selectProductInfoSSDOption(pno);
		List<AdminProductOptionDTO> colorList =adminMapper.selectProductInfoColorOption(pno);
		productInfoDTO.setRamList(ramList);
		productInfoDTO.setSsdList(ssdList);
		productInfoDTO.setColorList(colorList);
		if(OptionList != null) {
			productInfoDTO.setOptionList(OptionList);
		}
		List<FileVO> fileList = adminMapper.selectProductInfoImage(pno);
		
		if(fileList != null) {
			FileVO thoumbImage = new FileVO();
			FileVO imageInfo1 = new FileVO();
			FileVO imageInfo2 = new FileVO();
			for(int i = 0; i < fileList.size(); i++) {
				FileVO vo = fileList.get(i);
				if(vo.getImage_info().equals("thoumb")) {
					thoumbImage = vo;
				}else if(vo.getImage_info().equals("info1")){
					imageInfo1 = vo;
				}else if(vo.getImage_info().equals("info2")) {
					imageInfo2 = vo;
				}
			}
			productInfoDTO.setImageThoumb(thoumbImage);
			productInfoDTO.setImageInfo1(imageInfo1);
			productInfoDTO.setImageInfo2(imageInfo2);
			productInfoDTO.setAttrProductList(fileList);
		}
		return productInfoDTO;
	}
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

	@Override
	public boolean updateOrderStatus(int ono, int status) {
		int count = adminMapper.updateOrderStatus(ono, status);
		return (count == 1) ? true:false;
	}

	@Override
	@Transactional
	public boolean modifyProduct(AdminProductInfoDTO adminProductInfoDTO) {
		adminMapper.updateProduct(adminProductInfoDTO);
		FileVO thoumb = adminProductInfoDTO.getImageThoumb();
		FileVO info1 =adminProductInfoDTO.getImageInfo1();
		FileVO info2 = adminProductInfoDTO.getImageInfo2();
		List<FileVO> fileList = new ArrayList<FileVO>();
		fileList.add(thoumb);
		fileList.add(info1);
		fileList.add(info2);
		log.info("11" + fileList);
		adminMapper.deleteProductOptionByPno(adminProductInfoDTO.getPno());
		List<AdminProductOptionDTO> ramList = adminProductInfoDTO.getRamList();
		List<AdminProductOptionDTO> ssdList = adminProductInfoDTO.getSsdList();
		List<AdminProductOptionDTO> colorList = adminProductInfoDTO.getColorList();
		List<AdminProductOptionDTO> productOption = new ArrayList<AdminProductOptionDTO>();
		if(ramList != null) {
			productOption.addAll(ramList);
		}
		if(ssdList != null) {
			productOption.addAll(ssdList);
		}
		if(colorList != null) {
			productOption.addAll(colorList);
		}
		if(productOption != null) {
			adminMapper.updateOption(productOption);
		}
		adminMapper.updateProductImage(fileList);
		return false;
	}
	public Map<String, Object> getPointList(Criteria criteria) {
		int total = adminMapper.selectPointTotal();
		PageDTO pageDTO = new PageDTO(criteria, total);
		
		List<PointVO> list = adminMapper.selectPointList(criteria);
		log.info("리스트" + list);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pointList", list);
		map.put("page", pageDTO);
		return map;
	}
}
