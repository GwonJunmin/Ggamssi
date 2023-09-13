package com.spring.member.service;

import javax.servlet.http.HttpSession;

import com.spring.member.vo.MemberVo;

public interface MemberService {

	// 회원가입
	void signup(MemberVo memberVo);
	
	// 회원찾기
	MemberVo findById(String memberId);

	// 로그인
	MemberVo login(MemberVo memberVo);

	// 로그아웃
	void logout(HttpSession session);

	// 회원수정
	void memberModify(MemberVo memberVo);
	
	// 회원탈퇴
	void memberDelete(String memberid);
	
	// 닉네임체크
	int nicknameCheck(String nickname);
	
	// 아이디 찾기(이메일 활용)
	String findIdWithEmail(String email);
}
