package com.online.shop.domain;

public class CartVO {
	int c_no; // 장바구니 번호
	int p_no; // 상품코드
	int p_price; // 구매 가격
	int buy_cnt; // 구매수량
	int buy_no; // 주문번호
	String b_id; // 구매자 아이디
	String p_name; // 상품이름
	String o_cont; // 옵션 콘텐츠
	String p_img; // 카트 대표 이미지
	String s_id;
	
	public CartVO(){}
	
	public CartVO(int c_no, int p_no, int p_price, int buy_cnt, int buy_no, String b_id, String p_name, String o_cont) {
		this.c_no = c_no;
		this.p_no = p_no;
		this.p_price = p_price;
		this.buy_cnt = buy_cnt;
		this.buy_no = buy_no;
		this.b_id = b_id;
		this.p_name = p_name;
		this.o_cont = o_cont;
/*		this.s_id = s_id;*/
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
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

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getO_cont() {
		return o_cont;
	}

	public void setO_cont(String o_cont) {
		this.o_cont = o_cont;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	
    public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	
	
	
	
}
