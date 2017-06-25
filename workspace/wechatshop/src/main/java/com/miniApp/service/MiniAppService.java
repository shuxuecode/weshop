package com.miniApp.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

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

}
