package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Dictionary;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.IDictionaryDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.service.system.IDictionaryService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class DictionaryService implements IDictionaryService {

	@Autowired
	private IDictionaryDao dictDao;
	@Autowired
	private ILogDao logDao;

	public List<Dictionary> queryList(Dictionary dict, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dict", dict);

		if (pager != null) {
			pager.setTotalSize(this.dictDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return dictDao.queryList(params);
	}

	public String add(Dictionary dict, Admin loginUser) {
		String _check = checkExist(dict);
		if (!_check.equals("FALSE")) {
			return _check;
		}
		this.dictDao.add(dict);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增字典表信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + dict.getName() + " 的字典表信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Dictionary dict, Admin loginUser) {
		String _check = checkExist(dict);
		if (!_check.equals("FALSE")) {
			return _check;
		}
		this.dictDao.update(dict);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改字典表信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + dict.getName() + " 的字典表信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// TODO 验证是否被使用
		this.dictDao.delete(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除字典表信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了名为：" + names + " 的字典表信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证字典表名称或值是否存在
	 * 
	 * @author 张霄鹏
	 * @return 不存在：FALSE
	 */
	private String checkExist(Dictionary dict) {
		Dictionary _dict = new Dictionary();
		_dict.setName(dict.getName());
		_dict.setTypeValue(dict.getTypeValue());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dict", _dict);
		List<Dictionary> dicts = this.dictDao.queryEqualsList(params);
		if (CollectionUtils.isNotEmpty(dicts)) {
			if (StringUtils.isEmpty(dict.getId())) {
				// add
				if (dicts.size() > 0) {
					return "名称已存在";
				}
			} else {
				// update
				if (dicts.size() > 1) {
					return "名称已存在";
				} else if (!dicts.get(0).getId().equals(dict.getId())) {
					return "名称已存在";
				}
			}
		}

		_dict.setName("");
		_dict.setValue(dict.getValue());
		params.put("dict", _dict);
		dicts = this.dictDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(dicts)) {
			return "FALSE";
		} else if (StringUtils.isEmpty(dict.getId())) {
			// add
			if (dicts.size() > 0) {
				return "值已存在";
			} else {
				return "FALSE";
			}
		} else {
			// update
			if (dicts.size() > 1) {
				return "值已存在";
			} else if (dicts.get(0).getId().equals(dict.getId())) {
				return "FALSE";
			} else {
				return "值已存在";
			}
		}
	}

}
