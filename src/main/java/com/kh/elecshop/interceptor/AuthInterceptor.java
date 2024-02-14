package com.kh.elecshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.elecshop.domain.MemberVO;

import lombok.extern.log4j.Log4j;
@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		log.info("memberVO: " + memberVO);
		if (memberVO == null) {
			saveTargetLocation(request);
			response.sendRedirect("/login");
			return false;
		}
		return true;
		
	}
	
	private void saveTargetLocation(HttpServletRequest request) {
		String uri = request.getRequestURI();
		log.info("uri:" + uri);
		String query = request.getQueryString();
		log.info("query:" + query);
		String method = request.getMethod();
		log.info("method:" + method);
		if (method.equals("GET")) {
			if (query == null || query.equals("null")) {
				query = "";
			} else {
				query = "?" + query;
			}
		}
		String targetLocation = uri + query;
		request.getSession().setAttribute("targetLocation", targetLocation);
	}
}
