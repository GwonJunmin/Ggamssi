package com.spring.member.serviceimpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.dao.MemberDao;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	// 회원가입
	@Override
	public void signup(MemberVo memberVo) {
		memberDao.signup(memberVo);
	}

	// 회원검색
	@Override
	public MemberVo findById(String memberId) {
		return memberDao.findById(memberId);
	}

	// 로그인
	@Override
	public MemberVo login(MemberVo memberVo) {
		return memberDao.login(memberVo);
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	// 회원수정
	@Override
	public void memberModify(MemberVo memberVo) {
		memberDao.memberModify(memberVo);
	}

	// 회원탈퇴
	@Override
	public void memberDelete(String memberid) {
		memberDao.memberDelete(memberid);
	}

	// 닉네임체크
	@Override
	public int nicknameCheck(String nickname) {
		return memberDao.nicknameCheck(nickname);
	}

	// 아이디 찾기(이메일 활용)
	@Override
	public String findIdWithEmail(String email) {
		return memberDao.findIdWithEmail(email);
	}
}
