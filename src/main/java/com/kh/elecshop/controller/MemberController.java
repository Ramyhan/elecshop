package com.kh.elecshop.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.elecshop.domain.CouponVO;
import com.kh.elecshop.domain.LoginDTO;
import com.kh.elecshop.domain.MemberVO;
import com.kh.elecshop.domain.ProductDTO;
import com.kh.elecshop.mapper.CouponMapper;
import com.kh.elecshop.service.MemberService;
import com.kh.elecshop.service.ProductService;

import lombok.extern.log4j.Log4j;
import oracle.net.aso.h;

@Controller
@Log4j
public class MemberController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponMapper couponMapper;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/main")
	public void main(Model model) {
		List<ProductDTO> productList = productService.getTop8();
		model.addAttribute("productList", productList);
	}
	@GetMapping("/signup")
	public void signup() {
		
	}
	// 회원가입
	@PostMapping("/registerMember")
	public String registerMember(MemberVO memberVO, RedirectAttributes rttr) {
		log.info(memberVO);
		boolean result = memberService.registerMember(memberVO);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, +7);
		Date expiry_date = cal.getTime();
		CouponVO couponVO = CouponVO.builder()
				.coupon_name("신규가입 10% 할인 쿠폰")
				.mid(memberVO.getMid())
				.sale(10)
				.expiry_date(expiry_date)
				.build();
		couponMapper.insertCoupon(couponVO);
		rttr.addFlashAttribute("registerResult", "success");
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public void login() {
	}
	// 로그인
	@PostMapping("/loginPost")
	public void loginPost(LoginDTO loginDTO, Model model, RedirectAttributes rttr) {
		MemberVO memberVO = memberService.login(loginDTO);
		if(memberVO == null) {
		}
		if(memberVO.getMstate() == 0) {
			rttr.addFlashAttribute("loginResult", "disabled");
		}
		model.addAttribute("loginInfo", memberVO);
		model.addAttribute("useCookie", loginDTO.isUseCookie());
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	// 로그인 체크
	@PostMapping("/checkLogin")
	@ResponseBody
	public String checkLogin(HttpSession session) {
		boolean result = 
				session.getAttribute("loginInfo") != null ? true : false;
		return String.valueOf(result);
	
	}
	// 포인트 리스트
	@GetMapping("/getPoint")
	@ResponseBody
	public String getPoint(HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		
		 int count = memberService.selectPoint(memberVO.getMid());
		 session.removeAttribute("loginInfo");
		 memberVO.setMpoint(count);
		 session.setAttribute("loginInfo", memberVO);
		 return String.valueOf(count);
	}
	
	
	@GetMapping("/password")
	public String resetPassword() {
		
		return "password";
	}
	// 패스워드 재설정
	@PostMapping("/resetPassword")
	public String resetPassword(String mid) {
		String email = memberService.getEmail(mid);
		log.info(email);
		String uuid = UUID.randomUUID().toString(); // asdfaf-asdfasdfa-
		String mpw = uuid.substring(0, uuid.indexOf("-"));
		log.info("newPass:" + mpw);
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(
						mimeMessage,
						false, // multipart
						"utf-8"
						);
				helper.setFrom("ehddnl97@gmail.com"); // 보내는 이
				helper.setTo(email);
				helper.setSubject("비밀번호 재설정");
				helper.setText("발급된 임시 비밀번호 : " + mpw);
			}
		};
		mailSender.send(preparator);
		memberService.changePassword(mid, mpw);
		return "redirect:/login";
	}
	
	
	
	
}
