package com.kh.elecshop.interceptor;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.elecshop.service.VisitCountService;

import lombok.extern.log4j.Log4j;

@Log4j
public class VisitInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private VisitCountService visitCountService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Cookie[] test = request.getCookies();
		
		boolean isVisit = true;
		if(test!=null){
	        for (Cookie c : test) {
	            String name = c.getName(); // 쿠키 이름 가져오기
	            String value = c.getValue(); // 쿠키 값 가져오기
	            if(name.equals("visit") && value.equals("visit")) {
	            	isVisit = false;
	            }
	        }
	    }
//		log.info("isVisit: " + isVisit);
		if(isVisit) {
			Cookie cookie = new Cookie("visit", "visit");
			cookie.setMaxAge(60 * 60 * 24);
			response.addCookie(cookie);
			
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String today = dateFormat.format(date);
			visitCountService.isDateExist(today);
			visitCountService.increasedCount(today);
		}
	}

}
