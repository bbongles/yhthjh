package com.online.shop.domain;

import java.util.Date;

public class QnaRVO {
	private int qna_r_no; //q/a r 게시판 번호
	private String s_id; // 판매자 아이디
	private String qna_r_cont; // q/a r 내용
	private Date qna_r_reg; // q/a r 등록시간
	private int qna_no; // q/a 질문 게시글 번호
	private int qna_reply; //답변 여부
	private int p_no;

	public QnaRVO() {}

	public int getQna_r_no() {
		return qna_r_no;
	}

	public void setQna_r_no(int qna_r_no) {
		this.qna_r_no = qna_r_no;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getQna_r_cont() {
		return qna_r_cont;
	}

	public void setQna_r_cont(String qna_r_cont) {
		this.qna_r_cont = qna_r_cont;
	}

	public Date getQna_r_reg() {
		return qna_r_reg;
	}

	public void setQna_r_reg(Date qna_r_reg) {
		this.qna_r_reg = qna_r_reg;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public int getQna_reply() {
		return qna_reply;
	}

	public void setQna_reply(int qna_reply) {
		this.qna_reply = qna_reply;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	
	

}
