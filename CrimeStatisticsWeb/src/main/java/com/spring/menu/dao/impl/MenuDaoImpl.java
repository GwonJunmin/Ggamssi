package com.spring.menu.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.menu.dao.MenuDao;
import com.spring.menu.vo.MenuVo;

@Repository("menuDao")
public class MenuDaoImpl implements MenuDao {

	@Autowired
	private SqlSession sqlSession;
	// private final String namespace = "Menus"; 
	
	@Override
	public List<MenuVo> getMenuList() {
		List<MenuVo> menuList = sqlSession.selectList("Menus.MenuList");
		return menuList;
	}

	@Override
	public void insertMenu(MenuVo vo) {
		sqlSession.insert("Menus.insertMenu", vo);
		
	}

	@Override
	public void deleteMenu(MenuVo vo) {
		sqlSession.delete("Menus.deleteMenu", vo);		
	}

	@Override
	public MenuVo getMenu(MenuVo vo) {
		MenuVo menuVo = sqlSession.selectOne("Menus.getMenu", vo);
		return menuVo;
	}

	@Override
	public void updateMenu(MenuVo vo) {
		sqlSession.update("Menus.updateMenu", vo);		
	}

	@Override
	public String getMenu_name(int menu_id) {
		String menu_name = sqlSession.selectOne("Menus.MenuName", sqlSession);
		return menu_name;
	}

}
