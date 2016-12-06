package com.online.shop.domain;

import java.util.Date;

public class ReviewRVO {

	private int rev_r_no; // 답글 입력시 생성되는 PK
	private String s_id; // 판매자 아이디 없어도될듯..
	private String rev_r_cont; // 판매자 답글 내용
	private Date rev_r_reg; // 저장 시간
	private int rev_no; // 후기 게시판 번호
	private int rev_reply; // 답변여부
	private int p_no;
	
	public ReviewRVO() {}

	public int getRev_r_no() {
		return rev_r_no;
	}

	public void setRev_r_no(int rev_r_no) {
		this.rev_r_no = rev_r_no;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getRev_r_cont() {
		return rev_r_cont;
	}

	public void setRev_r_cont(String rev_r_cont) {
		this.rev_r_cont = rev_r_cont;
	}

	public Date getRev_r_reg() {
		return rev_r_reg;
	}

	public void setRev_r_reg(Date rev_r_reg) {
		this.rev_r_reg = rev_r_reg;
	}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public int getRev_reply() {
		return rev_reply;
	}

	public void setRev_reply(int rev_reply) {
		this.rev_reply = rev_reply;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	
}

