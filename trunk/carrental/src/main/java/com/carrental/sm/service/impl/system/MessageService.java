package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.carrental.sm.bean.system.Message;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.IMessageDao;
import com.carrental.sm.service.system.IMessageService;

/**
 * @author 张霄鹏
 * 
 */
public class MessageService implements IMessageService {

	@Autowired
	private IMessageDao messageDao;

	public List<Message> queryList(Message message, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("message", message);

		if (pager != null) {
			pager.setTotalSize(this.messageDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return messageDao.queryList(params);
	}

	public String add(Message message) {
		this.messageDao.add(message);
		return Constants.OPERATION_SUCCESS;
	}

}
