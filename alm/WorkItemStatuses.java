/**
 * 
 */
package com.rabit.alm;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author sreenivasrao.m
 *
 */
@XmlRootElement(name="statuses")
public class WorkItemStatuses {
	
	private List<WorkItemStatus> statuses;

	/**
	 * @return the statuses
	 */
	public List<WorkItemStatus> getStatuses() {
		return statuses;
	}

	/**
	 * @param statuses the statuses to set
	 */
	@XmlElement(name="status")
	public void setStatuses(List<WorkItemStatus> statuses) {
		this.statuses = statuses;
	}

}
