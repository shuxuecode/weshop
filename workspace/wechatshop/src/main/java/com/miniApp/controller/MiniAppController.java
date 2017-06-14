package com.miniApp.controller;

import com.alibaba.fastjson.JSONArray;
import com.miniApp.service.MiniAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
    public JSONArray getAllGoods(){
        return miniAppService.getAllGoods();
    }

}
