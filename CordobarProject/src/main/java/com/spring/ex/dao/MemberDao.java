package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.BoardDto;
import com.spring.ex.dto.MemberDto;

@Repository
public interface MemberDao {
	
	// 로그인 dto
	public MemberDto login(MemberDto ldto) throws Exception;
	
	// 게시판 페이징
	public List<BoardDto> BoardList(HashMap<String, Integer> map) throws Exception;
	
	// 토탈
	public int boardTotalCount() throws Exception;
	
	// 게시판 세션주기
	public BoardDto board2(BoardDto bbdto) throws Exception;
	
	// 게시글 삭제 dto
	public void boardDelete(BoardDto bddto) throws Exception;
}
