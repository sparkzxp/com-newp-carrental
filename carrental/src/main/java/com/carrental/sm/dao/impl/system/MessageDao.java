package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Message;
import com.carrental.sm.dao.system.IMessageDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class MessageDao implements IMessageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Message> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("messageNpc.queryList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("messageNpc.count", params);
	}

	public String add(Message message) {
		this.sqlSession.insert("messageNpc.add", message);
		return String.valueOf(message.getId());
	}

}
