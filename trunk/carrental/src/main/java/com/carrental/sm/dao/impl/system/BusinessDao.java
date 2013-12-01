package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Business;
import com.carrental.sm.dao.system.IBusinessDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class BusinessDao implements IBusinessDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Business> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("businessNpc.queryList", params);
	}

	public List<Business> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("businessNpc.queryEqualsList", params);
	}

	public List<Business> queryHotRentList(Map<String, Object> params) {
		return this.sqlSession.selectList("businessNpc.queryHotRentList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("businessNpc.count", params);
	}

	public Integer countEquals(Map<String, Object> params) {
		return this.sqlSession.selectOne("businessNpc.countEquals", params);
	}

	public String add(Business business) {
		this.sqlSession.insert("businessNpc.add", business);
		return String.valueOf(business.getId());
	}

	public Integer update(Business business) {
		return this.sqlSession.update("businessNpc.update", business);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("businessNpc.delete", ids);
	}

}
