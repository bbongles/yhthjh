package com.online.shop.domain;

public class OptionVO {

	// 멤버 변수
	private int o_no;
	private String o_title;
	private String o_cont;
	private int o_stock;
	private String p_name;
	private String s_id;
	private int p_no;
	
	// 생성자
	public OptionVO() {}

	// getter/setter 메소드
	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public String getO_title() {
		return o_title;
	}

	public void setO_title(String o_title) {
		this.o_title = o_title;
	}

	public String getO_cont() {
		return o_cont;
	}

	public void setO_cont(String o_cont) {
		this.o_cont = o_cont;
	}

	public int getO_stock() {
		return o_stock;
	}

	public void setO_stock(int o_stock) {
		this.o_stock = o_stock;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	
} // end class OptionVO
