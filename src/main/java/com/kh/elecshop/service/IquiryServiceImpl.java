package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.IquiryVO;
import com.kh.elecshop.mapper.IquiryMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class IquiryServiceImpl implements IquiryService {
	
	@Autowired
	private IquiryMapper iquiryMapper;

	@Override
	public boolean addIquiry(IquiryVO iquiryVO) {
		int count = iquiryMapper.insertIquiry(iquiryVO);
		return (count == 1) ? true : false;
	}

	@Override
	public List<IquiryVO> getIquiryList() {
		List<IquiryVO> list = iquiryMapper.selectIquiryList();
		return list;
	}

	@Override
	public IquiryVO getIquiry(int ino) {
		IquiryVO iquiryVO = iquiryMapper.selectIquiry(ino);
		return iquiryVO;
	}

	@Override
	public boolean addReply(IquiryVO iquiryVO) {
		log.info("iquiryVO: " + iquiryVO);
		int count = iquiryMapper.updateReply(iquiryVO);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean removeIquiry(int ino) {
		int count = iquiryMapper.deleteIquiry(ino);
		return (count == 1) ? true : false;
	}

	@Override
	public List<IquiryVO> getIquiryByMid(String mid) {
		List<IquiryVO> list = iquiryMapper.selectIquiryByMid(mid);
		return list;
	}

	@Override
	public List<IquiryVO> getIquiryTop5(String mid) {
		List<IquiryVO> list = iquiryMapper.selectIquiryTop5(mid);
		return list;
	}

}
