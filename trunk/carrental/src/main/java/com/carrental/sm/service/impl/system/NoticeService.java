package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.Notice;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.IAdminDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.INoticeDao;
import com.carrental.sm.dao.system.IRoleDao;
import com.carrental.sm.service.system.INoticeService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class NoticeService implements INoticeService {

	@Autowired
	private INoticeDao noticeDao;
	@Autowired
	private ILogDao logDao;
	@Autowired
	private IAdminDao adminDao;
	@Autowired
	private IRoleDao roleDao;

	public List<Notice> queryList(Notice notice, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("notice", notice);

		if (pager != null) {
			pager.setTotalSize(this.noticeDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return noticeDao.queryList(params);
	}

	public String add(Notice notice, Admin loginUser) {
		this.noticeDao.add(notice);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增公告信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了标题为：" + notice.getTitle() + " 的公告信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Notice notice, Admin loginUser) {
		this.noticeDao.update(notice);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改公告信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了标题为：" + notice.getTitle() + " 的公告信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		this.noticeDao.delete(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除公告信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了标题为：" + names + " 的公告信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}
}
