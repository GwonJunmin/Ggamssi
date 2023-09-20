package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.domain.Criteria;
import com.spring.board.vo.BoardVo;


@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private  SqlSession  sqlSession;
	
	@Override
	public List<BoardVo> getBoardList(BoardVo vo) {
		List<BoardVo> boardList = sqlSession.selectList("Board.getList", vo);
		return boardList;
	}

	@Override
	public void insertBoard(BoardVo vo) {
		sqlSession.insert("Board.insertBoard", vo);
		
	}

	@Override
	public BoardVo getView(BoardVo vo) {
		BoardVo boardVo = sqlSession.selectOne("Board.getView", vo);
		return boardVo;
	}

	@Override
	public void updateBoard(BoardVo vo) {
		sqlSession.update("Board.updateBoard", vo);
		
	}

	@Override
	public void deleteBoard(BoardVo vo) {
		sqlSession.delete("Board.deleteBoard", vo);
		
	}

	@Override
	public void readCount(BoardVo vo) {
		sqlSession.update("Board.readCount", vo);
		
	}

	@Override
	public List<BoardVo> listPage(Criteria cri) {
		List<BoardVo> boardList = sqlSession.selectList("Board.listPage", cri);
		return boardList;
	}

	@Override
	public int listCount() {
		
		return sqlSession.selectOne("Board.listCount");
	}

	


}
