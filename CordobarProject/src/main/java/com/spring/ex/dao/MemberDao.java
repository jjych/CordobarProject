package com.spring.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberDto;

@Repository
public interface MemberDao {
	
	// 로그인 dto
	public MemberDto login(MemberDto ldto) throws Exception;
}
