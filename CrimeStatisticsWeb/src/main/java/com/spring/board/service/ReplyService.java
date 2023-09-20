package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.ReplyVo;
import com.spring.board.vo.BoardVo;

public interface ReplyService {

	void insertReply(ReplyVo vo);

	List<ReplyVo> getReplyList(BoardVo vo);

	void deleteReply(ReplyVo vo);

	void updateReply(ReplyVo vo);

}
