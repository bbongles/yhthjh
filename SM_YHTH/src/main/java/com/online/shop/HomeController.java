package com.online.shop;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.ProductVO;
import com.online.shop.service.SellerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	SellerService sellerService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		List<ProductVO> productList = sellerService.readAllProduct();
		
		int length = productList.size();
		int numOfPage =  length / 4;
		if (length % 4 > 0) {
			numOfPage++; // 나머지가 있으면 올림 	 
			// 뷰페이저로 한 페이지에 4개씩 출력 !
			// ex) (9/4 = 2.X )=> 3페이지 필요
		}
		int remainder = length % 4;
		
		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productList", productList);
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		logger.info("length : " + length);
		logger.info("numOfPage : "+numOfPage);
		logger.info("remainder : "+remainder);
		/*logger.info(productList.get(0).getP_name());*/
		
		//return "home";
		return "UI/sudo_index";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String openRegister(){
		return "/sudo_loginSelect";
	}
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		logger.info("세션 비우기 성공!");
		return "redirect:login"; // requestMapping에 login으로 다시 돌아감.. 로그인페이지 열림
	}
	
} // end class HomeController
