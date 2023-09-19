package com.spring.menu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;

@Controller
@RequestMapping("/menus")
public class MenuController {
	@Autowired
	private MenuService menuService;
	
	//메뉴 목록 조회
	@GetMapping("/list")
	public String list(Model model) {
		List<MenuVo> menuList = menuService.getMenuList();
		//System.out.println(menuList);
		model.addAttribute("menuList", menuList);
		return "menu/list";
	}
	
	//메뉴 등록
	@GetMapping("/writeform")
	public String writeform() {
		return "menu/write";
	}
	@PostMapping("/write")
	public String write(MenuVo vo) {
	 menuService.insertMenu(vo);	 
	return "redirect:/menus/list";
	}
	//메뉴 삭제
	@GetMapping("/delete")
	public String delete(MenuVo vo) {
		menuService.deleteMenu(vo);
		return "redirect:/menus/list";
	}
    //메뉴 수정
	@GetMapping("/updateform")
	public String updateform(MenuVo vo, Model model) {
		
		MenuVo menuVo = menuService.getMenu(vo);
		model.addAttribute("menuVo",menuVo);
				
		return "menu/update";
	}
	@PostMapping("/update")
	public String update(MenuVo vo) {
		menuService.updateMenu(vo);
		return "redirect:/menus/list";	
	}
}
