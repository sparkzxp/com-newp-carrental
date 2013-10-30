package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Log;
import com.carrental.sm.dao.system.ILogDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class LogDao implements ILogDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Log> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("logNpc.queryList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("logNpc.count", params);
	}

	public String add(Log log) {
		this.sqlSession.insert("logNpc.add", log);
		return String.valueOf(log.getId());
	}

}
