package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;

// CRUD: Create, Read, Update, Delete
public interface ProductService {

	// 새 상품 등록
	// 상품 정보 등록 기능
	public abstract int createProduct(ProductVO pVo);
	// 상품 번호 추출 기능
	public abstract int readProductNo(String s_id);
	// 옵션 정보 등록 기능
	public abstract int createOption(OptionVO oVo);
	// 이미지 정보 등록 기능
	public abstract int createImage(ImageVO iVo);
	// 상품 정보 삭제 기능
	public abstract int deleteOptionByPno(int p_no);
	public abstract int deleteImageByPno(int p_no);
	public abstract int deleteProductByPno(int p_no);
	
} // end interface ProductService
