package com.zsx.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zsx.web.entity.User;

public interface UserMapper {
	

    int insert(User user);

    User selectByPrimaryKey(@Param(value="id")Long id);

    int deleteByPrimaryKey(@Param(value="id")Long id);

    /**
	 * 执行通用的sql
	 * @param sql  
	 * @return
	 */
	List<Map<String, Object>> executeSQL(@Param(value="sql") String sql);
	
}