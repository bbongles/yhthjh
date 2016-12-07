package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.CartVO;
import com.online.shop.domain.ProductVO;

public interface CartDAO {
	// 장바구니 추가
	public abstract int insertCart(CartVO vo);
	// 장바구니 삭제
	public abstract int deleteCart(int c_no);
	// 장바구니 리스트 불러오기
	public abstract List<CartVO> selectAll(String b_id);
	// 수량 업데이트
	public abstract int updateCount(int c_no, int buy_cnt);
	// 주문을 위한 장바구니 불러오기
	public abstract CartVO selectCart(int c_no);
	// 주문번호를 장바구니에 넣기
	public abstract int updateBuyNO(int buy_no, int c_no);
	// 카트 이미지 받아오기
	public abstract ProductVO cartImageByPno(int p_no);
	// Auto Incre 값 얻기
	public abstract int getAutoIncre();
}
