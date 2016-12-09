package com.online.shop.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;

@Repository // 스프링에서 persistence Layer(DAO) 콤포넌트 빈 객체로 관리
public class SellerDAOImpl implements SellerDAO {

	private static final String NAMESPACE = 
			"com.online.shop.SellerMapper";
	
	private static final Logger logger = 
			LoggerFactory.getLogger(SellerDAOImpl.class);
	
	// MyBatis 프레임워크를 사용하기 위해서 SqlSession 객체를 주입 받음
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVO> selectProductBySid(String s_id) {
		List<ProductVO> productList = sqlSession.selectList(NAMESPACE + ".selectProductBySid", s_id);
		
		logger.info("selectProductBySid() 호출: product size = " + productList.size());
		
		return productList;
	}

	@Override
	public ProductVO selectItemByPno(int p_no) {
		logger.info("selectItemByPno() 호출: p_no = " + p_no);
		
		ProductVO pVo = sqlSession.selectOne(NAMESPACE + ".selectItemByPno", p_no);
		
		return pVo;
	}

	@Override
	public List<OptionVO> selectOpByPno(int p_no) {
		logger.info("selectOpByPno() 호출: p_no = " + p_no);
		
		List<OptionVO> optionList = sqlSession.selectList(NAMESPACE + ".selectOpByPno", p_no);
		
		return optionList;
	}

	@Override
	public List<ImageVO> selectImgByPno(int p_no) {
		logger.info("selectImgByPno() 호출: p_no = " + p_no);
		
		List<ImageVO> imageList = sqlSession.selectList(NAMESPACE + ".selectImgByPno", p_no);
		
		return imageList;
	}

	@Override
	public int updateLogo(SellerVO sVo, String s_id) {
		logger.info("updateLogo() 호출: s_id = " + s_id);
		logger.info("updateLogo() 호출: s_logo = " + sVo.getS_logo());
		
		Map<String, Object> map = new HashMap<>();
		map.put("s_id", s_id);
		map.put("s_logo", sVo.getS_logo());
		
		return sqlSession.update(NAMESPACE + ".updateLogo", map);
	}

	@Override
	public SellerVO selectSellerInfo(String s_id) {
		logger.info("selectSellerInfo() 호출: s_id = " + s_id); 
		
		SellerVO sellerInfo = sqlSession.selectOne(NAMESPACE + ".selectSellerInfo", s_id);
		
		return sellerInfo;
	}

	@Override
	public int updateInfo(SellerVO sVo, String s_id) {
		logger.info("updateInfo() 호출: s_id = " + s_id);
		Map<String, Object> map = new HashMap<>();
		map.put("s_id", s_id);
		map.put("s_info", sVo.getS_info());
		return sqlSession.update(NAMESPACE + ".updateInfo", map);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////태훈
	// 회원가입 등록
		@Override
		public int insertSeller(SellerVO vo) {
			int result = sqlSession.insert(NAMESPACE + ".seller-insert", vo);
			return result;
		}
		/* ----------------------------------------------------------------------------------------------------- */
		// 회원가입 ID 중복검사 AJAX에 쓰임
		@Override
		public SellerVO selectCheckID(String s_id) {
			SellerVO vo = sqlSession.selectOne(NAMESPACE + ".select-by-s_id", s_id);
			return vo;
		}
		/* ----------------------------------------------------------------------------------------------------- */
		// 로그인 ??
		@Override
		public boolean isValidUser(String s_id, String s_pw) {
			Map<String, String> map = new HashMap<>();
			map.put("s_id", s_id);
			map.put("s_pw", s_pw);
			int result = sqlSession.selectOne(NAMESPACE + ".seller-login", map);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		}

		@Override
		public List<ProductVO> selectAllProduct() {
			List<ProductVO> productList = sqlSession.selectList(NAMESPACE + ".selectAllProduct");
			
			logger.info("selectAllProduct() 호출: product size = " + productList.size());
			
			return productList;
		}
} // end class SellerDAOImpl
