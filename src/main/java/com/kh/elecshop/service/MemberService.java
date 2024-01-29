package com.kh.elecshop.service;

import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.PointVO;

public interface MemberService {

	public boolean registerMember(MemberVO memberVO);
	
	public MemberVO login(String mid, String mpw);
	public MemberVO login(LoginDTO loginDTO);
	public boolean modifyMember(MemberVO memberVO);
	public int selectPoint(String mid);

}
