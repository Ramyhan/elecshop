package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.IquiryVO;

public interface IquiryService {

	public boolean addIquiry(IquiryVO iquiryVO);
	
	public List<IquiryVO> getIquiryList();
	
	public IquiryVO getIquiry(int ino);
	
	public boolean addReply(IquiryVO iquiryVO);
	
	public boolean removeIquiry(int ino);
	
}