package com.kh.elecshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	@Override
	public boolean registerMember(MemberVO memberVO) {
		int count = memberMapper.insertMember(memberVO);
		return (count == 1) ? true : false;
	}

}
