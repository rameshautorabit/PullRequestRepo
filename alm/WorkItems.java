/**
 * 
 */
package com.rabit.alm;

import java.util.TreeSet;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author sreenivasrao.m
 *
 * 
 * modified
 * @author sampath.c
 */
@XmlRootElement(name="workitems")
public class WorkItems {
	
	private TreeSet<WorkItem> workitems;

	/**
	 * @return the workitems
	 */
	public TreeSet<WorkItem> getWorkitems() {
		return workitems;
	}

	/**
	 * @param workitems the workitems to set
	 */
	@XmlElement(name="workitem")
	public void setWorkitems(TreeSet<WorkItem> workitems) {
		this.workitems = workitems;
	}

}
