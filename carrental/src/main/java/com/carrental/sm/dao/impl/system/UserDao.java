package com.carrental.sm.dao.impl.system;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.User;
import com.carrental.sm.dao.system.IUserDao;

/**
 * 用户管理
 * 
 * @author 张霄鹏
 */
@Repository
public class UserDao implements IUserDao {

	// private SqlMapClientTemplate sqlSession;
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<User> queryList(User user) {
		return this.sqlSession.selectList("userNpc.queryList", user);
	}

}
