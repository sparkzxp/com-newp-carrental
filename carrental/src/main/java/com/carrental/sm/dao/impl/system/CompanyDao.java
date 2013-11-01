package com.carrental.sm.dao.impl.system;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Company;
import com.carrental.sm.dao.system.ICompanyDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class CompanyDao implements ICompanyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Company> queryList() {
		return this.sqlSession.selectList("companyNpc.queryList");
	}

	public String add(Company company) {
		this.sqlSession.insert("companyNpc.add", company);
		return String.valueOf(company.getId());
	}

	public Integer update(Company company) {
		return this.sqlSession.update("companyNpc.update", company);
	}
}
