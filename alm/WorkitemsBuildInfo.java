package com.rabit.alm;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "build")
public class WorkitemsBuildInfo {
	private ArrayList<CommitedWorkitem> commitedWorkitems;
	private String buildNumber;
	private String buildDate;
	private String almType;
	/**
	 * @return the commitedWorkitems
	 */
	public ArrayList<CommitedWorkitem> getCommitedWorkitems() {
		return commitedWorkitems;
	}
	/**
	 * @param commitedWorkitems the commitedWorkitems to set
	 */
	@XmlElement(name="commitedworkitem")
	public void setCommitedWorkitems(ArrayList<CommitedWorkitem> commitedWorkitems) {
		this.commitedWorkitems = commitedWorkitems;
	}
	/**
	 * @return the buildNumber
	 */
	public String getBuildNumber() {
		return buildNumber;
	}
	/**
	 * @param buildNumber the buildNumber to set
	 */
	@XmlAttribute(name ="number")
	public void setBuildNumber(String buildNumber) {
		this.buildNumber = buildNumber;
	}
	/**
	 * @return the buildDate
	 */
	public String getBuildDate() {
		return buildDate;
	}
	/**
	 * @param buildDate the buildDate to set
	 */
	@XmlAttribute(name ="date")
	public void setBuildDate(String buildDate) {
		this.buildDate = buildDate;
	}
	/**
	 * @return the almType
	 */
	public String getAlmType() {
		return almType;
	}
	/**
	 * @param almType the almType to set
	 */
	@XmlAttribute(name ="almtype")
	public void setAlmType(String almType) {
		this.almType = almType;
	}

}
