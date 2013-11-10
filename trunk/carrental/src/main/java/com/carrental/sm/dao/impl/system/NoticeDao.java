package com.carrental.sm.dao.impl.system;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrental.sm.bean.system.Notice;
import com.carrental.sm.dao.system.INoticeDao;

/**
 * @author 张霄鹏
 * 
 */
@Repository
public class NoticeDao implements INoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Notice> queryList(Map<String, Object> params) {
		return this.sqlSession.selectList("noticeNpc.queryList", params);
	}

	public List<Notice> queryEqualsList(Map<String, Object> params) {
		return this.sqlSession.selectList("noticeNpc.queryEqualsList", params);
	}

	public Integer count(Map<String, Object> params) {
		return this.sqlSession.selectOne("noticeNpc.count", params);
	}

	public String add(Notice notice) {
		this.sqlSession.insert("noticeNpc.add", notice);
		return String.valueOf(notice.getId());
	}

	public Integer update(Notice notice) {
		return this.sqlSession.update("noticeNpc.update", notice);
	}

	public Integer delete(String ids) {
		return this.sqlSession.delete("noticeNpc.delete", ids);
	}

}
