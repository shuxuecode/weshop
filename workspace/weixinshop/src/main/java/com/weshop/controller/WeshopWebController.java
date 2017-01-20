package com.weshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.weshop.service.WeshopService;

@Controller
@RequestMapping("weshop")
public class WeshopWebController {

	
	@Autowired
	private WeshopService weshopService;
	
	@RequestMapping("homeImg")
	@ResponseBody
	public JSONArray getHomeImages() {
		return weshopService.getHomeImages();
	}
	
	
	@RequestMapping("home")
	public String homePage() {
		return "/homePage";
	}
	
}
