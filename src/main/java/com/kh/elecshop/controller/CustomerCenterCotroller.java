package com.kh.elecshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void FAQ(Model model) {
		List<SubNoticeDTO> list = noticeService.getSubNotice();
		model.addAttribute("subNotice", list);
		
		
	}
	@GetMapping("/notice")
	public void notice(Model model) {
		List<SubNoticeDTO> list = noticeService.getSubNotice();
		model.addAttribute("list", list);
		
	}
	@GetMapping("/noticePage")
	public void noticePage(int nno, Model model) {
		NoticeVO noticeVO = noticeService.getNoticePage(nno);
		model.addAttribute("noticePage", noticeVO);
	}
	@GetMapping("/inquiry")
	public void inquiry() {
		
	}
	@GetMapping("/question")
	public void question(Model model) {
		List<QuestionVO> list = questionService.getQuestionList();
		model.addAttribute("questionList", list);
	}
}
