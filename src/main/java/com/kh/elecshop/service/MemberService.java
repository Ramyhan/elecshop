package com.kh.elecshop.service;

import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;

public interface MemberService {

	public boolean registerMember(MemberVO memberVO);
	
	public MemberVO login(String mid, String mpw);
	public MemberVO login(LoginDTO loginDTO);
}
