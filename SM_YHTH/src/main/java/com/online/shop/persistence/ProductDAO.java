package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;

public interface ProductDAO {

	public abstract int insertProduct(ProductVO pVo);
	public abstract int selectProductNo(String s_id);
	public abstract int insertOption(OptionVO oVo);
	public abstract int insertImage(ImageVO iVo);
	public abstract int deleteOptionByPno(int p_no);
	public abstract int deleteImageByPno(int p_no);
	public abstract int deleteProductByPno(int p_no);
	
	// 상품 카테고리 검색 추가 by 김태훈
	public abstract List<ProductVO> selectProductCate(String p_cate2);
	
} // end interface ProductDAO
