package com.carrental.sm.dao.system;

import java.util.List;

import com.carrental.sm.bean.system.User;

/**
 * 用户管理
 * 
 * @author 张霄鹏
 */
public interface IUserDao {

	/**
	 * 条件查询全部用户信息
	 * 
	 * @return List<User>
	 */
	List<User> queryList(User user);

}
