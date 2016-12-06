package com.online.shop.domain;

import java.util.Date;

public class SellerVO {

	// 멤버 변수
	private int s_no;
	private String s_id;
	private String s_pw;
	private String s_name;
	private int s_gender;
	private String s_birth;
	private int s_phone;
	private String s_email;
	private String s_zip;
	private String s_addr1;
	private String s_addr2;
	private Date s_reg;
	private int s_acc;
	private String s_logo;
	private String s_info;
	
	// 생성자
	public SellerVO() {}

	// getter/setter 메소드
	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_pw() {
		return s_pw;
	}

	public void setS_pw(String s_pw) {
		this.s_pw = s_pw;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public int getS_gender() {
		return s_gender;
	}

	public void setS_gender(int s_gender) {
		this.s_gender = s_gender;
	}

	public String getS_birth() {
		return s_birth;
	}

	public void setS_birth(String s_birth) {
		this.s_birth = s_birth;
	}

	public int getS_phone() {
		return s_phone;
	}

	public void setS_phone(int s_phone) {
		this.s_phone = s_phone;
	}

	public String getS_email() {
		return s_email;
	}

	public void setS_email(String s_email) {
		this.s_email = s_email;
	}

	public String getS_zip() {
		return s_zip;
	}

	public void setS_zip(String s_zip) {
		this.s_zip = s_zip;
	}

	public String getS_addr1() {
		return s_addr1;
	}

	public void setS_addr1(String s_addr1) {
		this.s_addr1 = s_addr1;
	}

	public String getS_addr2() {
		return s_addr2;
	}

	public void setS_addr2(String s_addr2) {
		this.s_addr2 = s_addr2;
	}

	public Date getS_reg() {
		return s_reg;
	}

	public void setS_reg(Date s_reg) {
		this.s_reg = s_reg;
	}

	public int getS_acc() {
		return s_acc;
	}

	public void setS_acc(int s_acc) {
		this.s_acc = s_acc;
	}

	public String getS_logo() {
		return s_logo;
	}

	public void setS_logo(String s_logo) {
		this.s_logo = s_logo;
	}

	public String getS_info() {
		return s_info;
	}

	public void setS_info(String s_info) {
		this.s_info = s_info;
	}

} // end class SellerVO
