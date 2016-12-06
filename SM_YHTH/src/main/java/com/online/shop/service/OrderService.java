package com.online.shop.service;

import com.online.shop.domain.OrderVO;

public interface OrderService {
	public abstract int insertOrder(OrderVO vo);
	public abstract int getBuyNo(String b_id);
}
