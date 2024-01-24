package com.kh.elecshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/customerCenter")
@Log4j
public class DongyeongController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/FAQ")
	public void FAQ() {
		
	}
	@GetMapping("/notice")
	public void notice(Model model) {
		List<SubNoticeDTO> list = noticeService.getSubNotice();
		model.addAttribute("list", list);
		
	}
	@GetMapping("/noticePage")
	public void noticePage(int nno, Model model) {
		System.out.println("엠엠오" + nno);
		NoticeVO noticeVO = noticeService.getNoticePage(nno);
		System.out.println("22"+noticeVO);
		model.addAttribute("noticePage", noticeVO);
		//return "redirect:/customerCenter/noticePage";
	}
	@GetMapping("/inquiry")
	public void inquiry() {
		
	}
	@GetMapping("/question")
	public void question() {
		
	}
}
