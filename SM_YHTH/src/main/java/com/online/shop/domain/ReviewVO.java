package com.online.shop.domain;

import java.util.Date;

public class ReviewVO {

	private int rev_no;
	private String b_id;
	private int rev_score;
	private String rev_cont;
	private Date rev_reg;
	private int p_no;
	private int rev_reply;
	
	public ReviewVO() {}

	public int getRev_reply() {
		return rev_reply;
	}

	public void setRev_reply(int rev_reply) {
		this.rev_reply = rev_reply;
	}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	
	
	public int getRev_score() {
		return rev_score;
	}

	public void setRev_score(int rev_score) {
		this.rev_score = rev_score;
	}

	public String getRev_cont() {
		return rev_cont;
	}

	public void setRev_cont(String rev_cont) {
		this.rev_cont = rev_cont;
	}

	public Date getRev_reg() {
		return rev_reg;
	}

	public void setRev_reg(Date rev_reg) {
		this.rev_reg = rev_reg;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	
	
}
