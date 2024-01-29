package com.kh.elecshop.mapper;

import org.apache.ibatis.annotations.Param;

import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;

public interface MemberMapper {

	public int insertMember(MemberVO memberVO);
	public MemberVO login(@Param("mid") String mid, @Param("mpw") String mpw);
	public MemberVO login(LoginDTO loginDTO);
	public int updateMember(MemberVO memberVO);
	public int selectPoint(String mid);
}
