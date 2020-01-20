/**
 * 
 */
package com.rabit.alm;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author Ramesh.m
 *
 */
@XmlRootElement(name="PlannedFor")
public class PlannedForType {
	
	private String id;
	private String name;
	private String displayname;
	
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	@XmlAttribute
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	@XmlAttribute
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the displayname
	 */
	public String getDisplayname() {
		return displayname;
	}
	/**
	 * @param displayname the displayname to set
	 */
	@XmlAttribute
	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}

}
