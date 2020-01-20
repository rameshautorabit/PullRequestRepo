/**
 * 
 */
package com.rabit.alm;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBAttribute;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBHashKey;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBRangeKey;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBTable;

/**
 * @author srinivas.s
 *
 */
@XmlRootElement(name="workitemsnote")
@DynamoDBTable(tableName="ALMWorkItemNote")
public class AlmWorkItemNote {

	private String orgName;
	private String key;
	private String usernoteid;
	private String workitemid;
	private String createdby;
	private String createddate;
	private String notes;
	
	/**
	 * @return the orgName
	 */
	@DynamoDBHashKey
	@XmlAttribute
	public String getOrgName() {
		return orgName;
	}
	/**
	 * @param orgName the orgName to set
	 */
	public AlmWorkItemNote setOrgName(String orgName) {
		this.orgName = orgName;
		return this;
	}
	/**
	 * @return the key
	 */
	@DynamoDBRangeKey
	@XmlAttribute
	public String getKey() {
		return key;
	}
	/**
	 * @param key the key is the combination of userNoteId_workitemId to set
	 */
	public void setKey(String key) {
		this.key = key;
	}
	/**
	 * @return the usernoteid
	 */
	@DynamoDBAttribute
	@XmlAttribute
	public String getUsernoteid() {
		return usernoteid;
	}
	/**
	 * @param usernoteid the usernoteid to set
	 */
	public void setUsernoteid(String usernoteid) {
		this.usernoteid = usernoteid;
	}
	/**
	 * @return the workitemid
	 */
	@DynamoDBAttribute
	@XmlAttribute
	public String getWorkitemid() {
		return workitemid;
	}
	/**
	 * @param workitemid the workitemid to set
	 */
	public void setWorkitemid(String workitemid) {
		this.workitemid = workitemid;
	}
	/**
	 * @return the createdby
	 */
	@DynamoDBAttribute
	@XmlAttribute
	public String getCreatedby() {
		return createdby;
	}
	/**
	 * @param createdby the createdby to set
	 */
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	/**
	 * @return the createddate
	 */
	@DynamoDBAttribute
	@XmlAttribute
	public String getCreateddate() {
		return createddate;
	}
	/**
	 * @param createddate the createddate to set
	 */
	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}
	/**
	 * @return the notes
	 */
	@DynamoDBAttribute
	@XmlAttribute
	public String getNotes() {
		return notes;
	}
	/**
	 * @param notes the notes to set
	 */
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}
