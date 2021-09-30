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
	public BoardDto board2(int bNum) throws Exception;
	
	// 게시글 삭제 dto
	public void boardDelete(BoardDto bddto) throws Exception;
	
	// 글쓰기
	public void writeAction(BoardDto bwrite) throws Exception;
	
	// 글수정 dto
	public void BoardUpdate(BoardDto budto) throws Exception;
	
	//검색기능
	public List<BoardDto> boardSearch(String keyword) throws Exception;
}
