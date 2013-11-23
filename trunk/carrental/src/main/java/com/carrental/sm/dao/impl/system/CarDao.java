package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Car;
import com.carrental.sm.dao.system.ICarDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class CarDao implements ICarDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Car> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("carNpc.queryList", params);
	}

	public List<Car> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("carNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("carNpc.count", params);
	}

	public Integer countEquals(Map<String, Object> params) {
		return this.sqlSession.selectOne("carNpc.countEquals", params);
	}

	public Integer countByCarSeriesIds(String carSeriesIds) {
		return this.sqlSession.selectOne("carNpc.countByCarSeriesIds", carSeriesIds);
	}

	public String add(Car car) {
		this.sqlSession.insert("carNpc.add", car);
		return String.valueOf(car.getId());
	}

	public Integer update(Car car) {
		return this.sqlSession.update("carNpc.update", car);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("carNpc.delete", ids);
	}

}
