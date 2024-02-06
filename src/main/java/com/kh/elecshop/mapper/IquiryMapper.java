package com.kh.elecshop.mapper;

import java.util.List;

import com.kh.elecshop.domain.IquiryVO;

public interface IquiryMapper {
	
	public int insertIquiry(IquiryVO iquiryVO);
	
	public List<IquiryVO> selectIquiryList();
	
	public IquiryVO selectIquiry(int ino);
	
	public int updateReply(IquiryVO iquiryVO);
	
	public int deleteIquiry(int ino);

}
