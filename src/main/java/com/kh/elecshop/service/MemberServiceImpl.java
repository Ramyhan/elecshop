package com.kh.elecshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.LoginDTO;
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
	@Override
	public MemberVO login(String mid, String mpw) {
		MemberVO memberVO = memberMapper.login(mid, mpw);
		return memberVO;
	}
	@Override
	public MemberVO login(LoginDTO loginDTO) {
		MemberVO memberVO = memberMapper.login(loginDTO);
		return memberVO;
	}
	@Override
	public boolean modifyMember(MemberVO memberVO) {
		int count = memberMapper.updateMember(memberVO);
		
		return (count == 1) ? true : false;
	}
	@Override
	public int selectPoint(String mid) {
		int count = memberMapper.selectPoint(mid);
		return count;
	}

}
