package com.online.shop.domain;

import java.util.Date;

public class QnaVO {
	private int qna_no; // q/a 질문 게시글 번호
	private String b_id; // 구매자 아이디
	private int qna_type; // q/a 질문유형 0 상품, 1 배송, 2 반품/취소, 3 교환/변경, 4 기타
	private String qna_cont; // q/a 내용
	private Date qna_reg; // q/a 등록 시간
	private int p_no; // 제품 번호
	private int qna_reply; //답변 여부
	private String b_email; //구매자 이메일
	
	
	public QnaVO() {}


	public int getQna_no() {
		return qna_no;
	}


	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}


	public String getB_id() {
		return b_id;
	}


	public void setB_id(String b_id) {
		this.b_id = b_id;
	}


	public int getQna_type() {
		return qna_type;
	}


	public void setQna_type(int qna_type) {
		this.qna_type = qna_type;
	}


	public String getQna_cont() {
		return qna_cont;
	}


	public void setQna_cont(String qna_cont) {
		this.qna_cont = qna_cont;
	}


	public Date getQna_reg() {
		return qna_reg;
	}


	public void setQna_reg(Date qna_reg) {
		this.qna_reg = qna_reg;
	}


	public int getP_no() {
		return p_no;
	}


	public void setP_no(int p_no) {
		this.p_no = p_no;
	}


	public int getQna_reply() {
		return qna_reply;
	}


	public void setQna_reply(int qna_reply) {
		this.qna_reply = qna_reply;
	}


	public String getB_email() {
		return b_email;
	}


	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	
	
}
