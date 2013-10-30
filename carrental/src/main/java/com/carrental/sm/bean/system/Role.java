package com.carrental.sm.bean.system;

import java.util.List;

/**
 * @author 张霄鹏
 * 
 */
public class Role extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String roleName;
	private City city;
	private List<Resource> resources;

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName
	 *            the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
	 * @return the city
	 */
	public City getCity() {
		return city;
	}

	/**
	 * @param city
	 *            the city to set
	 */
	public void setCity(City city) {
		this.city = city;
	}

	/**
	 * @return the resources
	 */
	public List<Resource> getResources() {
		return resources;
	}

	/**
	 * @param resources
	 *            the resources to set
	 */
	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}
}
