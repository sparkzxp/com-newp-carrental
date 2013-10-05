package com.carrental.sm.common;

/**
 * 常量
 * 
 * @author 张霄鹏
 * @date 2012-12-29
 */
public interface ConstantUtil {
	/**
	 * 隐患业务请求参数_隐患基本信息页面
	 */
	String HAZARD_REQUEST_BASE = "base";
	/**
	 * 隐患业务请求参数_隐患制定整改计划页面
	 */
	String HAZARD_REQUEST_PLAN = "plan";
	/**
	 * 隐患业务请求参数_隐患复查页面
	 */
	String HAZARD_REQUEST_REVIEW = "review";
	/**
	 * 隐患业务请求参数_隐患销案页面
	 */
	String HAZARD_REQUEST_CLOSECASE = "closeCase";
	/**
	 * 隐患业务请求参数_隐患上报页面
	 */
	String HAZARD_REQUEST_REQUEST = "request";
	/**
	 * 隐患业务请求参数_已整改隐患管理
	 */
	String HAZARD_REQUEST_END = "end";
	/**
	 * 隐患业务请求参数_上报隐患管理
	 */
	String HAZARD_REQUEST_MANAGER = "manager";

	/**
	 * 角色code 系统用户
	 */
	String ROLE_CODE_ADMIN = "admin";
	/**
	 * 角色code 政府用户
	 */
	String ROLE_CODE_GOVERNMENT = "government";

	/**
	 * 角色code 企业用户
	 */
	String ROLE_CODE_ENTERPRISE = "enterprise";

	/**
	 * 顶级机构编码
	 */
	String ORG_DEFAULT_CODE = "DEFAULT_ORG";

	/**
	 * 顶级机构名称
	 */
	String ORG_DEFAULT_NAME = "Default Organization";

	/**
	 * 消息类型
	 */
	String MSG_TYPE = "MSG_TYPE";

	/**
	 * 消息类型_系统公告
	 */
	String MSG_TYPE_SYS_NOTICE = "SYS_NOTICE";

	/**
	 * 消息类型_站内消息
	 */
	String MSG_TYPE_USER_MSG = "USER_MSG";
	/**
	 * 消息状态
	 */
	String MSG_STATUS = "MSG_STATUS";
	/**
	 * 消息状态_已归档
	 */
	String MSG_STATUS_ARCHIVED = "ARCHIVED";
	/**
	 * 消息状态_草稿
	 */
	String MSG_STATUS_DRAFT = "DRAFT";
	/**
	 * 消息状态_已发布
	 */
	String MSG_STATUS_PUBLISHED = "PUBLISHED";

	/**
	 * 消息阅读状态
	 */
	String MSG_READ_STATUS = "MSG_READ_STATUS";
	/**
	 * 消息阅读状态_已读
	 */
	String MSG_READ_STATUS_READ = "READ";

	/**
	 * 消息阅读状态_未读
	 */
	String MSG_READ_STATUS_UNREAD = "UNREAD";

	/**
	 * 消息阅读状态_已删除
	 */
	String MSG_READ_STATUS_DELETED = "DELETED";

	/**
	 * 消息用户类型
	 */
	String MSG_USER_ROLE = "MSG_USER_ROLE";
	/**
	 * 消息用户类型_发送者
	 */
	String MSG_USER_ROLE_SENDER = "SENDER";

	/**
	 * 消息用户类型_接受者
	 */
	String MSG_USER_ROLE_RECEIVER = "RECEIVER";

	/**
	 * 消息用户类型_被抄送者
	 */
	String MSG_USER_ROLE_CC = "CC";

	/**
	 * 消息用户类型_被密送者
	 */
	String MSG_USER_TYPE_BCC = "BCC";

}
