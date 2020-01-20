/**
 * 
 */
package com.rabit.alm;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author Ramesh.m
 *
 */
@XmlRootElement(name="PlannedForTypes")
public class PlannedForTypes {
	
	private ArrayList<PlannedForType> plannedfortypes;

	/**
	 * @return the plannedfortypes
	 */
	public ArrayList<PlannedForType> getPlannedfortypes() {
		return plannedfortypes;
	}

	/**
	 * @param plannedfortypes the plannedfortypes to set
	 */
	@XmlElement(name="PlannedFor")
	public void setPlannedfortypes(ArrayList<PlannedForType> plannedfortypes) {
		this.plannedfortypes = plannedfortypes;
	}

	
}
