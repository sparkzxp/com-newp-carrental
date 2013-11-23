package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Coupon;
import com.carrental.sm.dao.system.ICouponDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class CouponDao implements ICouponDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Coupon> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("couponNpc.queryList", params);
	}

	public List<Coupon> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("couponNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("couponNpc.count", params);
	}

	public Integer countEquals(Map<String, Object> params) {
		return this.sqlSession.selectOne("couponNpc.countEquals", params);
	}

	public String add(Coupon coupon) {
		this.sqlSession.insert("couponNpc.add", coupon);
		return String.valueOf(coupon.getId());
	}

	public Integer update(Coupon coupon) {
		return this.sqlSession.update("couponNpc.update", coupon);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("couponNpc.delete", ids);
	}

	public String addCarSeriesList(Coupon coupon) {
		this.sqlSession.insert("couponNpc.addCarSeriesList", coupon);
		return String.valueOf(coupon.getId());
	}

	public Integer deleteCarSeriesList(String couponIds) {
		return this.sqlSession.delete("couponNpc.deleteCarSeriesList", couponIds);
	}

}
