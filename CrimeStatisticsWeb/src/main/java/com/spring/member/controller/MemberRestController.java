package com.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;

@RestController
@RequestMapping("/member")
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
	// 비밀번호 확인
	@PostMapping("/password-check")
	@ResponseBody
	public String passwordCheck(@RequestParam("password") String password, HttpSession session) {
		String memberid = (String)session.getAttribute("memberid");
		MemberVo findMember = memberService.findById(memberid);
		if (findMember.getPasswd().equals(password)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 아이디 중복체크
	@PostMapping("/id-check-duplicate")
	@ResponseBody
	public String idCheckDuplicate(@RequestParam("memberid") String memberid) {
		MemberVo findMember = memberService.findById(memberid);
		if (findMember == null) {
			return "possible";
		} else {
			return "duplicate";
		}
	}
	
	// 닉네임 중복체크
	@PostMapping("/nickname-check-duplicate")
	@ResponseBody
	public String nicknameCheckDuplicate(@RequestParam("nickname") String nickname) {
		int num = memberService.nicknameCheck(nickname);
		if (num == 0) {
			return "available";
		} else {
			return "duplicate";
		}
	}
	
	@PostMapping("/find-password")
	@ResponseBody
	public String findPassword(@RequestParam("memberid") String memberid) {
		MemberVo findMember = memberService.findById(memberid);
		if (findMember != null) {
			return findMember.getPasswd();
		} else {
			return "null";
		}
	}
	
}
