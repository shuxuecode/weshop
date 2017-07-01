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
public class MiniAppServiceImpl implements MiniAppService {

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

        if (list.size() == 0) {
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

    @Override
    public JSONArray getShoppingCart(Long userId) {
        JSONArray array = new JSONArray();
        String sql = "SELECT id, user_id, good_id FROM w_shopping_cart WHERE is_del = 0 AND user_id = " + userId + "";
        List<Map<String, Object>> list = userMapper.executeSQL(sql);
        StringBuffer goodIds = new StringBuffer();
        goodIds.append("'',");
        for (Map<String, Object> map : list) {
            Object good_id = map.get("good_id");
            goodIds.append(good_id).append(",");
        }

        String substring = goodIds.substring(0, goodIds.length() - 1);

        sql = "SELECT id, longName, image, price FROM w_goods WHERE id IN (" + substring + ")";
        List<Map<String, Object>> goods = userMapper.executeSQL(sql);
        for (Map<String, Object> map : goods) {
            array.add(map);
        }
        return array;
    }

    @Override
    public JSONObject addShoppingCart(Long userId, Long goodId) {
        JSONObject jsonObject = new JSONObject();
        String sql = "INSERT INTO w_shopping_cart(user_id, good_id, status, is_del, creator) VALUES (" + userId + "," + goodId + ",0,0,'zhao')";
        try {
            userMapper.executeSQL(sql);
            jsonObject.put("success", true);
        } catch (Exception e) {
            jsonObject.put("success", false);
        }
        return jsonObject;
    }

    @Override
    public JSONObject addUserAddress(Map map) {
        Long userId = (Long) map.get("userId");
        String userName = (String) map.get("userName");
        String phoneNumber = (String) map.get("phoneNumber");
        String addressA = (String) map.get("addressA");
        String addressB = (String) map.get("addressB");
        String addressC = (String) map.get("addressC");
        String addressD = (String) map.get("addressD");
        Integer status = (Integer) map.get("status");
        Integer isDel = (Integer) map.get("isDel");
        String creator = (String) map.get("creator");

        JSONObject jsonObject = new JSONObject();

        String sql = "INSERT INTO w_address(`user_id`,`user_name`,`phone_number`,`address_a`,`address_b`,`address_c`,`address_d`,`status`,`is_del`,`creator`,`create_time`)" +
                "VALUES(" + userId + ",'" + userName + "','" + phoneNumber + "','" + addressA + "','" + addressB + "','"
                + addressC + "','" + addressD + "'," + status + "," + isDel + ",'" + creator + "',now())";
        try {
            userMapper.executeSQL(sql);
            jsonObject.put("success", true);
        } catch (Exception e) {
            jsonObject.put("success", false);
        }
        return jsonObject;
    }

    @Override
    public JSONArray getAddressList(Long userId) {
        JSONArray array = new JSONArray();
        String sql = "SELECT * FROM w_address WHERE is_del = 0 AND user_id = " + userId + "";
        List<Map<String, Object>> list = userMapper.executeSQL(sql);
        for (Map<String, Object> map : list) {
            array.add(map);
        }
        return array;
    }

    @Override
    public JSONObject getUserAddressById(Long id) {
        String sql = "SELECT * FROM w_address WHERE is_del = 0 AND id = " + id;
        List<Map<String, Object>> list = userMapper.executeSQL(sql);
        if (list.size() == 1) {
            Map<String, Object> map = list.get(0);
            return JSONObject.parseObject(JSON.toJSONString(map));
        }
        return null;
    }

    @Override
    public JSONObject addOrder(Map map) {
        Long order_number = (Long) map.get("order_number");
        Long user_id = (Long) map.get("user_id");
        Long address_id = (Long) map.get("address_id");

        Long amount = (Long) map.get("amount");

        Integer dispatch_type = (Integer) map.get("dispatch_type");
        String message = (String) map.get("message");
        Integer status = 0;

        Integer isDel = 0;
        String creator = "zhao";

        JSONObject jsonObject = new JSONObject();
        String sql = "INSERT INTO w_order (`order_number` ,`user_id` ,`address_id` ,`amount` ,`dispatch_type` ,`message` ,`status` ,`is_del`,`creator` ,`create_time`)\n" +
                "VALUES("+order_number+", "+user_id+", "+address_id+", "+amount+", " +
                ""+dispatch_type+", '"+message+"', "+status+", "+isDel+", '"+creator+"', now())";
        try {
            userMapper.executeSQL(sql);
            jsonObject.put("success", true);
        } catch (Exception e) {
            jsonObject.put("success", false);
        }
        return jsonObject;
    }
}
