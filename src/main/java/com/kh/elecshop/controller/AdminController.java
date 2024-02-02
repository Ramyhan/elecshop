package com.kh.elecshop.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.elecshop.domain.AdminNoticeDTO;
import com.kh.elecshop.domain.AdminProductDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.PageDTO;
import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.service.AdminService;
import com.kh.elecshop.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/admin_dashboard")
	public void dashBoard() {
		
	}
	@GetMapping("/notice/register")
	public String noticeRegister() {
		
		return "/admin/registerNotice";
	}
	@GetMapping("/admin_product")
	public void product(Model model, Criteria criteria) {
		Map<String, Object> map = adminService.getProductList(criteria);
		System.out.println(map);
		model.addAttribute("productMap", map);
	}
	
	@GetMapping("/admin_user")
	public void user(Model model, Criteria criteria) {
		log.info("22"+ criteria);
		Map<String, Object> map = adminService.getUserList(criteria);
		int total = (int)map.get("total");
		PageDTO pageDTO = new PageDTO(criteria, total);
		@SuppressWarnings("unchecked")
		List<AdminUserDTO> list = (List<AdminUserDTO>)map.get("userList");
		model.addAttribute("page", pageDTO);
		model.addAttribute("userList", list);
	}
	@GetMapping(value="/create_user",produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> createUser(AdminUserDTO adminUserDTO) {
		System.out.println(adminUserDTO);
		boolean result = adminService.registerTestUser(adminUserDTO);
		return ResponseEntity.ok(result);
	}
	@PostMapping(value = "/userRepair", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> userRepair(@RequestParam("mnos[]") int[] mnos){
		int count = adminService.modifyRepair(mnos);
		return ResponseEntity.ok(count);
	}
	@PostMapping(value = "/userSuspend",produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> userSuspend(@RequestParam("mnos[]")int[] mnos) {
		int count = adminService.modifysusend(mnos);
		return ResponseEntity.ok(count);
	}
//	@PostMapping("/admin_userTable")
//	public String userTable(Model model, Criteria criteria) {
//		Map<String, Object> map = adminService.getUserList(criteria);
//		int count = (int)map.get("total");
//		PageDTO pageDTO = new PageDTO(criteria, count);
//		log.info("ddd"+pageDTO.getStartPage());
//		log.info("ddd"+pageDTO.getEndPage());
////		log.info("page" + pageDTO);
//		model.addAttribute("page", pageDTO);
//		model.addAttribute("userMap", map);
//		return "admin/admin_userTable";
//		
//	}
	@GetMapping("/admin_customerCenter")
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
	@GetMapping("/searchWord")
	public String seachWord(SearchDTO searchDTO, Model model) {
		List<SubNoticeDTO> list = adminService.getSearchByNotice(searchDTO);
		System.out.println("list" + list);
		model.addAttribute("list", list);
		return "admin/admin_customTable";
	}
}
