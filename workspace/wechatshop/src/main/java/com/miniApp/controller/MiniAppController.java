package com.miniApp.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.miniApp.service.MiniAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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


    @GetMapping("shopCart.json")
    @ResponseBody
    public JSONArray getShoppingCart(@RequestParam(name = "userId", defaultValue = "1") Long userId){
        return miniAppService.getShoppingCart(userId);
    }

    @GetMapping("addCart.json")
    @ResponseBody
    public JSONObject addShoppingCart(@RequestParam(name = "userId", defaultValue = "1") Long userId,
                                      @RequestParam(name = "goodId") Long goodId){
        return miniAppService.addShoppingCart(userId, goodId);
    }

    @GetMapping("getAddresss.json")
    @ResponseBody
    public JSONArray getAddressList(@RequestParam(name = "userId", defaultValue = "1") Long userId){
        return miniAppService.getAddressList(userId, false);
    }

    @GetMapping("getDefalutAddress.json")
    @ResponseBody
    public JSONArray getDefalutAddress(@RequestParam(name = "userId", defaultValue = "1") Long userId){
        return miniAppService.getAddressList(userId, true);
    }

    @GetMapping("getAddressById.json")
    @ResponseBody
    public JSONObject getUserAddressById(@RequestParam(name = "id", defaultValue = "1") Long id){
        return miniAppService.getUserAddressById(id);
    }

    @PostMapping("addAddress.json")
    @ResponseBody
    public JSONObject addUserAddress(@RequestParam(name = "userId", defaultValue = "1") Long userId,
                                     @RequestParam(name = "userName") String userName,
                                     @RequestParam(name = "phoneNumber") String phoneNumber,
                                     @RequestParam(name = "addressA") String addressA,
                                     @RequestParam(name = "addressB") String addressB,
                                     @RequestParam(name = "addressC") String addressC,
                                     @RequestParam(name = "addressD") String addressD){
        Map map = new HashMap();
        map.put("userId", userId);
        map.put("userName", userName);
        map.put("phoneNumber", phoneNumber);
        map.put("addressA", addressA);
        map.put("addressB", addressB);
        map.put("addressC", addressC);
        map.put("addressD", addressD);
        map.put("status", 0);
        map.put("isDel", 0);
        map.put("creator", "zhao");

        return miniAppService.addUserAddress(map);
    }

    @PostMapping("addOrder.json")
    @ResponseBody
    public JSONObject addOrder(@RequestParam(name = "userId", defaultValue = "1") Long userId,
                                     @RequestParam(name = "addressId") Long addressId,
                                     @RequestParam(name = "amount") BigDecimal amount,
                                     @RequestParam(name = "dispatchType") Integer dispatchType,
                                     @RequestParam(name = "message") String message,
                                     @RequestParam(name = "ids") String ids
    ){
        Map map = new HashMap();
        map.put("order_number", System.currentTimeMillis());
        map.put("user_id", userId);
        map.put("address_id", addressId);
        map.put("amount", amount);
        map.put("dispatch_type", dispatchType);
        map.put("message", message);
        map.put("ids", ids);
        return miniAppService.addOrder(map);
    }


    @GetMapping("getOrders.json")
    @ResponseBody
    public JSONArray getUserOrders(@RequestParam(name = "userId", defaultValue = "1") Long userId){
        return miniAppService.getUserOrders(userId);
    }

}
