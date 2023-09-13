package com.spring.member.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.member.dao.MemberDao;
import com.spring.member.vo.MemberVo;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace = "Member";
	
	// 회원가입
	@Override
	public void signup(MemberVo memberVo) {
		sqlSession.insert(namespace + ".signup", memberVo);
	}

	// 회원찾기
	@Override
	public MemberVo findById(String memberId) {
		return sqlSession.selectOne(namespace + ".findById", memberId);
	}

	// 로그인
	@Override
	public MemberVo login(MemberVo memberVo) {
		return sqlSession.selectOne(namespace + ".login", memberVo);
	}

	// 회원수정
	@Override
	public void memberModify(MemberVo memberVo) {
		sqlSession.update(namespace + ".memberModify", memberVo);
	}

	// 회원탈퇴
	@Override
	public void memberDelete(String memberid) {
		sqlSession.delete(namespace + ".memberDelete", memberid);
	}

	// 닉네임체크
	@Override
	public int nicknameCheck(String nickname) {
		return sqlSession.selectOne(namespace + ".nicknameCheck", nickname);
	}

	// 아이디 찾기(이메일 활용)
	@Override
	public String findIdWithEmail(String email) {
		return sqlSession.selectOne(namespace + ".findIdWithEmail", email);
	}
}
