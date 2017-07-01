package com.miniApp.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.Map;

/**
 * Created by highness on 2017/6/15 0015.
 */
public interface MiniAppService {

    JSONArray getAllGoods(String creator);

    //	首页图片（最多5张）
    JSONArray getHomeImages(String creator);


    //	商品详细页面展示图片（最多5）
    JSONArray getGoodsDetailImages(Long id);

    //	商品详细页面数据
    JSONObject getGoodsDetail(Long id);

    JSONArray getShoppingCart(Long userId);

    /**
     * 添加到购物车
     * @param userId
     * @param goodId
     * @return
     */
    JSONObject addShoppingCart(Long userId, Long goodId);


    /**
     * 添加收货地址
     * @param map
     * @return
     */
    JSONObject addUserAddress(Map map);

    /**
     * 获取用户的收货地址列表
     * @param userId
     * @return
     */
    JSONArray getAddressList(Long userId);

    /**
     * 根据主键获取收货地址，主要用于修改
     * @param id
     * @return
     */
    JSONObject getUserAddressById(Long id);

    JSONObject addOrder(Map map);

}
