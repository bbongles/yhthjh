package com.online.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.OrderVO;
import com.online.shop.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderDAO dao;
	
	@Override
	public int insertOrder(OrderVO vo) {
		return dao.insertOder(vo);
	}
	@Override
	public int getBuyNo(String b_id) {
		return dao.getBuy_no(b_id);
	}
	
}
