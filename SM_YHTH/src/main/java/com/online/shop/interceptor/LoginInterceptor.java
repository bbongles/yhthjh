package com.online.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.online.shop.domain.BuyerVO;

//login-post 콘트롤러 메소드 실행 전/후에 동작할 인터셉터
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String SESSION_ATTR_ID = "b_login_id";
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	
	// preHandle(): 콘트롤러 메소드 실행 전에 호출되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("prehandle 호출...");
		
		// 세션에 기존 로그인 정보가 남아 있으면 삭제,  그렇지 않으면 그냥 리턴
		// 세션 객체를 얻어옴
		HttpSession session = request.getSession();
		Object id = session.getAttribute( SESSION_ATTR_ID);
		if (id!=null) { // 세션에 기존 정보가 남아 있는 경우
			return true;
		} else { // 세션에 로그인 정보가 없는 경우
			response.sendRedirect("/shop/loginPop");
			response.send
			return false;
		}
		
		// 세션 사용할땐 request
		// redirect 할땐 response
		
		// prehandle() 메소드 리턴값:
		// true = 컨트롤러 메소드가 호출됨
		// false = 컨트롤러 메소드가 호출되지않음
		
		
	}
	
	// 콘트롤러 메소드 수행 후, View가 완성되기 전에 호출되는 메소드
	// -> View(JSP)에 전달할 데이터, 세션 속성 등을 설정할 수 있음
/*	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("postHandle() 호출...");
		// 로그인 정보를 세션에 저장하기 위해서 미리정의
		HttpSession session = request.getSession();
		
		// 콘트롤에서 MemberVO 타입을 전달했기 때문에(DB까지 갔다온 정보임)
		// ModelAndView에서 꺼낸 attribute를 MemberVO로 형변환(casting)
		BuyerVO result = (BuyerVO) modelAndView.getModel().get("login_result"); 
		
		if (result !=null){ // DB에 있는 아이디 패스워드 정보와 일치하는 경우
			logger.info("새로운 로그인 성공");
			// 세션에 로그인 성공, 아이디 저장
			session.setAttribute(SESSION_ATTR_ID, result.getB_id());
			
			// 기존에 요청 주소(Authinterceptor에서 저장)가 있는 경우는 해당 페이지로 이동하게끔 구현
			Object dest = session.getAttribute("dest");
			if (dest != null) {
				response.sendRedirect((String) dest);
			} else {
				// 저장된 요청 주소가 없는 경우에는 홈페이지로 이동
				response.sendRedirect("/shop01/login"); // 메인페이지로 리다이렉트	
			}
			
		} else { // DB에 일치하는 회원 정보가 없는 경우
			// 로그인 실패, 세션에 저장하는 정보는 없음
			response.sendRedirect("/shop01/login");
		}
			
		
	} // end postHandle()
*/}// end class loginInterceptor
