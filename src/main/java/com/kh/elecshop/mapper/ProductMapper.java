package com.kh.elecshop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.domain.ProductVO;

public interface ProductMapper {
	
	public List<ProductDTO> selectProductList(int ptype);
	
	public ProductVO selectProduct(int pno);
	
	public List<ProductDTO> selectByKeyword(@Param("ptype") int ptype, @Param("keyword") String keyword);

	public List<ProductDTO> selectByManu(@Param("ptype") int ptype, @Param("manuval") String manuval);
	
	public List<ProductDTO> selectByOption(@Param("ptype") int ptype, @Param("option") String option);
	
	public List<ProductDTO> selectByPdno(@Param("ptype") int ptype, @Param("optionval") String optionval);
	
	public int updateOrderCount(@Param("order_count") int order_count, @Param("pno") int pno);
	
	public List<ProductDTO> selectTop8();
	
	public int deleteProduct(String pnos);
}
