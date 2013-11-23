package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.BusinessDesc;
import com.carrental.sm.dao.system.IBusinessDescDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class BusinessDescDao implements IBusinessDescDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<BusinessDesc> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("businessDescNpc.queryEqualsList", params);
	}

	public Integer update(BusinessDesc businessDesc) {
		return this.sqlSession.update("businessDescNpc.update", businessDesc);
	}

}
