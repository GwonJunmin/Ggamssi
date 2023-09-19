package com.spring.admin.service;

import com.spring.admin.vo.AdminVo;

public interface AdminService {

	// 관리자 로그인
	AdminVo login(AdminVo adminVo);
}
