package com.weshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.weshop.model.json.JsonTable;
import com.weshop.service.WeshopService;

@Controller
@RequestMapping("weshop")
public class WeshopWebController {

	
	@Autowired
	private WeshopService weshopService;
	
	@RequestMapping("homeImg")
	@ResponseBody
	public JsonTable getHomeImages() {
		return new JsonTable(weshopService.getHomeImages(), 10L);
	}
	
	
	@RequestMapping("allGoods")
	@ResponseBody
	public JsonTable getAllGoods() {
		return new JsonTable(weshopService.getAllGoods(), 10L);
	}
	
	
	@RequestMapping("/index")
	public String homePage() {
		return "/web/index";
	}
	
	
	@RequestMapping("/goodsListPage")
	public String goodsListPage() {
		return "/web/goodsList";
	}
	
}
