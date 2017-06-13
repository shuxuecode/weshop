package com.zsx.web.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zsx.web.dao.UserMapper;
import com.zsx.web.entity.User;
import com.zsx.web.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	
	public User searchById(Long id){
		return userMapper.selectByPrimaryKey(id);
	}
	
	public int insert(User user) {
		return userMapper.insert(user);
	}
	
	public int delete(Long id){
		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Map<String, Object>> executeSQL(String sql) {
		// TODO Auto-generated method stub
		return userMapper.executeSQL(sql);
	}
	
}