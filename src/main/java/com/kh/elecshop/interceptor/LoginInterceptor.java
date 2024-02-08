package com.kh.elecshop.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.elecshop.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override // 컨트롤러 진입 전
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
	
	@Override // 컨트롤러 진입 후 뷰 들어가기 전
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("postHandle");
		ModelMap map = (ModelMap)modelAndView.getModel();
		MemberVO memberVO = (MemberVO)map.get("loginInfo");
		log.info(memberVO);
		modelAndView.setView(null);
		FlashMap flashMap = new FlashMap();
		if(memberVO == null) {
			flashMap.put("loginResult", "fail");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			modelAndView.setViewName("redirect:/login");
			return;
		}
		if (memberVO.getMstate() == 0) {
			flashMap.put("loginResult", "disabled");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			modelAndView.setViewName("redirect:/login");
		}else {
			Boolean useCookie = (boolean)map.get("useCookie");
			HttpSession session = request.getSession();
			String targetLocation = (String)session.getAttribute("targetLocation");
			log.info("targetLocation:" + targetLocation);
			session.removeAttribute("targetLocation");
			if (targetLocation == null) {
				modelAndView.setViewName("redirect:/");
			} else {
				modelAndView.setViewName("redirect:" + targetLocation);
			}
//			쿠키 설정
			if(useCookie != null && useCookie == true) {
				Cookie cookie = new Cookie("savedId", memberVO.getMid());
				cookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(cookie);
			}
			session.setAttribute("loginInfo", memberVO);
			modelAndView.setViewName("redirect:/main");
		}
		
	}
}
