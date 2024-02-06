package com.kh.elecshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.elecshop.domain.IquiryVO;
import com.kh.elecshop.service.IquiryService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/iquiry")
@Log4j
public class IquiryController {
	
	@Autowired
	private IquiryService iquiryService;
	
	@PostMapping(value = "/add",
			consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private String addIquiry(@RequestBody IquiryVO iquiryVO) {
		log.info("iquiryVO: " + iquiryVO);
		boolean result = iquiryService.addIquiry(iquiryVO);
		return String.valueOf(result);
	}
	
	@GetMapping(value = "/get/{ino}",
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private IquiryVO getOne(@PathVariable("ino") int ino) {
		IquiryVO iquiryVO = iquiryService.getIquiry(ino);
		return iquiryVO;
	}
	
	@PutMapping(value = "/reply")
	@ResponseBody
	private String modify(@RequestBody IquiryVO iquiryVO) {
		boolean result = iquiryService.addReply(iquiryVO);
		return String.valueOf(result);
	}
	
	@DeleteMapping(value = "/{ino}")
	@ResponseBody
	private String remove(@PathVariable("ino") int ino) {
		boolean result = iquiryService.removeIquiry(ino);
		return String.valueOf(result);
	}
}
