package com.zsx.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.zsx.core.util.QiNiuUtil;

@RequestMapping("upload")
@Controller
public class UploadController {

	@RequestMapping(value = "img")
	@ResponseBody
	public JSONObject upload(@RequestParam(value = "tupian", required = false) MultipartFile file,
			HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		try {
			if (file == null || file.isEmpty()) {
				jsonObject.put("success", false);
				return jsonObject;
			}
			
			//name 原文件名
			String name = file.getOriginalFilename();
			//文件格式 ———— 后缀名 
			String fileType = name.substring(name.lastIndexOf("."));
			//newName 生成的uuID文件名
			String newName = UUID.randomUUID().toString().replace("-", "") + fileType;
			
			// 临时文件
			File tmpFile = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + newName);
			
			file.transferTo(tmpFile);
			
			boolean upload = new QiNiuUtil().upload(tmpFile, newName);
			
			if (upload) {
				jsonObject.put("success", true);
				jsonObject.put("url", "http://highness.qiniudn.com/" + newName);
			}
		} catch (IOException e) {
			e.printStackTrace();
			jsonObject.put("success", false);
			jsonObject.put("msg", e.getMessage());
		}
		return jsonObject;
	}

}
