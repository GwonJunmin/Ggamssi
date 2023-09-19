package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.BoardVo;

public interface BoardService {

	List<BoardVo> getBoardList(BoardVo vo);

	void insertBoard(BoardVo vo);

	BoardVo getView(BoardVo vo);

	void updateBoard(BoardVo vo);

	void deleteBoard(BoardVo vo);

	void readCount(BoardVo vo);

}
