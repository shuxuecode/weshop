package com.weshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.weshop.service.WeshopService;

@Controller
@RequestMapping("app")
public class WeshopAppController {

	
	@Autowired
	private WeshopService weshopService;
	
	@RequestMapping("homeImg")
	@ResponseBody
	public JSONArray getHomeImages() {
		return weshopService.getHomeImages();
	}
	
	
	@RequestMapping("hotGoods")
	@ResponseBody
	public JSONArray getHotGoods() {
		return weshopService.getHotGoods();
	}
	
	@RequestMapping("allGoods")
	@ResponseBody
	public JSONArray getAllGoods() {
		return weshopService.getAllGoods();
	}
	
	@RequestMapping("goodsImages")
	@ResponseBody
	public JSONArray getGoodsDetailImages(Long id) {
		return weshopService.getGoodsDetailImages(id);
	}
	
	@RequestMapping("goodsDetail")
	@ResponseBody
	public JSONObject getGoodsDetail(Long id) {
		return weshopService.getGoodsDetail(id);
	}
	
}
