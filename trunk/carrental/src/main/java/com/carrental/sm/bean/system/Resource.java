package com.carrental.sm.bean.system;

/**
 * @author 张霄鹏
 * 
 */
public class Resource extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String name;
	private String type;// 资源类型：left-1：左侧一级菜单，left-2：左侧二级菜单
	private String parentId;

	public Resource() {
		super();
	}

	public Resource(String type) {
		super();
		this.type = type;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
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
	 * @return the parentId
	 */
	public String getParentId() {
		return parentId;
	}

	/**
	 * @param parentId
	 *            the parentId to set
	 */
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
}
