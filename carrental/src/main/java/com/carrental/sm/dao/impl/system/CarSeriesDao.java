package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.CarSeries;
import com.carrental.sm.dao.system.ICarSeriesDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class CarSeriesDao implements ICarSeriesDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<CarSeries> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("carSeriesNpc.queryList", params);
	}

	public List<CarSeries> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("carSeriesNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("carSeriesNpc.count", params);
	}

	public String add(CarSeries carSeries) {
		this.sqlSession.insert("carSeriesNpc.add", carSeries);
		return String.valueOf(carSeries.getId());
	}

	public Integer update(CarSeries carSeries) {
		return this.sqlSession.update("carSeriesNpc.update", carSeries);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("carSeriesNpc.delete", ids);
	}

}
