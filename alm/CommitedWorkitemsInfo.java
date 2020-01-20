package com.rabit.alm;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "workitems")
public class CommitedWorkitemsInfo {
	private ArrayList<WorkitemsBuildInfo> workitemsBuildInfo;

	/**
	 * @return the workitemsBuildInfo
	 */
	public ArrayList<WorkitemsBuildInfo> getWorkitemsBuildInfo() {
		return workitemsBuildInfo;
	}

	/**
	 * @param workitemsBuildInfo the workitemsBuildInfo to set
	 */
	@XmlElement(name = "build")
	public void setWorkitemsBuildInfo(ArrayList<WorkitemsBuildInfo> workitemsBuildInfo) {
		this.workitemsBuildInfo = workitemsBuildInfo;
	}
	
}
