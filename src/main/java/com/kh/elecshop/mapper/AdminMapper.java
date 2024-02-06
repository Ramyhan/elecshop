package com.kh.elecshop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.elecshop.domain.AdminNoticeDTO;
import com.kh.elecshop.domain.AdminProductDTO;
import com.kh.elecshop.domain.AdminProductInfoDTO;
import com.kh.elecshop.domain.AdminProductRegisterDTO;
import com.kh.elecshop.domain.AdminProductOptionDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.FileVO;
import com.kh.elecshop.domain.ProductOptionVO;

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
	public int insertProductRamOption(List<AdminProductOptionDTO> productRamDTO);
	//어드민 상품 ssd옵션 추가
	public int insertProductSSDOption(List<AdminProductOptionDTO> productSSdDTO);
	//어드민 상품 color옵션 추가
	public int insertProductColorOption(List<AdminProductOptionDTO> productColorDTO);
	//어드민 상품 이미지 추가
	public int insertProductImage(List<FileVO> list);
	//어드민 상품 썸네일 조회
	public FileVO selectAttrThoumbNailImage(int pno);
	//어드민 상품 타입 이름 조회
	public String selectPtypeName(int ptype);
	//어드민 상품 수정 정보
	public AdminProductInfoDTO selectProductInfoByPno(int pno);
	//어드민 상품 상세정보 옵션 가져오기
	public List<ProductOptionVO> selectProductInfoOption(int pno);
	//어드민 상품 이미지 가져오기
	public List<FileVO> selectProductInfoImage(int pno);
	//어드민 상품 램옵션 가져오기
	public List<AdminProductOptionDTO> selectProductInfoRamOption(int pno);
	//어드민 상품 스스디옵션 가져오기
	public List<AdminProductOptionDTO> selectProductInfoSSDOption(int pno);
	//어드민 상품 컬러옵션 가져오기
	public List<AdminProductOptionDTO> selectProductInfoColorOption(int pno);
	//어드민 상품 옵션 삭제
	public int deleteOption(@Param("ono") int ono,@Param("pno") int pno);
	
}
