package com.spring.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		HttpSession session = req.getSession();
		String memberid = (String)session.getAttribute("memberid");
		String adminid  = (String)session.getAttribute("adminid");
		
		// 회원 로그인 상태가 아니며, 관리자 로그인 상태가 아닐 때에만 허용
	    if (memberid == null && adminid == null) { 
	        String requestUri = req.getRequestURI();
	        if (requestUri.equals("/admin/login-page") || requestUri.equals("/admin/login")) {
	            return true;
	        } else {
	            res.sendRedirect("/member/login-page");
	            return false;
	        }
	    } else if (memberid != null && adminid == null) { // 회원 로그인 상태일 때
	        res.sendRedirect("/");
	        return false;
	    }
	
	    return true; // 관리자 로그인 상태일 때 계속 진행
	}
}
