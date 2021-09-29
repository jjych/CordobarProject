package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.MemberDao;
import com.spring.ex.dto.BoardDto;
import com.spring.ex.dto.MemberDto;

@Service
public class ServiceProject implements ProjectService{

	@Inject
	private MemberDao memberDao;
		
	//로그인
	@Override
	public MemberDto login(MemberDto ldto) throws Exception{
		return memberDao.login(ldto);
	}
	
	// 게시판 페이징 출력
	public List<BoardDto> BoardList(HashMap<String, Integer> map) throws Exception {
		return memberDao.BoardList(map);
	}
	
	// 게시판 토탈
	public int boardTotalCount() throws Exception {
		return memberDao.boardTotalCount();
	}
	
	// 게시글 세션주기
	@Override
	public BoardDto board2(BoardDto bbdto) throws Exception {
		return memberDao.board2(bbdto);
	}
	
	// 게시글 삭제하기
	@Override
	public void boardDelete(BoardDto bddto) throws Exception{
		memberDao.boardDelete(bddto);
	}
	
	// 글쓰기
	@Override
	public void writeAction(BoardDto bwrite) throws Exception {
		memberDao.writeAction(bwrite);
	}
	
	// 게시글 수정
	@Override
	public void BoardUpdate(BoardDto budto) throws Exception{
		memberDao.BoardUpdate(budto);
	}
	
	// 검색
	@Override
	public List<BoardDto> boardSearch(String keyword) throws Exception{
		
		return memberDao.boardSearch(keyword);
	}
}
