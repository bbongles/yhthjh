package com.online.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

	// 스프링 인터셉터 클래스는 HandlerInterceptorAdapter 클래스를 상속 받음
	public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
		
		// 콘트롤러 메소드 실행 전에 호출되는 메소드
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			logger.info("preHandle() 호출...");
			
			// 세션에 로그인 정보가 있는 지 확인
			HttpSession session = request.getSession();
			Object loginId = session.getAttribute("login_id");
			if (loginId == null) {
				logger.info("로그인 되어 있지 않음.. 콘트롤러 실행 막음.. 로그인페이지로 이동");
				
				// 리다이렉트 하기 전에 처음 요청 주소를 저장,(로그인하고 다시 돌아오기위해)
				saveDestination(request);
				
				// 로그인 페이지로 이동...
				response.sendRedirect("/shop01/login"); 
				return false;
			} else {
				logger.info("로그인 되어있음, 콘트롤러 실행...로그인 아이디.. "+loginId);
				return true;
			}
		}
		
		private void saveDestination(HttpServletRequest req) {
			logger.info("saveDestination() 호출....");
			// 요청 주소
			String uri = req.getRequestURI();
			logger.info("요청 주소: "+uri);
			
			// 쿼리 스트링 정보
			String query = req.getQueryString();
			logger.info("쿼리스트링: "+query);
			
			if (query == null) {
				query = "";
			} else {
				query +="?"+query;
			}
			String dest = uri+query;
			logger.info("요청 주소: "+dest);
			
			// 원래 요청 주소(dest)를 세션에 저장
			req.getSession().setAttribute("dest", dest);
			
		}
		
	} // end AuthInterceptor


