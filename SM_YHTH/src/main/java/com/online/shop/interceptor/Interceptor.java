package com.online.shop.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class Interceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("preHandle() 호출...");
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Object bean = handlerMethod.getBean();
		Method method = handlerMethod.getMethod();
		logger.info("bean: "+bean);
		logger.info("method: "+method);
		
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info("postHandle() 호출...");
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Object bean = handlerMethod.getBean();
		Method method = handlerMethod.getMethod();
		logger.info("bean: "+bean);
		logger.info("method: "+method);
		
		// 매개변수 modelAndView에서 Model 객체를 구하고,
		// Model 객체에 "result"라는 이름으로 저장된 속성(attribute) 값을 구함
		String result = (String) modelAndView.getModel().get("result");
		logger.info("result: "+result);
		
		// 인터셉터에서 View에게 데이터를 전달하기 위해서는 
		// 세션(session)에 속성(attribtue)를 추가
		HttpSession session = request.getSession();
		if (result != null){
			session.setAttribute("result", result);
		} else {
			session.setAttribute("result", "데이터 없음!");
		}
		
		super.postHandle(request, response, handler, modelAndView);
	} // end postHandle
	
		@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
				throws Exception {
			logger.info("afterCompletion() 호출..."); 
			super.afterCompletion(request, response, handler, ex);
		} // end afterCompletion
	
} // end class Interceptor
