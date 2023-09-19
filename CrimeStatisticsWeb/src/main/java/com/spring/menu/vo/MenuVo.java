package com.spring.menu.vo;

public class MenuVo {
	//Fields
	private int menu_id;
	private String menu_name;
	private int menu_cate;
	
	//Constructor
	public MenuVo() {}
	public MenuVo(int menu_id, String menu_name, int menu_cate) {
		super();
		this.menu_id = menu_id;
		this.menu_name = menu_name;
		this.menu_cate = menu_cate;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_cate() {
		return menu_cate;
	}
	public void setMenu_cate(int menu_cate) {
		this.menu_cate = menu_cate;
	}
	//toString
	@Override
	public String toString() {
		return "MenuVo [menu_id=" + menu_id + ", menu_name=" + menu_name + ", menu_cate=" + menu_cate + "]";
	}
}
