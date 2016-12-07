package com.online.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.CartVO;
import com.online.shop.service.BuyerService;
import com.online.shop.service.CartService;
import com.online.shop.service.OrderService;
import com.online.shop.service.SellerService;

@Controller
@RequestMapping(value="/cart")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	CartService cartService;
	
	@Autowired
	BuyerService buyerService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	SellerService sellerService;
	
	@RequestMapping(value="insertCart", method=RequestMethod.GET)
	public String insertCart(CartVO vo){
		logger.info("insertCart 컨트롤러 실행");
		cartService.insertCart(vo);
		logger.info("카트 인서트 성공");
		
		return "redirect:selectCart";
	}
	
	@RequestMapping(value="insertCertForDirect", method=RequestMethod.POST)
	public String insertCartForDirect(CartVO vo, Model model){
		logger.info("insertCartDirect 컨트롤러 실행");
		int c_no = cartService.selectMaxCNO();// TODO 안됨;
		// select max(c_no) 
		logger.info("insertDirect 성공"); 
		logger.info("autoIncre"+c_no);
		
		
		///////////////////이 밑에서부터 다시 해야함.../////////////
		
		int totalPriceForOrder = 0; // 리스트 합계금액 저장하는변수
		int shippingCharge = 3000; // 배송비(임의로 정함 나중에 수정 필요)

		// 카트에서 선택된 아이템들을 리스트로 넘김
		List<CartVO> cartList = new ArrayList<>();
			CartVO vod = cartService.readCart(c_no); 
			totalPriceForOrder +=  vod.getBuy_cnt()*vod.getP_price(); // 총계산
			if (vod != null) {
				cartList.add(vod);
			}
		
		
		// 주문자 정보 가져옴 ( 임시로 asdf 아이디로 해놓음, 나중에 세션으로 바꾸기)
		String buyerID = "aaaa";
		BuyerVO voo = buyerService.read(buyerID);
		String registedZipCode = voo.getB_zip();
		String registedAddr1 = voo.getB_addr1();
		String registedAddr2 = voo.getB_addr2();
		
		model.addAttribute("ListForOrder", cartList);
		model.addAttribute("totalCountForOrder", cartList.size());
		model.addAttribute("totalProductPriceForOrder", totalPriceForOrder);
		model.addAttribute("miledTobeAdded", totalPriceForOrder*0.01);
		model.addAttribute("Shipping", shippingCharge);
		model.addAttribute("FinalPriceForOrder", shippingCharge+totalPriceForOrder);
		model.addAttribute("registedZip", registedZipCode);
		model.addAttribute("registedAddr1", registedAddr1);
		model.addAttribute("registedAddr2", registedAddr2);
		model.addAttribute("buyerNAME", voo.getB_name());
		model.addAttribute("buyerHP", voo.getB_phone());
		model.addAttribute("buyerEmail", voo.getB_email());
		model.addAttribute("b_id", voo.getB_id());
		
		
		
		////////////////////////////////
		
		
		return "test_order";
	}
	
	@RequestMapping(value="selectCart", method=RequestMethod.GET)
	public String selectCart(Model model){
		logger.info("selectCart 컨트롤러 실행");
		// TODO: 로그인 세션으로 b_id 줘야함.. 임시로 aaaa해놈
		String b_id="aaaa";
		List<CartVO> list = cartService.read(b_id);
		
		if (list.size()!=0){
			model.addAttribute("cartList", list);
			return "test_cart";	
		} else {
			logger.info("장바구니빔... 예외처리 추가 필요함");
			return "test_emptyCart";
		}
		
		
	}
	
	////////////////////////////////////////////////////////////////
	@RequestMapping(value="selectCart2", method=RequestMethod.GET)
	public String selectCart2(Model model){
		logger.info("selectCart 컨트롤러 실행");
		// TODO: 로그인 세션으로 b_id 줘야함.. 임시로 aaaa해놈
		String b_id="aaaa";
		List<CartVO> list = cartService.read(b_id);
		list.get(0).getBuy_cnt();
		model.addAttribute("cartList", list);
	//	return "test_cart";
		return "sudo_cart2";
	}
	/////////////////////////////////////////////////////////////////

	@RequestMapping(value="deleteCart", method=RequestMethod.POST)
	public void deleteCart(@RequestBody int c_no, HttpServletResponse response) throws IOException{
		logger.info("deleteCart 컨트롤러 실행");
		logger.info("c_no : "+c_no);
		int result = cartService.deleteCart(c_no);
		if (result==1){
			response.getWriter().print(1);
			logger.info("장바구니 삭제 성공");
		} else {
			response.getWriter().print(2);
			logger.info("장바구니 삭제 실패");
		}
	}
	
	@RequestMapping(value="updateCartBuyCnt", method=RequestMethod.GET)
	public void updateCart(int c_no, int buy_cnt, HttpServletResponse response) throws IOException{
		cartService.updateBuyCnt(c_no, buy_cnt);

		logger.info("수량 업데이트 성공");
		CartVO vo = cartService.readCart(c_no);
		int count = vo.getBuy_cnt(); 
		int price = vo.getP_price();
		int totalPricePerItem = count*price;
		logger.info("updated : "+totalPricePerItem);
		response.getWriter().print(totalPricePerItem);
	}
	

	
}
