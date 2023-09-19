package com.spring.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.admin.service.AdminService;
import com.spring.admin.vo.AdminVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	// 관리자 로그인 페이지
	@GetMapping("/login-page")
	public String adminLoginForm() {
		return "admin/login";
	}
	
	// 관리자 로그인
	@PostMapping("/login")
	public String adminLogin(HttpSession session, AdminVo adminVo) {
		AdminVo findAdmin = adminService.login(adminVo);
		session.setAttribute("adminid", findAdmin.getAdminid());
		session.setAttribute("nickname", findAdmin.getNickname());
		System.out.println(session.getAttribute("adminid"));
		System.out.println(session.getAttribute("nickname"));
		
		return "redirect:/";
	}
	
	// 관리자 로그아웃
	@GetMapping("/logout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 관리자 페이지
	@GetMapping("/page")
	public String adminPage() {
		return "admin/page";
	}
	
	// 상품 등록
	@GetMapping("/products/register")
	public String productsRegisterForm() {
		return "admin/products/register";
	}
	
}
