package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.RentType;
import com.carrental.sm.dao.system.IRentTypeDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class RentTypeDao implements IRentTypeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<RentType> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("rentTypeNpc.queryList", params);
	}

	public List<RentType> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("rentTypeNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("rentTypeNpc.count", params);
	}

	public String add(RentType rentType) {
		this.sqlSession.insert("rentTypeNpc.add", rentType);
		return String.valueOf(rentType.getId());
	}

	public Integer update(RentType rentType) {
		return this.sqlSession.update("rentTypeNpc.update", rentType);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("rentTypeNpc.delete", ids);
	}

	public String addCarSeriesList(RentType rentType) {
		this.sqlSession.insert("rentTypeNpc.addCarSeriesList", rentType);
		return String.valueOf(rentType.getId());
	}

	public Integer deleteCarSeriesList(String rentTypeIds) {
		return this.sqlSession.delete("rentTypeNpc.deleteCarSeriesList", rentTypeIds);
	}

}
