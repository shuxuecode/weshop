package com.miniApp.service.impl;

import com.alibaba.fastjson.JSONArray;
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
    public JSONArray getAllGoods() {
        JSONArray array = new JSONArray();
        String sql = "SELECT id, shortName, image, price FROM w_goods";
        List<Map<String, Object>> list = userMapper.executeSQL(sql);
        for (Map<String, Object> map : list) {
            array.add(map);
        }
        return array;
    }
}
