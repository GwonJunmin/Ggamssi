package com.spring.admin.dao;

import com.spring.admin.vo.AdminVo;

public interface AdminDao {

	// 관리자 로그인
	AdminVo login(AdminVo adminVo);
	
}
