package com.kh.elecshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.PointVO;
import com.kh.elecshop.mapper.MemberMapper;
import com.kh.elecshop.mapper.PointMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PointMapper pointMapper;
	
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
	@Override
	public boolean changePassword(String mid, String mpw) {
		int count = memberMapper.changePassword(mid, mpw);
		return (count == 1) ? true:false;
	}
	@Override
	public String getEmail(String mid) {
		String email = memberMapper.getEmail(mid);
		return email;
	}
	@Override
	public boolean memberDisabled(String mid) {
		int count = memberMapper.memberDisabled(mid);
		return (count == 1) ? true : false;
	}

}
