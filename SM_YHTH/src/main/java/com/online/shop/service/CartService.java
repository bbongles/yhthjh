package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.CartVO;
import com.online.shop.domain.ProductVO;

public interface CartService {
	public abstract int insertCart(CartVO vo);
	public abstract int deleteCart(int c_no);
	public abstract List<CartVO> read(String b_id);
	public abstract int updateBuyCnt(int c_no, int buy_cnt);
	public abstract CartVO readCart(int c_no);
	public abstract int updateBuyNo(int buy_no, int c_no);
	public abstract ProductVO cartImageByPno(int p_no);
}
