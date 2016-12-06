package com.online.shop.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.BuyerVO;

@Repository
public class BuyerDAOImpl implements BuyerDAO{
	
	private static final String NAMESPACE = "com.online.shop.BuyerMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입
	@Override
	public int insert(BuyerVO vo) {
		int result =  sqlSession.insert(NAMESPACE+".buyer-insert", vo);
		return result;
	}
	
	// 회원가입 ID 중복검사 AJAX에 쓰임
	@Override
	public BuyerVO select(String b_id) {
		BuyerVO vo =sqlSession.selectOne(NAMESPACE+".select-by-b_id", b_id);
		return vo;
	}
	
	// 로그인
	@Override
	public boolean isValidUser(String b_id, String b_pw) {
		Map<String, String> map = new HashMap<>();
		map.put("b_id", b_id);
		map.put("b_pw", b_pw);
		int result = sqlSession.selectOne(NAMESPACE+".buyer-login", map);
		if (result == 1) {
			return true;
		} else{
			return false;
		}
	}
}
