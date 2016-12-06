package com.online.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class OrderInterceptor extends HandlerInterceptorAdapter{
	private static final String SESSION_ATTR_ID = "ordered";
	private static final Logger logger = LoggerFactory.getLogger(OrderInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("중복 주문 방지 Interceptor,  prehandle 호출");
		
		HttpSession session = request.getSession();
		Object oderedCartNO = session.getAttribute(SESSION_ATTR_ID);
		if (oderedCartNO!= "ordered"){
			logger.info("중복 submit 방지 Interceptor- 주문 성공");
			return true;
		} else {
			logger.info("중복 submit 방지 Interceptor- 이미 주문했음! ");
			return false;
		}
		
	}

}
