package com.weshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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
		return new JsonTable(weshopService.getAllGoods(), 1000L);
	}
	
	
	@RequestMapping("/index")
	public String homePage() {
		return "/web/index";
	}
	
	
	@RequestMapping("/goodsListPage")
	public String goodsListPage() {
		return "/web/goodsList";
	}
	
	
	@RequestMapping("addHomeImage")
	@ResponseBody
	public JSONObject addHomeImage(String url) {
		return weshopService.addHomeImage(url);
	}
	
	@RequestMapping("delHomeImage")
	@ResponseBody
	public JSONObject delHomeImage(Long id) {
		return weshopService.delHomeImage(id);
	}
	
	@RequestMapping("addGoods")
	@ResponseBody
	public JSONObject addGoods(String shortName, String longName, String summary, String image, String price, 
			int goodsType, int totalNum, int sellNum, String detail) {
		return weshopService.addGoods(shortName, longName, summary, image, price, goodsType, totalNum, sellNum, detail);
	}
	
	
	@RequestMapping("delGoods")
	@ResponseBody
	public JSONObject delGoods(Long id) {
		return weshopService.delGoods(id);
	}
	
	
	@RequestMapping("/goodsImagesPage")
	public String goodsImagesPage(HttpServletRequest request) {
		request.setAttribute("id", request.getParameter("id"));
		return "/web/goodsImages";
	}
	
	@RequestMapping("goodsImages")
	@ResponseBody
	public JsonTable getGoodsDetailImages(Long id) {
		return new JsonTable(weshopService.getGoodsDetailImages(id), 10L);
	}
	
	@RequestMapping("addGoodsImages")
	@ResponseBody
	public JSONObject addGoodsImages(String url, Long goodsId) {
		return weshopService.addGoodsImages(url, goodsId);
	}
	
	@RequestMapping("delGoodsImages")
	@ResponseBody
	public JSONObject delGoodsImages(Long id) {
		return weshopService.delGoodsImages(id);
	}
}
