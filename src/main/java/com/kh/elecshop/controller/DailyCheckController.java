package com.kh.elecshop.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.elecshop.domain.DailyCheckVO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.service.DailyCheckService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class DailyCheckController {

	@Autowired
	private DailyCheckService dailyCheckService;
	
	
	
	@PostMapping(value = "/dailyCheck",
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean dailyCheck(HttpSession session, RedirectAttributes rttr) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
//		List<DailyCheckVO> list = 
//				dailyCheckService.selectDailyCheck(memberVO.getMid());
//		log.info(list);
		DailyCheckVO vo = dailyCheckService.checkDaily(memberVO.getMid());
		log.info(vo);
		if(vo != null) {
			Date today = new Date();
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM-dd");
			String now = date.format(today);
			String voNow = date2.format(vo.getRegdate());
			if(now.equals(voNow)) {
				rttr.addFlashAttribute("dailyResult", "fail");
				return false;
			}
		}
		dailyCheckService.insertDailyCheck(memberVO.getMid());
		rttr.addFlashAttribute("dailyResult", "success");
		return true;
	}
}
