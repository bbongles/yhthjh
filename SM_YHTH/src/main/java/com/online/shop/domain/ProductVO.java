package com.online.shop.domain;

import java.util.Date;

public class ProductVO {

	// 멤버 변수
	private int p_no;
	private String p_name;
	private int p_price;
	private String p_cate1;
	private String p_cate2;
	private int p_stock;
	private String s_id;
	private int p_dis_rate;
	private Date p_reg;
	private int p_favo;
	private int p_sale_cnt;
	private String p_img;
	
	// 생성자
	public ProductVO() {}

	// getter/setter 메소드
	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_cate1() {
		return p_cate1;
	}

	public void setP_cate1(String p_cate1) {
		this.p_cate1 = p_cate1;
	}

	public String getP_cate2() {
		return p_cate2;
	}

	public void setP_cate2(String p_cate2) {
		this.p_cate2 = p_cate2;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public int getP_dis_rate() {
		return p_dis_rate;
	}

	public void setP_dis_rate(int p_dis_rate) {
		this.p_dis_rate = p_dis_rate;
	}

	public Date getP_reg() {
		return p_reg;
	}

	public void setP_reg(Date p_reg) {
		this.p_reg = p_reg;
	}

	public int getP_favo() {
		return p_favo;
	}

	public void setP_favo(int p_favo) {
		this.p_favo = p_favo;
	}

	public int getP_sale_cnt() {
		return p_sale_cnt;
	}

	public void setP_sale_cnt(int p_sale_cnt) {
		this.p_sale_cnt = p_sale_cnt;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	
} // end class ProductVO
