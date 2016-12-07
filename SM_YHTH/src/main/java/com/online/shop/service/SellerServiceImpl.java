package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;
import com.online.shop.persistence.SellerDAO;

@Service // 스프링 프레임워크에 Service 계층 콤포넌트 bean 객체로 등록
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerDAO sellerDao;
	
	@Override
	public List<ProductVO> readProductBySid(String s_id) {
		
		return sellerDao.selectProductBySid(s_id);
	}

	@Override
	public ProductVO readItemByPno(int p_no) {
		
		return sellerDao.selectItemByPno(p_no);
	}

	@Override
	public List<OptionVO> readOpByPno(int p_no) {
		
		return sellerDao.selectOpByPno(p_no);
	}

	@Override
	public List<ImageVO> readImgByPno(int p_no) {
		
		return sellerDao.selectImgByPno(p_no);
	}

	@Override
	public int updateLogo(SellerVO sVo) {
		
		return sellerDao.updateLogo(sVo);
	}

	@Override
	public SellerVO readSellerInfo(String s_id) {
		
		return sellerDao.selectSellerInfo(s_id);
	}

	@Override
	public int updateInfo(SellerVO sVo) {
		
		return sellerDao.updateInfo(sVo);
	}
	
	/////////////////////////////////////////////////////////////////////태훈
	@Override
	public int createSeller(SellerVO vo) {
		return sellerDao.insertSeller(vo);
	}

	@Override
	public SellerVO readCheckID(String s_id) {
		return sellerDao.selectCheckID(s_id);
	}

	@Override
	public boolean isValidUser(String s_id, String s_pw) {
		return sellerDao.isValidUser(s_id, s_pw);
	}

	@Override
	public List<ProductVO> readAllProduct() {		
		return sellerDao.selectAllProduct();
	}

} // end class SellerServiceImpl
