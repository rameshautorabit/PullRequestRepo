/**
 * 
 */
package com.rabit.alm;

import java.util.Comparator;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * @author sreenivasrao.m
 *
 */
@XmlRootElement(name="status")
public class WorkItemStatus implements Comparator<WorkItemStatus> {
	
	private String id;
	private String name;
	private String type;
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
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	@XmlAttribute
	public void setType(String type) {
		this.type = type;
	}
	public int compare(WorkItemStatus workstatus1, WorkItemStatus workstatus2) {
	      String status1 = workstatus1.getName().toUpperCase();
	      String status2 = workstatus2.getName().toUpperCase();
	      //ascending order
	      return status1.compareTo(status2);
	}

}
