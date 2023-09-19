package com.spring.admin.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.dao.AdminDao;
import com.spring.admin.vo.AdminVo;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace = "Admin";
	
	// 관리자 로그인
	@Override
	public AdminVo login(AdminVo adminVo) {
		return sqlSession.selectOne(namespace + ".login", adminVo);
	}

}
