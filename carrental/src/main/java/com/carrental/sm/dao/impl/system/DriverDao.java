package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Driver;
import com.carrental.sm.dao.system.IDriverDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class DriverDao implements IDriverDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Driver> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("driverNpc.queryList", params);
	}

	public List<Driver> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("driverNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("driverNpc.count", params);
	}

	public Integer countEquals(Map<String, Object> params) {
		return this.sqlSession.selectOne("driverNpc.countEquals", params);
	}

	public String add(Driver driver) {
		this.sqlSession.insert("driverNpc.add", driver);
		return String.valueOf(driver.getId());
	}

	public Integer update(Driver driver) {
		return this.sqlSession.update("driverNpc.update", driver);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("driverNpc.delete", ids);
	}

}
