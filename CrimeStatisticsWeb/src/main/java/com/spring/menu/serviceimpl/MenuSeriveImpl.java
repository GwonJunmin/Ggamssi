package com.spring.menu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.menu.dao.MenuDao;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;

@Service("menuService")
public class MenuSeriveImpl implements MenuService {


	@Autowired
	private MenuDao menuDao;
	
	//메뉴 조회
	@Override
	public List<MenuVo> getMenuList() {
		List<MenuVo> menuList = menuDao.getMenuList();
		return menuList;
	}

	@Override
	public void insertMenu(MenuVo vo) {
		menuDao.insertMenu(vo);
		
	}

	@Override
	public void deleteMenu(MenuVo vo) {
		menuDao.deleteMenu(vo);
		
	}

	@Override
	public MenuVo getMenu(MenuVo vo) {
		MenuVo menuVo = menuDao.getMenu(vo);
		return menuVo;
	}

	@Override
	public void updateMenu(MenuVo vo) {
		menuDao.updateMenu(vo);
		
	}

	@Override
	public String getMenu_name(int menu_id) {
		String menu_name = menuDao.getMenu_name(menu_id);
		return menu_name;
	}

}
