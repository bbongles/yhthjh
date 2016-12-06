package com.online.shop.controller;

import java.io.IOException;
import java.net.URLDecoder;

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
import com.online.shop.domain.SellerVO;
import com.online.shop.service.BuyerService;
import com.online.shop.service.SellerService;

@Controller // 스프링 프레임워크에 Controller bean 객체로 등록
@RequestMapping(value="/buyer")
public class BuyerController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuyerController.class);
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	BuyerService buyerService;

	@Autowired
	SellerService sellerService;
	
	/* ----------------------------------------------------------------------------------------------------- */
	
	// ### 회원가입 메인
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String mainRegister(Model model){
		
		logger.info("register_buyer 실행");

	// return "sudo_checkout2";
	return "/login/register_buyer";
	}	
	
	/* ----------------------------------------------------------------------------------------------------- */

	// 구매자 login_register 아이디 중복체크 컨트롤러
	@RequestMapping(value="/b_checkid", method=RequestMethod.POST)
	public void b_checkid(@RequestBody String userid, HttpServletResponse response) throws IOException{
		
		logger.info("checkid 실행");
		//logger.info("userid" + userid);
		
		// 필요없는 문자열을 제거
		String b_id = userid.substring(0, userid.length()-1);
		logger.info("b_id : " + b_id);
		
		// DB에서 입력한 문자열 검색
		BuyerVO vo = buyerService.read(b_id);
		
		// DB에 있다면 중복...
		if (vo!=null){
			String selectedID = vo.getB_id();
			logger.info("[ " + selectedID + " ] 는 중복된 아이디 입니다...");
			response.getWriter().print(1);
			
		} else {
			logger.info("사용 가능한 아이디 입니다...^^");
		}
	}	
	

	// 판매자 login_register 아이디 중복체크 컨트롤러
	@RequestMapping(value="/s_checkid", method=RequestMethod.POST)
	public void s_checkid(@RequestBody String userid, HttpServletResponse response) throws IOException{
		
		logger.info("s_checkid 실행");
		// logger.info("userid : " + userid);
		
		// 필요없는 문자열을 제거
		String s_id = userid.substring(0, userid.length()-1);
		
		logger.info("s_id : " + s_id);
		
		// DB에서 입력한 문자열 검색
		SellerVO vo = sellerService.readCheckID(s_id);

		// DB에 있다면 중복...
		if (vo!=null){
			String selectedID = vo.getS_id();
			logger.info("[ " + selectedID + " ] 는 중복된 아이디 입니다...");
			response.getWriter().print(1);
		} else {
			logger.info("사용 가능한 아이디 입니다...^^");
		}
	}	
	/* ----------------------------------------------------------------------------------------------------- */
	
	// 이메일 인증번호 발송
	@RequestMapping(value = "/checkemail", method = RequestMethod.POST)
	public void checkEmail(@RequestBody String email, HttpServletResponse response) throws IOException {
		logger.info("email: " + email);
		
		// @ converted to %40 in HTTPPost request
		String convert_email = URLDecoder.decode(email, "UTF-8"); 
		
		// 필요없는 문자열을 제거
		String b_email = convert_email.substring(0, convert_email.length()-1);
		
		// 4자리 인증번호 생성
		// 1. 0~9999 까지의 난수를 발생시킨 후 1~3자리 수를 없애기위해 1000을 더해준다 (1000~10999)
		// 2. 다섯자리가 넘어가면 1000을 빼준다.			
		int code = (int) (Math.random() * 10000 + 1000); 
		if (code > 10000){
			code = code - 1000;
		}
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(b_email); // 받는 이메일 등록
		
			logger.info("메일 주소 : " + b_email);
		
		message.setSubject("쇼핑몰 인증번호");  // 이메일 제목
		message.setText("본인인증번호는 [ " + code + " ] 입니다. 정확히 입력해주세요");  // 이메일 내용
		
		logger.info("보낸 코드 : " + code);
		mailSender.send(message);  // 이메일 전송
		// model.addAttribute("code", code);
		
		response.getWriter().print(code);
		//return "email_result";
	}
	
	
	/* ----------------------------------------------------------------------------------------------------- */

	// 구매자 가입완료 버튼 클릭
	@RequestMapping(value="/b_register_result", method=RequestMethod.POST)
	public String b_register_result(BuyerVO vo){ // default 객체로 생성하고 name 정보들을  set 한다.
		// login1 폼에서 입력받은 값을 vo 에 넣어서 insert합니다.
		// 아이디가 PK라서 같은 아이디 두번넣으면 에러남.
		buyerService.insert(vo);
		logger.info("구매자 회원가입 성공! ");
		return "login_result"; // TODO: 성공시 메인화면으로 보내야 함.
	}
	
	/* ----------------------------------------------------------------------------------------------------- */

	// 판매자 가입완료 버튼 클릭
	@RequestMapping(value="/s_register_result", method=RequestMethod.POST)
	public String s_register_result(SellerVO vo){
		logger.info("s_register_result 실행");
		// login1 폼에서 입력받은 값을 vo 에 넣어서 insert합니다.
		// 아이디가 PK라서 같은 아이디 두번넣으면 에러남.
		logger.info("판매자 회원가입 버튼 호출 ");
		sellerService.createSeller(vo);
		logger.info("판매자 회원가입 성공! ");
		return "login_result"; // TODO: 성공시 메인화면으로 보내야 함.
	}
	/* ----------------------------------------------------------------------------------------------------- */
	
////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(String b_id, String b_pw, HttpServletRequest request, String query){	
		logger.info("login 컨트롤러 실행");
		logger.info("b_id : "+b_id+" , b_pw : "+b_pw);
		if (buyerService.isValidUser(b_id, b_pw)){
			logger.info("로그인 성공");
			HttpSession session = request.getSession(true);
			session.setAttribute("login_id", b_id);
			logger.info("세션 저장 성공! key:login_id, 값 : "+b_id);
			return "redirect:/index";
		} else {
			logger.info("로그인 실패");
			return "redirect:/register";
		}
	}
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("login_id");
		session.invalidate();	
		logger.info("세션 비우기 성공!");
		return "redirect:/"; // requestMapping에 login으로 다시 돌아감.. 로그인페이지 열림
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////

} // end class
