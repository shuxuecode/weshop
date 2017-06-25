package com.miniApp.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.miniApp.service.MiniAppService;
import com.zsx.web.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by highness on 2017/6/15 0015.
 */
@Service
@Transactional
public class MiniAppServiceImpl implements MiniAppService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public JSONArray getAllGoods(String creator) {
        JSONArray array = new JSONArray();
        String sql = "SELECT id, longName, image, price FROM w_goods where creator = '" + creator + "'";
        List<Map<String, Object>> list = userMapper.executeSQL(sql);
        for (Map<String, Object> map : list) {
            array.add(map);
        }
        return array;
    }


    @Override
    public JSONArray getHomeImages(String creator) {
        JSONArray array = new JSONArray();
        JSONObject object = null;
        String sql = "SELECT id, url FROM w_home_image where creator = '" + creator + "'";
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
    public JSONArray getGoodsDetailImages(Long id) {
        JSONArray array = new JSONArray();
        String sql = "SELECT b.url as url FROM w_goods_image a LEFT JOIN w_image b ON a.imageId = b.id WHERE a.goodsId = " + id;
        List<Map<String, Object>> list = userMapper.executeSQL(sql);

        if (list.size() == 0){
            sql = "SELECT image as url FROM w_goods WHERE id = " + id;
            list = userMapper.executeSQL(sql);
        }

        for (Map<String, Object> map : list) {
            array.add(map);
        }
        return array;
    }

    @Override
    public JSONObject getGoodsDetail(Long id) {
        String sql = "SELECT id, longName, detail, price  FROM w_goods WHERE id = " + id;
        List<Map<String, Object>> list = userMapper.executeSQL(sql);
        if (list.size() == 1) {
            Map<String, Object> map = list.get(0);
            return JSONObject.parseObject(JSON.toJSONString(map));
        }
        return null;
    }
}
