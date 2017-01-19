package com.weshop.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zsx.web.service.UserService;

@Controller
@RequestMapping("weshop")
public class WeshopController {

	
	@Autowired
	private UserService userService;
	
	
	
	
	
	@RequestMapping("a")
	@ResponseBody
	public String aaaaaa() {
		
		List<Map<String, Object>> executeSQL = userService.executeSQL("select now()");
		System.out.println(JSON.toJSONString(executeSQL));
		
		return "123456";
	}
	
	
	@RequestMapping("home")
	public String homePage() {
		return "/homePage";
	}
	
}
