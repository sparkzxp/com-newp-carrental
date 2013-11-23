package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Dictionary;
import com.carrental.sm.dao.system.IDictionaryDao;

/**
 * @author 张霄鹏
 * 
 */
@Deprecated
@Repository
public class DictionaryDao implements IDictionaryDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Dictionary> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("dictNpc.queryList", params);
	}

	public List<Dictionary> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("dictNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("dictNpc.count", params);
	}

	public Integer countEquals(Map<String, Object> params) {
		return this.sqlSession.selectOne("dictNpc.countEquals", params);
	}

	public String add(Dictionary dict) {
		this.sqlSession.insert("dictNpc.add", dict);
		return String.valueOf(dict.getId());
	}

	public Integer update(Dictionary dict) {
		return this.sqlSession.update("dictNpc.update", dict);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("dictNpc.delete", ids);
	}

}
