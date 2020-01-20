/**
 * 
 */
package com.rabit.alm;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author sreenivasrao.m
 *
 */
@XmlRootElement(name="project")
public class ALMProject {
	/**
	 * Project ID
	 */
	private String id;
	/**
	 * Project Name
	 */
	private String name;
	/**
	 * Project Key
	 */
	private String key;
	
	public ALMProject(){
		
	}
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
	public void setId(String projectId) {
		this.id = projectId;
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
	public void setName(String projectName) {
		this.name = projectName;
	}
	/**
	 * @return the key
	 */
	public String getKey() {
		return key;
	}
	/**
	 * @param key the key to set
	 */
	@XmlAttribute
	public void setKey(String projectKey) {
		this.key = projectKey;
	}

}
