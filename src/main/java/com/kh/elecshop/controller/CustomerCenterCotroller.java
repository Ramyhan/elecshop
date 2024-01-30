package com.kh.elecshop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.QuestionVO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.service.NoticeService;
import com.kh.elecshop.service.QuestionService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/customerCenter")
@Log4j
public class CustomerCenterCotroller {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private QuestionService questionService;
	
	@GetMapping("/FAQ")
	public void FAQ(Model model, HttpSession session) {
		List<SubNoticeDTO>top5Notice = noticeService.getNoticeTop5();
		List<QuestionVO> top5Question = questionService.getQuestionTop5();
		model.addAttribute("top5Notice", top5Notice);
		model.addAttribute("top5Question", top5Question);
		
	}
	@GetMapping("/notice")
	public void notice(Model model) {
		List<SubNoticeDTO> list = noticeService.getSubNotice();
		model.addAttribute("list", list);
		
	}
	@GetMapping("/noticePage")
	public void noticePage(int nno, Model model) {
		Map<String, Object> map = noticeService.getNoticePage(nno);
		System.out.println("2424" + map);
		model.addAttribute("mapPage", map);
	}
	@GetMapping("/inquiry")
	public void inquiry(HttpSession session, Model model) {
		MemberVO loginInfo = (MemberVO) session.getAttribute("loginInfo");
		model.addAttribute("loginInfo", loginInfo);
	}
	@GetMapping("/question")
	public void question(Model model) {
		List<QuestionVO> list = questionService.getQuestionList();
		model.addAttribute("questionList", list);
	}
}
