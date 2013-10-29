package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.dao.system.IAdminDao;

/**
 * 系统用户管理
 * 
 * @author 张霄鹏
 */
@Repository
public class AdminDao implements IAdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Admin> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("adminNpc.queryList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("adminNpc.count", params);
	}

	public List<Admin> queryByLoginName(Map<String, Object> params) {
		return this.sqlSession.selectList("adminNpc.queryByLoginName", params);
	}

}
