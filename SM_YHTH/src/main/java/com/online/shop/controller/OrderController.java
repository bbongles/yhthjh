package com.online.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.CartVO;
import com.online.shop.domain.OrderVO;
import com.online.shop.service.BuyerService;
import com.online.shop.service.CartService;
import com.online.shop.service.OrderService;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	BuyerService buyerService;
	
	// 체크박스로 모든 아이템들 주문할때
	@RequestMapping(value="cartTossOrder", method=RequestMethod.POST)
	public String tossToOrder(String c_no, Model model, HttpServletRequest request) throws IOException{
		int totalPriceForOrder = 0; // 리스트 합계금액 저장하는변수
		int shippingCharge = 3000; // 배송비(임의로 정함 나중에 수정 필요)
		logger.info("분리될 C_NO들 : "+c_no);
		String[] listCNO = c_no.split(",");
		for (String x : listCNO){
			logger.info("분리된 값 : "+x);
		}
		// 카트에서 선택된 아이템들을 리스트로 넘김
		List<CartVO> cartList = new ArrayList<>();
		for (int i = 0; i<listCNO.length; i++){
			CartVO vo = cartService.readCart(Integer.parseInt(listCNO[i])); // 인트로변환
			totalPriceForOrder +=  vo.getBuy_cnt()*vo.getP_price(); // 총계산
			if (vo != null) {
				cartList.add(vo);
			}
		} 
		
		// 주문자 정보 가져옴 ( 임시로 asdf 아이디로 해놓음, 나중에 세션으로 바꾸기)
		HttpSession session = request.getSession();
		Object id = session.getAttribute("b_login_id");
		String buyerID = (String) id;
		BuyerVO vo = buyerService.read(buyerID);
		String registedZipCode = vo.getB_zip();
		String registedAddr1 = vo.getB_addr1();
		String registedAddr2 = vo.getB_addr2();
		
		model.addAttribute("ListForOrder", cartList);
		model.addAttribute("totalCountForOrder", cartList.size());
		model.addAttribute("totalProductPriceForOrder", totalPriceForOrder);
		model.addAttribute("miledTobeAdded", totalPriceForOrder*0.01);
		model.addAttribute("Shipping", shippingCharge);
		model.addAttribute("FinalPriceForOrder", shippingCharge+totalPriceForOrder);
		model.addAttribute("registedZip", registedZipCode);
		model.addAttribute("registedAddr1", registedAddr1);
		model.addAttribute("registedAddr2", registedAddr2);
		model.addAttribute("buyerNAME", vo.getB_name());
		model.addAttribute("buyerHP", vo.getB_phone());
		model.addAttribute("buyerEmail", vo.getB_email());
		model.addAttribute("b_id", vo.getB_id());
		return "test_order";	
	}
	
	// 체크박스 상관없이 아이템 하나 주문할때
	@RequestMapping(value="OneCartTossOrder", method=RequestMethod.POST)
	public String OneTossToOrder(int c_no, Model model, HttpServletRequest request) throws IOException{
		int totalPriceForOrder = 0; // 리스트 합계금액 저장하는변수
		int shippingCharge = 3000; // 배송비(임의로 정함 나중에 수정 필요)

		// 카트에서 선택된 아이템들을 리스트로 넘김
		List<CartVO> cartList = new ArrayList<>();

			CartVO vo = cartService.readCart(c_no); 
			totalPriceForOrder +=  vo.getBuy_cnt()*vo.getP_price(); // 총계산
			if (vo != null) {
				cartList.add(vo);
			}
		
		
		// 주문자 정보 가져옴 ( 임시로 asdf 아이디로 해놓음, 나중에 세션으로 바꾸기)
			HttpSession session = request.getSession();
			Object id = session.getAttribute("b_login_id");
		String buyerID =(String) id;
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
		return "test_order";	
	}
	
	@RequestMapping(value="readyForBill", method=RequestMethod.POST)
	public String openBill(String c_no, Model model, OrderVO vo, HttpServletRequest request) throws IOException{
	int buyNO = 0;
	// 뒤로가기 버튼 누르고 다시 submit 해서 중복 주문 방지하는거 방지용 session
	// 참고 - OrderInterceptor 클래스
	
	logger.info("주문 받은 c_no (여러개일수있음) : " +c_no);
		// 주문번호를 생성하기위해 OrderVO객체를 s_tbl_order 테이블에 넣음
		int result = orderService.insertOrder(vo);
		logger.info("Order 테이블에 insert 성공!");
		if (result == 1){ // 성공하면
			// (로그인했다고 가정한)사용자의 아이디를 이용해서 s_tbl_order 테이블에서 생성된 buyNO를 얻음
			buyNO = orderService.getBuyNo(vo.getB_id());
			logger.info("Order 테이블에서 buyNO 불러오기 성공! 불러온 주문번호(buy_no) : "+buyNO );
			if (buyNO>=0){ // 성공하면
				String[] listCNO = c_no.split(","); // 주문정보에서 얻은 c_no배열을 쪼개고 배열화
				for (int i=0; i<listCNO.length; i++){ // 배열의 길이만큼
					cartService.updateBuyNo(buyNO, Integer.parseInt(listCNO[i])); // 장바구니에 주문번호를넣음
					logger.info("Cart 테이블에 buy_no 업데이트 성공!");
				}
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("ordered", "ordered");
		logger.info("주문 성공!, 주문번호 : "+buyNO );
		model.addAttribute("buyNO", buyNO);
		return "test_order_complete";
	}
	
	// 중복 주문 검사
	@RequestMapping(value="test_bill", method=RequestMethod.GET)
	public String billPop(HttpServletRequest request) {
		// 이중 submit 방지용 세션
		HttpSession session = request.getSession();
		Object id = session.getAttribute("ordered");
		logger.info("세션 "+id);
		if (id=="ordered"){
			// 세션이 ordered면
			return "test_xbill"; // 이미 주문됨.
		} else {
			// 세션이 ordered가 아니면 
			return "test_bill";  // 주문성공
		}
	}
	


}
