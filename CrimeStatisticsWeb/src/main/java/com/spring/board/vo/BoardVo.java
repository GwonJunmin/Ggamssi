package com.spring.board.vo;

public class BoardVo {
	//Fields
	private int bnum;
	private int menu_id;
	private String title;
	private String cont;
	private String writer;
	private String regdate;
	private int readcount;
	
	//Constructor
	public BoardVo() {}
	public BoardVo(int bnum, int menu_id, String title, String cont, String writer, String regdate, int readcount) {
		super();
		this.bnum = bnum;
		this.menu_id = menu_id;
		this.title = title;
		this.cont = cont;
		this.writer = writer;
		this.regdate = regdate;
		this.readcount = readcount;
	}
	//Getter/Setter   
	public int getBnum() {
		return bnum;
	}


	public void setBnum(int bnum) {
		this.bnum = bnum;
	}


	public int getMenu_id() {
		return menu_id;
	}


	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getCont() {
		return cont;
	}


	public void setCont(String cont) {
		this.cont = cont;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

    //toString
	@Override
	public String toString() {
		return "BoardVo [bnum=" + bnum + ", menu_id=" + menu_id + ", title=" + title + ", cont=" + cont + ", writer="
				+ writer + ", regdate=" + regdate + ", readcount=" + readcount + "]";
	}
}
