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
@XmlRootElement(name="workitemtypes")
public class WorkItemTypes {
	
	private ArrayList<WorkItemType> workitemtypes;

	/**
	 * @return the workitemtypes
	 */
	public ArrayList<WorkItemType> getWorkitemtypes() {
		return workitemtypes;
	}

	/**
	 * @param workitemtypes the workitemtypes to set
	 */
	@XmlElement(name="workitemtype")
	public void setWorkitemtypes(ArrayList<WorkItemType> workitemtypes) {
		this.workitemtypes = workitemtypes;
	}

}
