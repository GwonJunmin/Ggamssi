package com.spring.member.vo;

import java.util.Date;

public class MemberVo {
	
	private String memberid;
	private String passwd;
	private String name;
	private String nickname;
	private String address;
	private String address_postcode; // 회원가입 시 받아올 우편 주소
	private String address_primary;	 // 회원가입 시 받아올 기본 주소
	private String address_detail; 	 // 회원가입 시 받아올 상세 주소
	private String email;
	private String emailId;		 	 // 회원가입 시 받아올 이메일 아이디
	private String emailDomain;		 // 회원가입 시 받아올 이메일 도메인
	private String sex;
	
	public String getAddress_postcode() {
		return address_postcode;
	}
	public void setAddress_postcode(String address_postcode) {
		this.address_postcode = address_postcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	private Date regdate;
	
	public String getAddress_primary() {
		return address_primary;
	}
	public void setAddress_primary(String address_primary) {
		this.address_primary = address_primary;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
