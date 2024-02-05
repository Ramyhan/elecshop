package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.AdminNoticeDTO;
import com.kh.elecshop.domain.AdminProductColorDTO;
import com.kh.elecshop.domain.AdminProductDTO;
import com.kh.elecshop.domain.AdminProductRamDTO;
import com.kh.elecshop.domain.AdminProductRegisterDTO;
import com.kh.elecshop.domain.AdminProductSSdDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.FileVO;

public interface AdminMapper {
	//어드민 전체 유저 조회
	public List<AdminUserDTO> selectUser(Criteria criteria);
	//어드민 전체 유저 수
	public int selectUserTotal();
	//유저 테스트생성 
	public int insertUser(AdminUserDTO adminUserDTO);
	//어드민 유저 체크된 유저 정지
	public int updateSuspend(int[] mnos);
	//어드민 유저 체크된 유저 복구
	public int updateRepair(int[] mnos);
	//어드민 전체 공지 조회
	public List<AdminNoticeDTO> selectNotice(Criteria criteria);
	//어드민 전체 공지 수
	public int selectNoticeTotal();
	//어드민 전체 상품 조회
	public List<AdminProductDTO> selectProduct(Criteria criteria);
	//어드민 전체 상품 수
	public int selectProductTotal();
	//어드민 상품 추가
	public int insertProduct(AdminProductRegisterDTO adminProductRegisterDTO);
	//어드민 상품 램옵션 추가
	public int insertProductRamOption(List<AdminProductRamDTO> productRamDTO);
	//어드민 상품 ssd옵션 추가
	public int insertProductSSDOption(List<AdminProductSSdDTO> productSSdDTO);
	//어드민 상품 color옵션 추가
	public int insertProductColorOption(List<AdminProductColorDTO> productColorDTO);
	//어드민 상품 이미지 추가
	public int insertProductImage(List<FileVO> list);
	//어드민 상품 썸네일 조회
	public FileVO selectAttrThoumbNailImage(int pno);
	//어드민 상품 타입 이름 조회
	public String selectPtypeName(int ptype);
	//어드민 상품 수정 정보
	public AdminProductDTO selectUpdateProductByPno(int pno);
}
