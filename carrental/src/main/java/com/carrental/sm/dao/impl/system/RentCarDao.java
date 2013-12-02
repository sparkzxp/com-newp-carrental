package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.dao.system.IRentCarDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class RentCarDao implements IRentCarDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<RentCar> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("rentCarNpc.queryList", params);
	}

	public List<RentCar> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("rentCarNpc.queryEqualsList", params);
	}

	public List<RentCar> queryUncomfirmList(Map<String, Object> params) {
		return this.sqlSession.selectList("rentCarNpc.queryUncomfirmList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("rentCarNpc.count", params);
	}

	public Integer countEquals(Map<String, Object> params) {
		return this.sqlSession.selectOne("rentCarNpc.countEquals", params);
	}

	public Integer countByCarIds(String carIds) {
		return this.sqlSession.selectOne("rentCarNpc.countByCarIds", carIds);
	}

	public Integer countByDriverIds(String driverIds) {
		return this.sqlSession.selectOne("rentCarNpc.countByDriverIds", driverIds);
	}

	public Integer countByCouponIds(String couponIds) {
		return this.sqlSession.selectOne("rentCarNpc.countByCouponIds", couponIds);
	}

	public Integer countByBusinessIds(String businessIds) {
		return this.sqlSession.selectOne("rentCarNpc.countByBusinessIds", businessIds);
	}

	public Integer countByRentTypeIds(String rentTypeIds) {
		return this.sqlSession.selectOne("rentCarNpc.countByRentTypeIds", rentTypeIds);
	}

	public String add(RentCar rentCar) {
		this.sqlSession.insert("rentCarNpc.add", rentCar);
		return String.valueOf(rentCar.getId());
	}

	public Integer update(RentCar rentCar) {
		return this.sqlSession.update("rentCarNpc.update", rentCar);
	}

	public Integer updatePart(RentCar rentCar) {
		return this.sqlSession.update("rentCarNpc.updatePart", rentCar);
	}

	public Integer cancelRentCar(String ids) {
		return this.sqlSession.update("rentCarNpc.cancelRentCar", ids);
	}

}
