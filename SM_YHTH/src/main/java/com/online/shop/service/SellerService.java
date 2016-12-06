package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;

// CRUD: Create, Read, Update, Delete
public interface SellerService {

	// 태훈
	public abstract int createSeller(SellerVO vo);
	public abstract SellerVO readCheckID(String s_id);
	public abstract boolean isValidUser(String s_id, String s_pw);
	
	// 용훈
	// 전체 상품 정보 검색
	public abstract List<ProductVO> readAllProduct();
	// 해당 상품 번호로 상세 페이지 리턴
	public abstract ProductVO readItemByPno(int p_no);
	// 해당 상품명과 판매자명으로 상세 페이지에 옵션 객체 리턴
	public abstract List<OptionVO> readOpByPno(int p_no);
	// 해당 상품명과 판매자명으로 상세 페이지에 이미지 객체 리턴
	public abstract List<ImageVO> readImgByPno(int p_no);
	// 판매자의 로고 이미지를 추가하는 기능
	public abstract int updateLogo(SellerVO sVo);
	// 판매자 아이디에 의한 판매자 정보 호출
	public abstract SellerVO readSellerInfo(String s_id);
	// 판매자의 정보를 추가하는 기능
	public abstract int updateInfo(SellerVO sVo);
	
} // end interface SellerService
