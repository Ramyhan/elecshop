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
	private final String UPLOAD_PATH = "C:\\Users\\dongk\\Desktop/upload";
	
	@PostMapping(value="/uploadAjax", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<FileVO> UploadAjax(MultipartFile[] uploadFiles) {
		log.info("multi" + uploadFiles);
		System.out.println("upload" + uploadFiles.length);
		String uploadPath = getFolder();
		List<FileVO> attachList = new ArrayList<>();
		
		for(int i = 0; i < uploadFiles.length;i++) {
			UUID uuid = UUID.randomUUID();
			String orgFilename = uploadFiles[i].getOriginalFilename();
			String savedFilename = uuid + "_" + orgFilename;
			File f = new File(uploadPath, savedFilename);
			
			boolean isImage = checkImageType(f);
			
			
			FileVO fileVO = FileVO.builder()
					.fileName(orgFilename)
					.uploadPath(uploadPath.substring(UPLOAD_PATH.length()))
					.uuid(uuid.toString())
					.image(isImage)
					.url(uploadPath + "/s_" +uuid + "_" + orgFilename)
					.build();
			attachList.add(fileVO);
			
			if (isImage) {
				try {
					FileOutputStream thumbnail = 
							new FileOutputStream(
									new File(uploadPath, "s_" + savedFilename));
					Thumbnailator.createThumbnail(
							uploadFiles[i].getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			try {
				uploadFiles[i].transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			} 
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
					new ResponseEntity<>(data, headers, HttpStatus.OK);
			return entity;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
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
	private boolean checkImageType(File savedFile) {
		// image/jpeg, image/png, image/gif - MIME-TYPE 체크
		// java.nio.Files
		try {
			String mimeType = Files.probeContentType(savedFile.toPath());
			log.info("mimeType:" + mimeType);
			// mimeType 이 "image/"로 시작하는가
			return mimeType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
