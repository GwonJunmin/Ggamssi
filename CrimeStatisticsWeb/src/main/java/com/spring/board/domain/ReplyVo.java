package com.spring.board.domain;

import java.util.Date;

public class ReplyVo {
	//fields
	private int rnum;
	private int bnum;
	private String writer;
	private String cont;
	private Date regdate;
	
	//Constructor
	public ReplyVo() {}
	public ReplyVo(int rnum, int bnum, String writer, String cont, Date regdate) {
		super();
		this.rnum = rnum;
		this.bnum = bnum;
		this.writer = writer;
		this.cont = cont;
		this.regdate = regdate;
	}
	
	//Getter/Setter
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getcont() {
		return cont;
	}
	public void setcont(String cont) {
		this.cont = cont;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	//toString
	@Override
	public String toString() {
		return "ReplyVo [rnum=" + rnum + ", bnum=" + bnum + ", writer=" + writer + ", cont=" + cont + ", regdate="
				+ regdate + "]";
	} 
}
