package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Captcha;

/**
 * 验证码管理
 * 
 * @author 张霄鹏
 */
public interface ICaptchaDao {

	/**
	 * 条件查询全部验证码信息
	 * 
	 * @author 张霄鹏
	 * @return List<Captcha>
	 * @param params
	 *            :pager,captcha
	 */
	List<Captcha> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :captcha
	 */
	Integer countEquals(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Captcha captcha);

	/**
	 * 修改已使用
	 * 
	 * @author 张霄鹏
	 */
	Integer updateUsed(Captcha captcha);
}
