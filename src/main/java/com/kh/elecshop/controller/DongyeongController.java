package com.kh.elecshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.service.NoticeService;

@Controller
@RequestMapping("/customerCenter")
public class DongyeongController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/FAQ")
	public void FAQ() {
		
	}
	@GetMapping("/notice")
	public void notice(Model model) {
		List<NoticeVO> list = noticeService.selectNotice();
		model.addAttribute("list", list);
		
	}
	@GetMapping("/inquiry")
	public void inquiry() {
		
	}
	@GetMapping("/question")
	public void question() {
		
	}
	@GetMapping("/noticePage")
	public void noticePage() {
		
	}
}
