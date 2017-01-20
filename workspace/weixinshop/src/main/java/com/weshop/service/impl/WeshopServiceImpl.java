package com.weshop.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.weshop.service.WeshopService;
import com.zsx.web.dao.UserMapper;

@Service
@Transactional
public class WeshopServiceImpl implements WeshopService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public JSONArray getHomeImages() {
		JSONArray array = new JSONArray();
		JSONObject object = new JSONObject();
		String sql = "SELECT url FROM w_home_image";
		List<Map<String, Object>> list = userMapper.executeSQL(sql);
		for (Map<String, Object> map : list) {
			object = new JSONObject();
			object.put("url", map.get("url"));
			
			array.add(object);
		}
		return array;
	}

	@Override
	public JSONArray getHotGoods() {
		JSONArray array = new JSONArray();
		String sql = "SELECT id, shortName, summary, price, image FROM w_goods WHERE goodsType = 1";
		List<Map<String, Object>> list = userMapper.executeSQL(sql);
		for (Map<String, Object> map : list) {
			array.add(map);
		}
		return array;
	}

	@Override
	public JSONArray getAllGoods() {
		JSONArray array = new JSONArray();
		String sql = "SELECT id, shortName, summary, price, image FROM w_goods";
		List<Map<String, Object>> list = userMapper.executeSQL(sql);
		for (Map<String, Object> map : list) {
			array.add(map);
		}
		return array;
	}

	@Override
	public JSONArray getGoodsDetailImages(Long id) {
		JSONArray array = new JSONArray();
		String sql = "SELECT url FROM w_goods_image a LEFT JOIN w_image b ON a.imageId = b.id WHERE a.goodsId = " + id;
		List<Map<String, Object>> list = userMapper.executeSQL(sql);
		for (Map<String, Object> map : list) {
			array.add(map);
		}
		return array;
	}

	@Override
	public JSONObject getGoodsDetail(Long id) {
		String sql = "SELECT * FROM w_goods WHERE id = " + id;
		List<Map<String, Object>> list = userMapper.executeSQL(sql);
		if (list.size() == 1) {
			Map<String, Object> map = list.get(0);
			return JSONObject.parseObject(JSON.toJSONString(map));
		}
		return null;
	}

}
