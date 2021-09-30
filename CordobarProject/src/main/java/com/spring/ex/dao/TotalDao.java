package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.BoardDto;
import com.spring.ex.dto.MemberDto;

@Repository
public class TotalDao implements MemberDao {

	@Inject
	private SqlSession sqlSessionTemplate;
	private static final String namespace = "com.spring.ex.mapper";//mapper �� id �� ã�°�
	
	// 로그인
	@Override
	public MemberDto login(MemberDto ldto) throws Exception{
		return sqlSessionTemplate.selectOne(namespace + ".login", ldto);
	}
	
	// 게시판뷰 페이징 출력
	@Override
	public List<BoardDto> BoardList(HashMap<String, Integer> map) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".BoardList", map);
	}
	
	// 페이징 토탈
	@Override
	public int boardTotalCount() throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".boardTotalCount");
	}
	
	// 게시판 세션주기
	@Override
	public BoardDto board2(int bNum) throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".board2", bNum); 
	}
	
	// 게시글 삭제 delete문
	@Override
	public void boardDelete(BoardDto bddto) throws Exception {
		sqlSessionTemplate.delete(namespace + ".boardDelete", bddto);
	}
	
	// 글쓰기
	public void writeAction(BoardDto bwrite) throws Exception {
		sqlSessionTemplate.insert(namespace + ".writeAction", bwrite);
	}
	
	// 글수정
	@Override
	public void BoardUpdate(BoardDto budto) throws Exception{
		sqlSessionTemplate.update(namespace + ".boardUpdate", budto);
	}
	
	// 검색기능
	public List<BoardDto> boardSearch(String keyword) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".boardSearch",keyword);
	}
}
