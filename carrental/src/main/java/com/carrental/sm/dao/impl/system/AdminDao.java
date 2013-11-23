package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.dao.system.IAdminDao;

/**
 * 系统用户管理
 * 
 * @author 张霄鹏
 */
@Repository
public class AdminDao implements IAdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Admin> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("adminNpc.queryList", params);
	}

	public List<Admin> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("adminNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("adminNpc.count", params);
	}

	public Integer countEquals(Map<String, Object> params) {
		return this.sqlSession.selectOne("adminNpc.countEquals", params);
	}

	public Integer countByCityIds(String cityIds) {
		return this.sqlSession.selectOne("adminNpc.countByCityIds", cityIds);
	}

	public Integer countByRoleIds(String roleIds) {
		return this.sqlSession.selectOne("adminNpc.countByRoleIds", roleIds);
	}

	public List<Admin> queryByLoginName(Map<String, Object> params) {
		return this.sqlSession.selectList("adminNpc.queryByLoginName", params);
	}

	public String add(Admin admin) {
		this.sqlSession.insert("adminNpc.add", admin);
		return String.valueOf(admin.getId());
	}

	public Integer update(Admin admin) {
		return this.sqlSession.update("adminNpc.update", admin);
	}

	public Integer updatePart(Admin admin) {
		return this.sqlSession.update("adminNpc.updatePart", admin);
	}

	public Integer deleteAll(String ids) {
		return this.sqlSession.update("adminNpc.deleteAll", ids);
	}

	public Integer intoBlacklist(String ids) {
		return this.sqlSession.update("adminNpc.intoBlacklist", ids);
	}

	public Integer outofBlacklist(String ids) {
		return this.sqlSession.update("adminNpc.outofBlacklist", ids);
	}

	public Integer resetPwd(Map<String, Object> params) {
		return this.sqlSession.update("adminNpc.resetPwd", params);
	}

}
