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
		String sql = "SELECT id, url FROM w_home_image";
		List<Map<String, Object>> list = userMapper.executeSQL(sql);
		for (Map<String, Object> map : list) {
			object = new JSONObject();
			object.put("id", map.get("id"));
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
		String sql = "SELECT * FROM w_goods";
		List<Map<String, Object>> list = userMapper.executeSQL(sql);
		for (Map<String, Object> map : list) {
			array.add(map);
		}
		return array;
	}

	@Override
	public JSONArray getGoodsDetailImages(Long id) {
		JSONArray array = new JSONArray();
		String sql = "SELECT * FROM w_goods_image a LEFT JOIN w_image b ON a.imageId = b.id WHERE a.goodsId = " + id;
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

	@Override
	public JSONObject addHomeImage(String url) {
		JSONObject object = new JSONObject();
		String sql = "INSERT INTO w_home_image(url) VALUES('" + url + "')";
		userMapper.executeSQL(sql);
		object.put("success", true);
		return object;
	}

	@Override
	public JSONObject addGoods(String shortName, String longName, String summary, String image, String price, 
			int goodsType, int totalNum, int sellNum, String detail) {
		
		JSONObject object = new JSONObject();
		String sql = "INSERT INTO w_goods(shortName, longName, summary, image, price, goodsType, totalNum, sellNum, detail) "
				+" VALUES('"+shortName+"','"+longName+"','"+summary+"','"
				+image+"','"+price+"',"+goodsType+","+totalNum+","+sellNum+",'"+detail+"')";
		userMapper.executeSQL(sql);
		object.put("success", true);
		return object;
	}

	@Override
	public JSONObject delHomeImage(Long id) {
		JSONObject object = new JSONObject();
		String sql = "DELETE FROM w_home_image WHERE id = " + id;
		userMapper.executeSQL(sql);
		object.put("success", true);
		return object;
	}

	@Override
	public JSONObject delGoods(Long id) {
		JSONObject object = new JSONObject();
		String sql = "DELETE FROM w_goods WHERE id = " + id;
		userMapper.executeSQL(sql);
		object.put("success", true);
		return object;
	}

	@Override
	public JSONObject addGoodsImages(String url, Long goodsId) {
		JSONObject object = new JSONObject();
		
		String sql = "INSERT INTO w_image(url) VALUES('" + url + "')";
		userMapper.executeSQL(sql);
		
		addHomeImage(url);
		sql = "SELECT id FROM w_image WHERE url = '"+url+"'";
		List<Map<String, Object>> list = userMapper.executeSQL(sql);
		if (list.size()>0) {
			Object imageId = list.get(0).get("id");
			
			sql = "INSERT INTO w_goods_image (goodsId, imageId) VALUES("+goodsId+","+imageId+");";
			userMapper.executeSQL(sql);
			object.put("success", true);
		}
		
		return object;
	}

	@Override
	public JSONObject delGoodsImages(Long id) {
		JSONObject object = new JSONObject();
		String sql = "DELETE FROM w_goods_image WHERE id = " + id;
		userMapper.executeSQL(sql);
		object.put("success", true);
		return object;
	}

}
