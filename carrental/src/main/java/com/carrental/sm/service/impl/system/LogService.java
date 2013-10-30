package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.service.system.ILogService;

/**
 * @author 张霄鹏
 * 
 */
public class LogService implements ILogService {

	@Autowired
	private ILogDao logDao;

	public List<Log> queryList(Log log, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("log", log);

		if (pager != null) {
			pager.setTotalSize(this.logDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return logDao.queryList(params);
	}

	public String add(Log log) {
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

}
