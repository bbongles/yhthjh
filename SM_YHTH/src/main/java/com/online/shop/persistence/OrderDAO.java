package com.online.shop.persistence;

import com.online.shop.domain.OrderVO;

public interface OrderDAO {
	public abstract int insertOder(OrderVO vo);
	public abstract int getBuy_no(String b_id);
}
