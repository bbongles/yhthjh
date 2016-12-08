package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;

public interface SellerDAO {

	// 태훈 코드
	public abstract int insertSeller(SellerVO vo);
	public abstract SellerVO selectCheckID(String s_id);
	public abstract boolean isValidUser(String s_id, String s_pw);
	
	// 용훈 코드
	public abstract List<ProductVO> selectAllProduct();
	public abstract List<ProductVO> selectProductBySid(String s_id);
	public abstract ProductVO selectItemByPno(int p_no);
	public abstract List<OptionVO> selectOpByPno(int p_no);
	public abstract List<ImageVO> selectImgByPno(int p_no);
	public abstract int updateLogo(SellerVO sVo, String s_id);
	public abstract SellerVO selectSellerInfo(String s_id);
	public abstract int updateInfo(SellerVO sVo, String s_id);
	
} // end interface SellerDAO
