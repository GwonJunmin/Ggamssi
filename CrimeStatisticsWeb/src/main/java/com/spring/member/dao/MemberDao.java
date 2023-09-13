package com.spring.member.dao;

import com.spring.member.vo.MemberVo;

public interface MemberDao {
	
	// 회원가입
	void signup(MemberVo memberVo);
	
	// 회원찾기
	MemberVo findById(String memberId);

	// 로그인
	MemberVo login(MemberVo memberVo);

	// 회원수정
	void memberModify(MemberVo memberVo);
	
	// 회원탈퇴
	void memberDelete(String memberid);
	
	// 닉네임체크
	int nicknameCheck(String nickname);
	
	// 아이디 찾기(이메일 활용)
	String findIdWithEmail(String email);
}
