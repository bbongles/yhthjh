package com.online.shop.domain;

import java.util.Date;

public class OrderVO {
	
	public OrderVO(){}
	
	int buy_no; // 주문번호
	String b_id; // 구매자 아이디
	int p_no; // 상품번호
	String p_name; // 상품이름
	int p_price; // 주문 가격
	int buy_cnt; // 주문 수량
	String o_cont; // 옵션
	Date buy_date; // 주문 일자
	String delivery_zip; // 배송 우편주소
	String delivery_addr1; // 배송 주소
	String delivery_addr2; // 배송 상세주소
	int buy_status; // 주문 상태
	String b_name;
	int b_phone;
	String b_email;
	Date buy_comp;
	
	// 주문
	public OrderVO(int buy_no, String b_id, Date buy_date, String delivery_zip, String delivery_addr1, String delivery_addr2, int buy_status,
			String b_name, int b_phone, String b_email) {
		this.buy_no = buy_no;
		this.b_id = b_id;
		this.buy_date = buy_date;
		this.delivery_zip = delivery_zip;
		this.delivery_addr1 = delivery_addr1;
		this.delivery_addr2 = delivery_addr2;
		this.buy_status = buy_status;
		this.b_name = b_name;
		this.b_phone = b_phone;
		this.b_email = b_email;
	}
	
	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

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

	public int getBuy_cnt() {
		return buy_cnt;
	}

	public void setBuy_cnt(int buy_cnt) {
		this.buy_cnt = buy_cnt;
	}

	public String getO_cont() {
		return o_cont;
	}

	public void setO_cont(String o_cont) {
		this.o_cont = o_cont;
	}

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}

	public String getDelivery_zip() {
		return delivery_zip;
	}

	public void setDelivery_zip(String delivery_zip) {
		this.delivery_zip = delivery_zip;
	}

	public String getDelivery_addr1() {
		return delivery_addr1;
	}

	public void setDelivery_addr1(String delivery_addr1) {
		this.delivery_addr1 = delivery_addr1;
	}

	public String getDelivery_addr2() {
		return delivery_addr2;
	}

	public void setDelivery_addr2(String delivery_addr2) {
		this.delivery_addr2 = delivery_addr2;
	}

	public int getBuy_status() {
		return buy_status;
	}

	public void setBuy_status(int buy_status) {
		this.buy_status = buy_status;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public int getB_phone() {
		return b_phone;
	}

	public void setB_phone(int b_phone) {
		this.b_phone = b_phone;
	}

	public String getB_email() {
		return b_email;
	}

	public void setB_email(String b_email) {
		this.b_email = b_email;
	}

	public Date getBuy_comp() {
		return buy_comp;
	}

	public void setBuy_comp(Date buy_comp) {
		this.buy_comp = buy_comp;
	}
	
	
	
	
	
	
	

}
