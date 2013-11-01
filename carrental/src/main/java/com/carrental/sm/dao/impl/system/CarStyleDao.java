package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.CarStyle;
import com.carrental.sm.dao.system.ICarStyleDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class CarStyleDao implements ICarStyleDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<CarStyle> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("carStyleNpc.queryList", params);
	}

	public List<CarStyle> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("carStyleNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("carStyleNpc.count", params);
	}

	public String add(CarStyle carStyle) {
		this.sqlSession.insert("carStyleNpc.add", carStyle);
		return String.valueOf(carStyle.getId());
	}

	public Integer update(CarStyle carStyle) {
		return this.sqlSession.update("carStyleNpc.update", carStyle);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("carStyleNpc.delete", ids);
	}

}
