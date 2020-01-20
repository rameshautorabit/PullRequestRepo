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
@XmlRootElement(name="workitemtype")
public class WorkItemType implements Comparator<WorkItemType>{
	
	private String id;
	private String name;
	private String displayname;
	private WorkItemStatuses statuses;
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
	/**
	 * @return the statuses
	 */
	public WorkItemStatuses getStatuses() {
		return statuses;
	}
	/**
	 * @param statuses the statuses to set
	 */
	public void setStatuses(WorkItemStatuses statuses) {
		this.statuses = statuses;
	}
	public int compare(WorkItemType workstatus1, WorkItemType workstatus2) {
	      String status1 = workstatus1.getName().toUpperCase();
	      String status2 = workstatus2.getName().toUpperCase();
	      //ascending order
	      return status1.compareTo(status2);
	}

}
