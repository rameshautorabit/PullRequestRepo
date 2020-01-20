package com.rabit.alm;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="gitrepoworkitem")
public class GITRepoWorkItem {

	private String storyId;
	private String commitType;
	private String URL;
	private String revisionNum;
	private String createdDate;
	private String assigne;
	public String getStoryId() {
		return storyId;
	}
	
	@XmlAttribute
	public void setStoryId(String storyId) {
		this.storyId = storyId;
	}
	public String getCommitType() {
		return commitType;
	}
	
	@XmlAttribute 
	public void setCommitType(String commitType) {
		this.commitType = commitType;
	}
	public String getURL() {
		return URL;
	}
	
	@XmlAttribute(name="URL")
	public void setURL(String URL) {
		this.URL = URL;
	}
	public String getRevisionNum() {
		return revisionNum;
	}
	
	@XmlAttribute
	public void setRevisionNum(String revisionNum) {
		this.revisionNum = revisionNum;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	
	@XmlAttribute
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getAssigne() {
		return assigne;
	}

	@XmlAttribute
	public void setAssigne(String assigne) {
		this.assigne = assigne;
	}
	
}
