package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Captcha;
import com.carrental.sm.common.bean.Pager;

/**
 * 系统用户管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface IAdminService {

	/**
	 * 登录名查询用户信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 */
	List<Admin> queryByLoginName(Admin admin);

	/**
	 * 查询用户信息
	 */
	List<Admin> queryList(Admin admin, Pager pager);

	/**
	 * 条件查询全部用户信息
	 * 
	 * @author 张霄鹏
	 * @return List<Admin>
	 */
	List<Admin> queryEqualsList(Admin admin, Pager pager);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String add(Admin admin, Admin loginUser);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String update(Admin admin, Admin loginUser);

	/**
	 * 部分修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String updatePart(Admin admin, Admin loginUser);

	/**
	 * 批量删除-假删
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String delete(String ids, String names, Admin loginUser);

	/**
	 * 加入黑名单
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String intoBlacklist(String ids, String names, Admin loginUser);

	/**
	 * 从黑名单删除
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String outofBlacklist(String ids, String names, Admin loginUser);

	/**
	 * 批量修改密码
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String resetPwds(String ids, String names, String password, Admin loginUser);

	/**
	 * 用户注册，需验证短信验证码
	 * 
	 * @author 张霄鹏
	 */
	String add(Admin user, Captcha captcha);

	/**
	 * WEB用户修改密码
	 * 
	 * @author 张霄鹏
	 * @param user
	 *            :id,name,password
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String resetPwd(Admin user, Captcha captcha, Admin loginUser);
}
