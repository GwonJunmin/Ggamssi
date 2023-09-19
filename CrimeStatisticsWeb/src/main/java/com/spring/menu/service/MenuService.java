package com.spring.menu.service;

import java.util.List;

import com.spring.menu.vo.MenuVo;

public interface MenuService {

	List<MenuVo> getMenuList();

	void insertMenu(MenuVo vo);

	void deleteMenu(MenuVo vo);

	MenuVo getMenu(MenuVo vo);

	void updateMenu(MenuVo vo);

	String getMenu_name(int menu_id);

}
