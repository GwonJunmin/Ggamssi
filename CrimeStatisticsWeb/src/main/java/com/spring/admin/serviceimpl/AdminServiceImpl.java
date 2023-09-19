package com.spring.admin.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.dao.AdminDao;
import com.spring.admin.service.AdminService;
import com.spring.admin.vo.AdminVo;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	// 관리자 로그인
	@Override
	public AdminVo login(AdminVo adminVo) {
		return adminDao.login(adminVo);
	}

}
