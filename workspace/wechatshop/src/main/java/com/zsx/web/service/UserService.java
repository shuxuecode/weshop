package com.zsx.web.service;
import java.util.List;
import java.util.Map;

import com.zsx.web.entity.User;

public interface UserService {

	User searchById(Long id);
	
	int insert(User user);

//	int update(User user);
	
	int delete(Long id);
	
	
	List<Map<String, Object>> executeSQL(String sql);
	
}