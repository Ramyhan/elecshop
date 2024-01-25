package com.kh.elecshop.mapper;

import org.apache.ibatis.annotations.Param;

import com.kh.elecshop.domain.MemberVO;

public interface MemberMapper {

	public int insertMember(MemberVO memberVO);
	public MemberVO login(@Param("mid") String mid, @Param("mpw") String mpw);
}
