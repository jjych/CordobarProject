package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.BoardDto;
import com.spring.ex.dto.MemberDto;

@Service
public interface ProjectService {
	
	//로그인 MemberDto를 ldto로 선언
	public MemberDto login(MemberDto ldto) throws Exception;
	
	// 페이징
	public List<BoardDto> BoardList(HashMap<String, Integer> map) throws Exception;

	// 토탈
	public int boardTotalCount() throws Exception;
	
	/* 게시판 세션주기 bbdto()로 선언*/
	public BoardDto board2(int bNum) throws Exception;
	
	// 게시글 삭제 boardDelete 보드dto를 bddto로 선언
	public void boardDelete(BoardDto bddto) throws Exception;
	
	// 글쓰기
	public void writeAction(BoardDto bwrite) throws Exception;
	
	// 글수정
	public void BoardUpdate(BoardDto budto) throws Exception;
	
	/*검색 기능*/
	public List<BoardDto> boardSearch(String keyword) throws Exception;
}
