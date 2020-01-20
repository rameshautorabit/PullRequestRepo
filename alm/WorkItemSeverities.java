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
@XmlRootElement(name="severities")
public class WorkItemSeverities {
	
	private ArrayList<WorkItemSeverity> severities;

	/**
	 * @return the severities
	 */
	public ArrayList<WorkItemSeverity> getSeverities() {
		return severities;
	}

	/**
	 * @param severities the severities to set
	 */
	@XmlElement(name="severity")
	public void setSeverities(ArrayList<WorkItemSeverity> severities) {
		this.severities = severities;
	}

}
