package com.miniApp.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.miniApp.service.MiniAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by highness on 2017/6/15 0015.
 */
@Controller
@RequestMapping("miniapp")
public class MiniAppController {

    @Autowired
    private MiniAppService miniAppService;

    @GetMapping("goods.json")
    @ResponseBody
    public JSONArray getAllGoods(@RequestParam(name = "userId", defaultValue = "zhao") String userId){
        return miniAppService.getAllGoods(userId);
    }

    @GetMapping("homeImages.json")
    @ResponseBody
    public JSONArray getHomeImages(@RequestParam(name = "userId", defaultValue = "zhao") String userId){
        return miniAppService.getHomeImages(userId);
    }

    @GetMapping("detailImages.json")
    @ResponseBody
    public JSONArray getGoodsDetailImages(@RequestParam(name = "id", defaultValue = "1") Long id){
        return miniAppService.getGoodsDetailImages(id);
    }


    @GetMapping("goodDetail.json")
    @ResponseBody
    public JSONObject getGoodsDetail(@RequestParam(name = "id", defaultValue = "1") Long id){
        return miniAppService.getGoodsDetail(id);
    }




}
