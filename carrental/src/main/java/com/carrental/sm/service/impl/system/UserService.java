package com.carrental.sm.service.impl.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.User;
import com.carrental.sm.dao.system.IUserDao;
import com.carrental.sm.service.system.IUserService;

/**
 * 用户管理
 * 
 * @author 张霄鹏
 */
@Service
public class UserService implements IUserService {

	@Autowired
	private IUserDao userDao;

	public List<User> queryList(User user) {
		return userDao.queryList(user);
	}

}
