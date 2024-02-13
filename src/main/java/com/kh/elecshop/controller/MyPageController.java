package com.kh.elecshop.controller;

import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.elecshop.domain.CouponVO;
import com.kh.elecshop.domain.IquiryVO;
import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.OrderVO;
import com.kh.elecshop.domain.PointVO;
import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.service.CouponService;
import com.kh.elecshop.service.IquiryService;
import com.kh.elecshop.service.LikeService;
import com.kh.elecshop.service.MemberService;
import com.kh.elecshop.service.OrderService;
import com.kh.elecshop.service.PointService;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
@RequestMapping("/myPage/*")
@Controller
@Log4j
public class MyPageController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private PointService pointService;
	@Autowired
	private LikeService likeService;
	@Autowired 
	private CouponService couponService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private IquiryService iquiryService;
	
	
	@GetMapping("/myInfo")
	public void myInfo() {
		
	}
	@GetMapping("/modify")
	public void myPage_modify() {
	}
	
	@GetMapping("/myorder")
		public void myPage_myOrder(HttpSession session, Model model) {
			MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
			List<OrderVO> list = orderService.getOrderList(memberVO.getMid());
			log.info(list);
			model.addAttribute("orderList", list);
			
	}
	
	@GetMapping("/coupon")
	public void myPage_coupon(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		List<CouponVO> couponList = couponService.selectUserCoupon(memberVO.getMid());
		model.addAttribute("couponList", couponList);
	}
	// 포인트 페이지
	@GetMapping("/point")
	public void myPage_point(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		List<PointVO> list = pointService.getPointInfo(memberVO.getMid());
		log.info(list);
		model.addAttribute("pointInfo", list);
	}
	// 아이디 체크
	@PostMapping("/checkId")
	public String checkId(LoginDTO loginDTO, RedirectAttributes rttr) {
		MemberVO memberVO = memberService.login(loginDTO);
		if(memberVO == null) {
			rttr.addFlashAttribute("checkIdResult", "fail");
			return "redirect:/myPage/info";
		}
		return "redirect:/myPage/modify";
	}
	// 회원 정보 수정
	@PostMapping("/modifyMember")
	public String modifyMember(MemberVO memberVO, RedirectAttributes rttr, HttpSession session) {
		boolean result = memberService.modifyMember(memberVO);
		
		if(result == true) {
			MemberVO modiMemberVO = memberService.login(memberVO.getMid(), memberVO.getMpw());
			rttr.addFlashAttribute("modifyResult", "success");
			session.removeAttribute("loginInfo");
			session.setAttribute("loginInfo", modiMemberVO);
			return "redirect:/myPage/myInfo";
		}
		
		rttr.addFlashAttribute("modifyResult", "fail");
		return "redirect:/myPage/myInfo";
	}
	// 찜 목록
	@GetMapping("/like")
	public void likeList(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		List<ProductDTO> productDTO = likeService.getLikeList(mid);
		
		model.addAttribute("productDTO", productDTO);
	}
	
	@GetMapping("/myIquiry")
	public void myIquiry(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		
		List<IquiryVO> IquiryList = iquiryService.getIquiryByMid(mid);
		model.addAttribute("IquiryList", IquiryList);
	}
	
	
	// 회원 탈퇴 페이지
	@GetMapping("/resign")
	public void resign() {
		
	}
	// 회원 탈퇴 폼
	@GetMapping("/resignForm")
	public void resignForm() {
		
	}
	// 회원 탈퇴 패스워드 체크
	@PostMapping("/checkResign")
	public String checkReSign(LoginDTO loginDTO, RedirectAttributes rttr) {
		MemberVO memberVO = memberService.login(loginDTO);
		if(memberVO == null) {
			rttr.addFlashAttribute("checkIdResult", "fail");
			return "redirect:/myPage/resign";
		}
		rttr.addFlashAttribute("checkIdResult", "true");
		
		String email = memberService.getEmail(memberVO.getMid());
		log.info(email);
		String uuid = UUID.randomUUID().toString(); // asdfaf-asdfasdfa-
		String email_code = uuid.substring(0, uuid.indexOf("-"));
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper
						(mimeMessage, false, "utf-8");
				helper.setFrom("ehddnl97@gmail.com");
				helper.setTo(email);
				helper.setSubject("계정 탈퇴 코드");
				helper.setText("계정 탈퇴 코드 : " + email_code);
			}
		};
		mailSender.send(preparator);
		rttr.addFlashAttribute("email_code", email_code);
		return "redirect:/myPage/resignForm";
	}
	
	//회원 탈퇴
	@PostMapping("/resignRun")
	public String reSign(String mid, HttpSession session) {
		memberService.memberDisabled(mid);
		session.removeAttribute("loginInfo");
		return "redirect:/login";
	}
	
}
