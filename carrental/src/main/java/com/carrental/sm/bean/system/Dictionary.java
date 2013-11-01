package com.carrental.sm.bean.system;

/**
 * @author 张霄鹏
 * 
 */
public class Dictionary extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String name;
	private String value;
	private String typeName;
	private String typeValue;
	private Dictionary parent;

	public Dictionary() {
		super();
	}

	public Dictionary(String typeValue) {
		super();
		this.typeValue = typeValue;
	}

	public Dictionary(Dictionary parent) {
		super();
		this.parent = parent;
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
	 * @return the value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param value
	 *            the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * @return the typeName
	 */
	public String getTypeName() {
		return typeName;
	}

	/**
	 * @param typeName
	 *            the typeName to set
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/**
	 * @return the typeValue
	 */
	public String getTypeValue() {
		return typeValue;
	}

	/**
	 * @param typeValue
	 *            the typeValue to set
	 */
	public void setTypeValue(String typeValue) {
		this.typeValue = typeValue;
	}

	/**
	 * @return the parent
	 */
	public Dictionary getParent() {
		return parent;
	}

	/**
	 * @param parent
	 *            the parent to set
	 */
	public void setParent(Dictionary parent) {
		this.parent = parent;
	}
}
