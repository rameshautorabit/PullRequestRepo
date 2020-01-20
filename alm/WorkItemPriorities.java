/**
 * 
 */
package com.rabit.alm;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author sreenivasrao.m
 *
 */
@XmlRootElement(name="priorities")
public class WorkItemPriorities {
	
	private ArrayList<WorkItemPriority> priorities;

	/**
	 * @return the priorities
	 */
	public ArrayList<WorkItemPriority> getPriorities() {
		return priorities;
	}

	/**
	 * @param priorities the priorities to set
	 */
	@XmlElement(name="priority")
	public void setPriorities(ArrayList<WorkItemPriority> priorities) {
		this.priorities = priorities;
	}

}
