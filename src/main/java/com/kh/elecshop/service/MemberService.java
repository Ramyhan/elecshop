package com.kh.elecshop.service;

import java.util.Map;

import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.PointVO;

public interface MemberService {

	public boolean registerMember(MemberVO memberVO);
	
	public MemberVO login(String mid, String mpw);
	public MemberVO login(LoginDTO loginDTO);
	public boolean modifyMember(MemberVO memberVO);
	public int selectPoint(String mid);
	public boolean changePassword(String mid, String mpw);
	public String getEmail(String mid);
	public boolean memberDisabled(String mid);
	public int getMyPoint(String mid);
	public boolean updateAdminPoint(Map<String, Object> map);
	public MemberVO checkId(String mid);
}
