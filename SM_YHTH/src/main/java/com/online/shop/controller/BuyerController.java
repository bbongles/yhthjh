package com.online.shop.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.QnaVO;
import com.online.shop.domain.ReviewRVO;
import com.online.shop.domain.ReviewVO;
import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;
import com.online.shop.persistence.QnADAO;
import com.online.shop.persistence.RevDAO;
import com.online.shop.service.BuyerService;
import com.online.shop.service.ProductService;
import com.online.shop.service.SellerService;

@Controller // 스프링 프레임워크에 Controller bean 객체로 등록
@RequestMapping(value="/buyer")
public class BuyerController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuyerController.class);
	
	@Autowired 
	ProductService productService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	BuyerService buyerService;

	@Autowired
	SellerService sellerService;
	
	@Autowired
	private QnADAO dao;
	
	@Autowired
	private RevDAO daoR;
	

	
////////////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value="pDetail", method=RequestMethod.GET)
	public void productDetail(int p_no, String s_id, String p_name, Integer page, QnaVO vo, Model model) {
		// 상품 번호에 의한 각 상품의 전체 정보 받아오기
		ProductVO pVo = sellerService.readItemByPno(p_no);
		// 전체 정보를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productVO", pVo);
		
		// 옵션 정보를 받아오기
		List<OptionVO> optionList = sellerService.readOpByPno(p_no);
		// 받아온 옵션 정보를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("optionList", optionList);
		
		// 이미지 정보를 받아오기
		List<ImageVO> imageList = sellerService.readImgByPno(p_no);
		// 받아온 이미지 정보를  Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("imageList", imageList);
		
		// 판매자 정보 받아오기
		s_id = "seller1";
		SellerVO sVo = sellerService.readSellerInfo(s_id);
		// 판매자 정보를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("sVo", sVo);
		
		//System.out.println("qnrController");
				// 페이지 criteria 생성자 만들기
				PageCriteria c = new PageCriteria();
				if (page != null){
					c.setPage(page);
				}
				
				List<QnaVO> list = dao.selectQna(p_no);

				List<QnaRVO> listR = new ArrayList<>();
				for(QnaVO volist : list) {
					if(volist.getQna_reply() == 1) {
					QnaRVO rvo = dao.selectQnaR(volist);
					listR.add(rvo);
					}
				}
				
				List<ReviewVO>list1 = daoR.selectRev(p_no);
				List<ReviewRVO> list2 = new ArrayList<>();
				for(ReviewVO volist : list1) {
					if(volist.getRev_reply() == 1) {
					ReviewRVO vo1 = daoR.selectRevReply(volist.getRev_no());
					list2.add(vo1);
					
					}
				}
				
				model.addAttribute("listQnA", list);
				model.addAttribute("listQnAR", listR);
						
				model.addAttribute("listRev", list1);
				model.addAttribute("listReply", list2);
				
				// 페이지 메이커 생성
				PageMaker maker = new PageMaker();
				maker.setCrieria(c);
				maker.setTotalCount(dao.getNumOfRecordsQna());
				maker.setPageData();
				model.addAttribute("pageMaker", maker);
				
				// 카테고리 검색해서 연관상품 보여주기
				List<ProductVO> relativelist = productService.selectCate2(pVo.getP_cate2());
				model.addAttribute("relativeList", relativelist);
		
	} // end productDetail() -> 판매자 홈에서 상품 번호를 참조해 상품 상세 페이지로 넘겨주는 역할 
	
	///////////////////////////////////////////////////////////////////////////////////////////////////// 판매자홈
	
	@RequestMapping(value="/pList", method=RequestMethod.GET) // 맵핑 판매자 홈으로 바꾸고 나중에 쿼리 스트링 넘겨서 각각의 판매자 홈으로 넘어가게 해줘야함
	public void sellerHome(Model model, String s_id, HttpServletRequest request) {
		
		SellerVO sellerInfo = sellerService.readSellerInfo(s_id);
		
		// 전체 상품 리스트
		List<ProductVO> productList = sellerService.readProductBySid(s_id);
		logger.info("productList size: " + productList.size());
		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productList", productList);

		// 판매자 정보를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("sellerInfo", sellerInfo);
		
		
	} // end sellerHome() -> 판매자 홈에서 상품 리스트를 보여주는 역할
	
} // end class
