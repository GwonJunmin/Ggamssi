package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.ReplyDao;
import com.spring.board.domain.ReplyVo;
import com.spring.board.vo.BoardVo;

@Repository("replyDao")
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private  SqlSession  sqlSession;

	
	//댓글작성
	@Override
	public void insertReply(ReplyVo vo) {
		sqlSession.insert("Reply.insertReply", vo);
		
	}


	@Override
	public List<ReplyVo> getReplyList(BoardVo vo) {
		List<ReplyVo> replyList = sqlSession.selectList("Reply.ReplyList", vo);
		return replyList;
	}


	@Override
	public void deleteReply(ReplyVo vo) {
		sqlSession.delete("Reply.deleteReply", vo);
		
	}


	@Override
	public void updateReply(ReplyVo vo) {
		sqlSession.update("Reply.updateReply", vo);
		
	}
}
