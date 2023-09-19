package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;

@Service("boardService")
public class BoardSerivceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public List<BoardVo> getBoardList(BoardVo vo) {
		List<BoardVo> boardList = boardDao.getBoardList(vo);
		return boardList;
	}

	@Override
	public void insertBoard(BoardVo vo) {
		boardDao.insertBoard(vo);
		
	}

	@Override
	public BoardVo getView(BoardVo vo) {
		BoardVo boardVo = boardDao.getView(vo);
		return boardVo;
	}

	@Override
	public void updateBoard(BoardVo vo) {
		boardDao.updateBoard(vo);
		
	}

	@Override
	public void deleteBoard(BoardVo vo) {
		boardDao.deleteBoard(vo);
		
	}

	@Override
	public void readCount(BoardVo vo) {
		boardDao.readCount(vo);
		
	}
}
