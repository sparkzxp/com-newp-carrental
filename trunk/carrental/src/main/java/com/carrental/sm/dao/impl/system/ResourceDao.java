package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Resource;
import com.carrental.sm.dao.system.IResourceDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class ResourceDao implements IResourceDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Resource> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("resourceNpc.queryList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("resourceNpc.count", params);
	}

	public String add(Resource resource) {
		this.sqlSession.insert("resourceNpc.add", resource);
		return String.valueOf(resource.getId());
	}

	public Integer update(Resource resource) {
		return this.sqlSession.update("resourceNpc.update", resource);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("resourceNpc.delete", ids);
	}

}
