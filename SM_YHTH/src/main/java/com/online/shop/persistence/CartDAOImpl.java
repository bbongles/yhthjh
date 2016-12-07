package com.online.shop.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.CartVO;
import com.online.shop.domain.ProductVO;

@Repository
public class CartDAOImpl implements CartDAO {
	private static final String NAMESPACE = "com.online.shop.CartMapper";
	
	@Autowired
	private SqlSession sqlSession;
	/* ----------------------------------------------------------------------------------------------------- */
	// 장바구니 추가
	@Override
	public int insertCart(CartVO vo) {
		return sqlSession.insert(NAMESPACE+".cart-insert", vo); 
	}
	/* ----------------------------------------------------------------------------------------------------- */
	@Override
	public int deleteCart(int c_no) {
		return sqlSession.delete(NAMESPACE+".cart-delete", c_no);
	}
	/* ----------------------------------------------------------------------------------------------------- */
	@Override
	public List<CartVO> selectAll(String b_id) {
		return sqlSession.selectList(NAMESPACE+".cart-select-by-b_id", b_id);
	}
	/* ----------------------------------------------------------------------------------------------------- */
	@Override
	public int updateCount(int c_no, int buy_cnt) {
		Map<String, Integer> map = new HashMap<>();
		map.put("c_no", c_no);
		map.put("buy_cnt", buy_cnt);
		return sqlSession.update(NAMESPACE+".cart-update-buy_cnt", map);
	}
	/* ----------------------------------------------------------------------------------------------------- */
	@Override
	public CartVO selectCart(int c_no) {
		return sqlSession.selectOne(NAMESPACE+".cart-select-by-c_no", c_no);
	}
	/* ----------------------------------------------------------------------------------------------------- */
	@Override
	public int updateBuyNO(int buy_no, int c_no) {
		Map<String, Integer> map = new HashMap<>();
		map.put("buy_no", buy_no);
		map.put("c_no", c_no);
		return sqlSession.update(NAMESPACE+".cart-update-buy_no", map);
	}
	@Override
	public ProductVO cartImageByPno(int p_no) {
		
		return sqlSession.selectOne(NAMESPACE + ".cartImageByPno", p_no);
	}
	
	@Override
	public int selectMaxCNoForDirectOrder() {
		return sqlSession.selectOne(NAMESPACE+".get-c_no");
	}

}
