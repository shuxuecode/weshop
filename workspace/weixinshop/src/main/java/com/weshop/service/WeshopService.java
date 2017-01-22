package com.weshop.service;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public interface WeshopService {

	
//	首页图片（最多5张）
	JSONArray getHomeImages();
	
//	热门商品（最多5）
	JSONArray getHotGoods();
	
	
//	全部商品
	JSONArray getAllGoods();
	
	
//	商品详细页面展示图片（最多5）
	JSONArray getGoodsDetailImages(Long id);
	
//	商品详细页面数据
	JSONObject getGoodsDetail(Long id);
	
	
	JSONObject addHomeImage(String url);
	
	JSONObject delHomeImage(Long id);
	
	JSONObject addGoods(String shortName, String longName, String summary, String image, String price, 
			int goodsType, int totalNum, int sellNum, String detail);
	
	JSONObject delGoods(Long id);
	
	public JSONObject addGoodsImages(String url, Long goodsId);
	
	public JSONObject delGoodsImages(Long id);
	
}
