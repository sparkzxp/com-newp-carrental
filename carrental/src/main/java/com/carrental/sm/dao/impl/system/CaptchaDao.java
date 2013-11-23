package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Captcha;
import com.carrental.sm.dao.system.ICaptchaDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class CaptchaDao implements ICaptchaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Captcha> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("captchaNpc.queryList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("captchaNpc.count", params);
	}

	public String add(Captcha captcha) {
		this.sqlSession.insert("captchaNpc.add", captcha);
		return String.valueOf(captcha.getId());
	}

	public Integer update(Captcha captcha) {
		return this.sqlSession.update("captchaNpc.update", captcha);
	}

	public Integer updateUsed(Captcha captcha) {
		return this.sqlSession.update("captchaNpc.updateUsed", captcha);
	}

}
