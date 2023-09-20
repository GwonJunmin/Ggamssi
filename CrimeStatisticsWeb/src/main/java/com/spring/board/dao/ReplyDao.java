package com.spring.board.dao;

import java.util.List;

import com.spring.board.domain.ReplyVo;
import com.spring.board.vo.BoardVo;

public interface ReplyDao {

	void insertReply(ReplyVo vo);

	List<ReplyVo> getReplyList(BoardVo vo);

	void deleteReply(ReplyVo vo);

	void updateReply(ReplyVo vo);

}
