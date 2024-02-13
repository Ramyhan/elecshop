package com.kh.elecshop.controller;


import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.elecshop.domain.AdminNoticeDTO;
import com.kh.elecshop.domain.AdminProductDTO;
import com.kh.elecshop.domain.AdminProductInfoDTO;
import com.kh.elecshop.domain.AdminProductRegisterDTO;
import com.kh.elecshop.domain.AdminUserDTO;
import com.kh.elecshop.domain.Criteria;
import com.kh.elecshop.domain.DayInfoDTO;
import com.kh.elecshop.domain.IquiryVO;
import com.kh.elecshop.domain.ManufacturerVO;
import com.kh.elecshop.domain.NoticeVO;
import com.kh.elecshop.domain.OrderVO;
import com.kh.elecshop.domain.PageDTO;
import com.kh.elecshop.domain.SearchDTO;
import com.kh.elecshop.domain.SubNoticeDTO;
import com.kh.elecshop.domain.VisitCountVO;
import com.kh.elecshop.service.AdminService;
import com.kh.elecshop.service.IquiryService;
import com.kh.elecshop.service.MemberService;
import com.kh.elecshop.service.NoticeService;
import com.kh.elecshop.service.VisitCountService;

import lombok.extern.log4j.Log4j;
import com.kh.elecshop.service.IquiryService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private VisitCountService visitCountService;
	@Autowired
	private IquiryService iquiryService;
	@Autowired
	private MemberService memberService;
	
	//어드민 메인화면
	@GetMapping("/admin_dashboard")
	public void dashBoard(Model model) {
		List<VisitCountVO> chartVO = visitCountService.getVisitCountChart();
		LocalDate vdate = LocalDate.now();
		List<DayInfoDTO> dayInfoList = visitCountService.getDayInfo(vdate);
		List<IquiryVO> iquiryList = iquiryService.getIquiryList();
		List<NoticeVO> noticeList = noticeService.getLatestNotice();
		model.addAttribute("chartVO", chartVO);
		model.addAttribute("dayInfoList", dayInfoList);
		model.addAttribute("iquiryList", iquiryList);
		model.addAttribute("noticeList", noticeList);
	}
	//어드민 공지사항 입력창
	@GetMapping("/notice/register")
	public String noticeRegister() {
		
		return "/admin/registerNotice";
	}
	//어드민 상품 추가 팝업창
	@GetMapping("/admin_product_popup")
	public void product_popup(Model model) {
		List<ManufacturerVO> list = adminService.getMenuFacturer();
		model.addAttribute("facturer", list);
	}
	//상품 수정 버튼
	@PostMapping("/updateProduct")
	public String updateProduct(RedirectAttributes attributes,AdminProductInfoDTO adminProductInfoDTO) {
		System.out.println(adminProductInfoDTO);
		adminService.modifyProduct(adminProductInfoDTO);
		attributes.addAttribute("pno", adminProductInfoDTO.getPno());
		return "redirect:/admin/admin_productInfo";
	}
	//어드민 상품 수정페이지
	@PostMapping(value="/admin_product_updateForm")
	public void productUpdateForm(int pno, Model model) {
		AdminProductInfoDTO productInfoDTO = adminService.getProductInfo(pno);
		List<ManufacturerVO> list = adminService.getMenuFacturer();
		model.addAttribute("facturer", list);
		model.addAttribute("productInfo", productInfoDTO);
	}
	//상품 상세정보 확인 메서드
	@GetMapping("/admin_productInfo")
	public void productInfoForm(int pno, Model model) {
		System.out.println("wrasd"+pno);
		AdminProductInfoDTO productInfo = adminService.getProductInfo(pno);
		model.addAttribute("productInfo", productInfo);
	}
	//상품추가 메서드
	@PostMapping(value="/adminProductRegister", produces = MediaType.APPLICATION_JSON_VALUE)
	public String adminProductRegister(AdminProductRegisterDTO adminProductRegisterDTO, RedirectAttributes rttr) {
		System.out.println("dto" + adminProductRegisterDTO);
		boolean result = adminService.registerProduct(adminProductRegisterDTO);
		rttr.addFlashAttribute("registerResult", result);
		System.out.println(result);
		return "redirect:/admin/admin_product";
	}
	//어드민 상품관리화면
	@GetMapping("/admin_product")
	public void product(Model model, Criteria criteria) {
		Map<String, Object> map = adminService.getProductList(criteria);
		System.out.println(map);
		model.addAttribute("productMap", map);
	}
	//어드민 유저관리 테이블
	@GetMapping("/admin_userTable")
	public String userTable(Criteria criteria,Model model) {
		Map<String,Object> map = adminService.getUserList(criteria);
		int total = (int)map.get("total");
		PageDTO pageDTO = new PageDTO(criteria, total);
		@SuppressWarnings("unchecked")
		List<AdminUserDTO> list = (List<AdminUserDTO>)map.get("userList");
		model.addAttribute("page", pageDTO);
		model.addAttribute("userList", list);
		return "admin/admin_userTable";
	}
	//어드민 유저관리 화면
	@GetMapping("/admin_user")
	public void user(Model model, Criteria criteria) {
		Map<String, Object> map = adminService.getUserList(criteria);
		int total = (int)map.get("total");
		PageDTO pageDTO = new PageDTO(criteria, total);
		@SuppressWarnings("unchecked")
		List<AdminUserDTO> list = (List<AdminUserDTO>)map.get("userList");
		model.addAttribute("page", pageDTO);
		model.addAttribute("userList", list);
	}
	//어드민 유저테스트 생성 모달창
	@GetMapping(value="/create_user",produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> createUser(AdminUserDTO adminUserDTO) {
		System.out.println(adminUserDTO);
		boolean result = adminService.registerTestUser(adminUserDTO);
		return ResponseEntity.ok(result);
	}
	//어드민 유저 복구버튼
	@PostMapping(value = "/userRepair", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> userRepair(@RequestParam("mnos[]") int[] mnos){
		int count = adminService.modifyRepair(mnos);
		return ResponseEntity.ok(count);
	}
	//어드민 유저 정지버튼
	@PostMapping(value = "/userSuspend",produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> userSuspend(@RequestParam("mnos[]")int[] mnos) {
		int count = adminService.modifysusend(mnos);
		return ResponseEntity.ok(count);
	}
	//어드민 고객센터관리 화면
	@GetMapping("/admin_customerCenter")
	public void admin_customerCenter(Model model,Criteria criteria) {
		Map<String, Object> map = adminService.getAdminNoticeList(criteria);
		model.addAttribute("noticeMap", map);
	}
	//어드민 고객센터 테이블
	@GetMapping("/admin_customtableList")
	public void admin_customtableList(Criteria criteria,Model model) {
		Map<String, Object> map = adminService.getAdminNoticeList(criteria);
		model.addAttribute("noticeMap", map);
	}
	
	//어드민 공지 비활성화버튼
	@PostMapping(value = "/updateCloseState", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean updateCloseState(@RequestParam(value="nnos[]") int[] nnos) {
		boolean result = noticeService.modifyNoticeCloseState(nnos);
		return result;
	}
	//어드민 공지 활성화버튼
	@PostMapping(value = "/updateOpenState", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean updateOpenState(@RequestParam(value="nnos[]") int[] nnos) {
		boolean result = noticeService.modifyNoticeOpenState(nnos);
		return result;
	}
	//어드민 공지 삭제 버튼
	@PostMapping(value = "/deleteNotice", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int deleteNotice(@RequestParam("nnos[]") int[] nnos) {
		int count = noticeService.removeNotice(nnos);
		return count;
	}
	//어드민 공지사항 추가 버튼
	@PostMapping(value="/registerNotice", produces = MediaType.APPLICATION_JSON_VALUE)
	public String registerNotice(NoticeVO noticeVO) {
		System.out.println("notice" + noticeVO);
		boolean result = noticeService.registerNotice(noticeVO);
		System.out.println(result);
		return "redirect:/admin/admin_customerCenter";
	}
	//어드민 공지사항 검색버튼
	@GetMapping("/searchWord")
	public String seachWord(SearchDTO searchDTO, Model model, Criteria criteria) {
		Map<String, Object> map = adminService.getSearchByNotice(searchDTO,criteria);
		model.addAttribute("noticeMap", map);
		return "admin/admin_customtableList";
	}
	
	//어드민 배송정보
	@GetMapping("/admin_order")
	public void admin_order(Model model, Criteria criteria) {
		Map<String, Object> map = adminService.getOrderList(criteria);
		model.addAttribute("orderMap", map);
	}
	//어드민 송장번호
	@PostMapping("/updateOrderStatus")
	public ResponseEntity<String> updateOrderStatus(@RequestParam("status") int status, @RequestParam("ono")int ono) {
		adminService.updateOrderStatus(ono, status);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	//어드민 포인트
	@GetMapping("/admin_point")
	public void admin_point(Model model, Criteria criteria) {
		Map<String, Object> map = adminService.getPointList(criteria);
		model.addAttribute("pointMap", map);
	}
	
	//어드민 포인트 수정
	@PostMapping(value = "/adminUpdatePoint",
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> adminUpdatePoint(@RequestParam("mid") String mid, @RequestParam("ppoint") int ppoint) {
		System.out.println(mid);
		System.out.println(ppoint);
		Map<String, Object> map = new HashMap<>();
		memberService.updateAdminPoint(map);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
