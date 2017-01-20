package com.weshop.service;

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
	
}
