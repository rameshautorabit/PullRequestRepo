package com.rabit.alm;

import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="commitedworkitem")
public class CommitedWorkitem {
	private String id;
	private String type;
	private String commitstatus;
	private List<String> revisions;
	private String key;
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	@XmlAttribute
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @return the revisions
	 */
	public List<String> getRevisions() {
		return revisions;
	}
	/**
	 * @param revisions the revisions to set
	 */
	public void setRevisions(List<String> revisions) {
		this.revisions = revisions;
	}
	/**
	 * @return the key
	 */
	public String getKey() {
		return key;
	}
	/**
	 * @param key the key to set
	 */
	public void setKey(String key) {
		this.key = key;
	}
	/**
	 * @param type the type to set
	 */
	@XmlAttribute
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the commitstatus
	 */
	public String getCommitstatus() {
		return commitstatus;
	}
	/**
	 * @param commitstatus the commitstatus to set
	 */
	@XmlAttribute
	public void setCommitstatus(String commitstatus) {
		this.commitstatus = commitstatus;
	}
}
