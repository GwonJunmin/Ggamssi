package com.spring.menu.dao;

import java.util.List;

import com.spring.menu.vo.MenuVo;

public interface MenuDao {

	List<MenuVo> getMenuList();

	void insertMenu(MenuVo vo);

	void deleteMenu(MenuVo vo);

	MenuVo getMenu(MenuVo vo);

	void updateMenu(MenuVo vo);

	String getMenu_name(int menu_id);

}
