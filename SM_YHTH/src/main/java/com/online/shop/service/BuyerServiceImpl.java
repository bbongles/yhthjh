package com.online.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.BuyerVO;
import com.online.shop.persistence.BuyerDAO;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	@Autowired // 스프링 프레임워크에서 관리하는 DAO 빈 객체를 주입
	private BuyerDAO dao;
	
	@Override
	public int insert(BuyerVO vo) {
		return dao.insert(vo);
	}
	
	@Override
	public BuyerVO read(String b_id) {
		return dao.select(b_id);
	}
	
	@Override
	public boolean isValidUser(String b_id, String b_pw) {
		return dao.isValidUser(b_id, b_pw);
	}
}
