package com.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원가입 페이지
	@GetMapping("/signup-page")
	public String signupForm() {
		return "member/signup";
	}
	
	// 회원가입
	@PostMapping("/signup")
	public String signup(MemberVo memberVo) {
		memberVo.setAddress(memberVo.getAddress_primary() + " " + memberVo.getAddress_detail());
		memberVo.setEmail(memberVo.getEmailId() + "@" + memberVo.getEmailDomain());
		memberService.signup(memberVo);
		return "redirect:/";
	}
	
	// 로그인 페이지
	@GetMapping("/login-page")
	public String loginFrom() {
		return "member/login";
	}
	
	// 로그인
	@PostMapping("/login")
	public String login(MemberVo memberVo, HttpSession session, Model model) {
		
		MemberVo loginMember = memberService.login(memberVo);
		session.setAttribute("memberid", loginMember.getMemberid());
		session.setAttribute("nickname", loginMember.getNickname());
		return "redirect:/";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		memberService.logout(session);
		return "redirect:/";
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) {
		String memberid = (String)session.getAttribute("memberid");
		MemberVo findMember = memberService.findById(memberid);
		model.addAttribute("member", findMember);
		return "member/mypage";
	}
	
	// 회원 수정
	@PostMapping("/modify")
	public String modify(MemberVo memberVo, @RequestParam("newPasswd") String newPasswd) {
		memberVo.setPasswd(newPasswd);
		memberVo.setAddress(memberVo.getAddress_primary() + " " + memberVo.getAddress_detail());
		memberVo.setEmail(memberVo.getEmailId() + "@" + memberVo.getEmailDomain());
		memberService.memberModify(memberVo);
		return "redirect:/member/mypage";
	}
	
	// 회원 탈퇴
	@PostMapping("/delete")
	public String delete(HttpSession session) {
		String memberid = (String)session.getAttribute("memberid");
		memberService.memberDelete(memberid);
		session.invalidate();
		return "redirect:/";
	}
}
