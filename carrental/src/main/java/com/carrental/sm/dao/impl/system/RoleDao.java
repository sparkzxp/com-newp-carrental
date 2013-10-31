package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Role;
import com.carrental.sm.dao.system.IRoleDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class RoleDao implements IRoleDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Role> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("roleNpc.queryList", params);
	}

	public List<Role> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("roleNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("roleNpc.count", params);
	}

	public String add(Role role) {
		this.sqlSession.insert("roleNpc.add", role);
		return String.valueOf(role.getId());
	}

	public Integer update(Role role) {
		return this.sqlSession.update("roleNpc.update", role);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("roleNpc.delete", ids);
	}

	public String addResources(Role role) {
		this.sqlSession.insert("roleNpc.addResources", role);
		return String.valueOf(role.getId());
	}

	public Integer deleteResources(String roleIds) {
		return this.sqlSession.delete("roleNpc.deleteResources", roleIds);
	}

}
