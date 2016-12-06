package com.online.shop.persistence;

import com.online.shop.domain.BuyerVO;

public interface BuyerDAO {
	// 회원 가입
	public abstract int insert(BuyerVO vo);
	// 중복 아이디 체크
	public abstract BuyerVO select(String b_id);
	// 로그인
	public abstract boolean isValidUser(String b_id, String b_pw);
	
}
