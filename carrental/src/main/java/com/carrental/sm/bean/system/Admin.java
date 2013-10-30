package com.carrental.sm.bean.system;

/**
 * 系统用户实体
 * 
 * @author 张霄鹏
 */
public class Admin extends BaseBean {

	private static final long serialVersionUID = 1L;
	private String adminName;// 姓名
	private String loginName;// 登录名
	private String password;// 密码
	private String type;// 用户类型，CUSTOM：注册用户，ADMIN：系统用户
	private String isDelete;// 是否删除

	public Admin() {
		super();
	}

	public Admin(String id) {
		super();
		this.id = id;
	}

	/**
	 * @return the adminName
	 */
	public String getAdminName() {
		return adminName;
	}

	/**
	 * @param adminName
	 *            the adminName to set
	 */
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	/**
	 * @return the loginName
	 */
	public String getLoginName() {
		return loginName;
	}

	/**
	 * @param loginName
	 *            the loginName to set
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type
	 *            the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the isDelete
	 */
	public String getIsDelete() {
		return isDelete;
	}

	/**
	 * @param isDelete
	 *            the isDelete to set
	 */
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
}
