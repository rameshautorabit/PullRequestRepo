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
@XmlRootElement(name="projects")
public class ALMProjects {
	
	private ArrayList<ALMProject> projects;

	/**
	 * @return the projects
	 */
	public ArrayList<ALMProject> getProjects() {
		return projects;
	}

	/**
	 * @param projects the projects to set
	 */
	@XmlElement(name="project")
	public void setProjects(ArrayList<ALMProject> projects) {
		this.projects = projects;
	}

}
