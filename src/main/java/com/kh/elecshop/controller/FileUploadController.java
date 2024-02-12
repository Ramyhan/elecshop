package com.kh.elecshop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.elecshop.domain.FileVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class FileUploadController {
	private final String UPLOAD_PATH = "C:\\image";
	@PostMapping(value="/uploadAjax", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<FileVO> UploadAjax(MultipartFile uploadFile) {
		log.info("multi" + uploadFile);
		System.out.println("upload" + uploadFile);
		String uploadPath = getFolder();
		List<FileVO> attachList = new ArrayList<>();
		
			UUID uuid = UUID.randomUUID();
			String orgFilename = uploadFile.getOriginalFilename();
			System.out.println("2424" + orgFilename);
			String savedFilename = uuid + "_" + orgFilename;
			File f = new File(uploadPath, savedFilename);
			
			FileVO fileVO = FileVO.builder()
					.afileName(orgFilename)
					.apath(uploadPath.substring(UPLOAD_PATH.length()))
					.auuid(uuid.toString())
					.aurl(uploadPath.substring(UPLOAD_PATH.length()) + "/" +uuid + "_" + orgFilename)
					.build();
			attachList.add(fileVO);
			try {
				uploadFile.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		return attachList;
		
	}
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		// -> /2024/01/04/s_6e8e7332-e4e5-415c-9dbd-422c2cd7ae65_4.png
		String filePath = UPLOAD_PATH + fileName;
		File target = new File(filePath);
		try {
			byte[] data = FileCopyUtils.copyToByteArray(target);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(target.toPath()));
			ResponseEntity<byte[]> entity = 
					new ResponseEntity<>(data,headers, HttpStatus.OK);
			return entity;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		log.info("fileName:" + fileName);
		// 파일 삭제 처리
		// 1. 원본 파일 삭제
		String filePath = UPLOAD_PATH + fileName;
		log.info("filePath:" + filePath);
		File f = new File(filePath);
		log.info("f:" + f);
		boolean result = f.delete();
		log.info("result:" + result);
		// 2. 이미지 파일이라면 쎔네일 파일 삭제 (s_)
//			String front = fileName.substring(0, 12); // /2024/01/05/
//			String rear = fileName.substring(12);// aac58989-946b-4745-922d-0b69e32e7008_4.png
//			String thumbnailPath = UPLOAD_PATH + front + "s_" + rear;
//			File thumbF = new File(thumbnailPath);
//			result = result && thumbF.delete();
		ResponseEntity<String> entity = new ResponseEntity<String>(
				String.valueOf(result), HttpStatus.OK);
		return entity;
	}
	
	private String getFolder() {
		// java.util.Date
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String str = UPLOAD_PATH + "/" + sdf.format(d);
		// -> D:/upload/2024/01/03
		File f = new File(str);
		if (!f.exists()) {
			f.mkdirs();
		}
		return str;
	}
}
