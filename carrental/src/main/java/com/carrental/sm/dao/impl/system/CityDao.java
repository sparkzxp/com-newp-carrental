package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.City;
import com.carrental.sm.dao.system.ICityDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class CityDao implements ICityDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<City> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("cityNpc.queryList", params);
	}

	public List<City> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("cityNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("cityNpc.count", params);
	}

	public String add(City city) {
		this.sqlSession.insert("cityNpc.add", city);
		return String.valueOf(city.getId());
	}

	public Integer update(City city) {
		return this.sqlSession.update("cityNpc.update", city);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("cityNpc.delete", ids);
	}

}
