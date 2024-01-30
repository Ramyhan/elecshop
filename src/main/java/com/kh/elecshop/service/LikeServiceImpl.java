package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.LikeVO;
import com.kh.elecshop.mapper.LikeMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeMapper likeMapper;

	@Override
	public boolean addLike(LikeVO likeVO) {
		int count = likeMapper.insertLike(likeVO);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean removeByPno(LikeVO likeVO) {
		int count = likeMapper.deleteByPno(likeVO);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean removeByLno(int lno) {
		int count = likeMapper.deleteByLno(lno);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean isExist(LikeVO likeVO) {
		log.info("likeVO: " + likeVO);
		int count = likeMapper.selectItem(likeVO);
		log.info("count: " + count);
		return (count == 1) ? true : false;
	}

	@Override
	public List<LikeVO> getLikeList(String mid) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
