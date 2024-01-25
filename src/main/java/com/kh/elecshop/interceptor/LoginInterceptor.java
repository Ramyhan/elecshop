package com.kh.elecshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.elecshop.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		if(memberVO == null) {
			session.removeAttribute("loginInfo");
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("postHandle");
		ModelMap map = (ModelMap)modelAndView.getModel();
		MemberVO memberVO = (MemberVO)map.get("loginInfo");
		log.info(memberVO);
		modelAndView.setView(null);
		if (memberVO == null) {
			modelAndView.setViewName("redirect:/login");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("loginInfo", memberVO);
			modelAndView.setViewName("redirect:/main");
		}
		
	}
}
