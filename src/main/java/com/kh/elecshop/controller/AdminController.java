package com.kh.elecshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.elecshop.domain.AdminNoticeDTO;
import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.service.AdminService;
import com.kh.elecshop.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/admin_dashboard")
	public void dashBoard() {
		
	}
	@PostMapping("/notice/register")
	public String noticeRegister() {
		
		return "/admin/registerNotice";
	}
	@PostMapping("/admin_user")
	public void user() {
		
	}
	@PostMapping("/admin_customerCenter")
	public void admin_customerCenter(Model model) {
		List<AdminNoticeDTO> list = noticeService.getAdminNotice();
		model.addAttribute("subNotice", list);
	}
	@PostMapping(value = "/updateCloseState", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean updateCloseState(@RequestParam(value="nnos[]") int[] nnos) {
		boolean result = noticeService.modifyNoticeCloseState(nnos);
		return result;
	}
	@PostMapping(value = "/updateOpenState", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean updateOpenState(@RequestParam(value="nnos[]") int[] nnos) {
		boolean result = noticeService.modifyNoticeOpenState(nnos);
		return result;
	}
	@PostMapping(value = "/deleteNotice", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int deleteNotice(@RequestParam("nnos[]") int[] nnos) {
		int count = noticeService.removeNotice(nnos);
		return count;
	}
	@PostMapping(value="/registerNotice", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean registerNotice(NoticeVO noticeVO) {
		System.out.println("notice" + noticeVO);
		boolean result = noticeService.registerNotice(noticeVO);
		System.out.println(result);
		return result;
	}
	@PostMapping("/searchWord")
	public String seachWord(SearchDTO searchDTO, Model model) {
		List<SubNoticeDTO> list = adminService.getSearchByNotice(searchDTO);
		System.out.println("list" + list);
		model.addAttribute("list", list);
		return "admin/admin_customTable";
	}
}
