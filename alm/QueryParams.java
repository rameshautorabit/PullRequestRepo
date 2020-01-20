/**
 * 
 */
package com.rabit.alm;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author sreenivasrao.m
 *
 */
@XmlRootElement(name="params")
public class QueryParams {
	private String orgName;
	private String projectName;
	private String workItemTypeId;
	private String status;
	private String modifiedDate;
	private String modifiedBy;
	private String createdBy;
	private String createdDate;
	private Boolean isAll;
	private String sprintName;
	private String sprintId;
	private Boolean excludeActions;
	
	/**
	 * @return the projectName
	 */
	public String getProjectName() {
		return projectName;
	}
	/**
	 * @param projectName the projectName to set
	 */
	@XmlElement(name="project")
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	/**
	 * @return the workItemTypeId
	 */
	public String getWorkItemTypeId() {
		return workItemTypeId;
	}
	/**
	 * @param workItemTypeId the workItemTypeId to set
	 */
	@XmlElement(name="workitemtypeid")
	public void setWorkItemTypeId(String workItemTypeId) {
		this.workItemTypeId = workItemTypeId;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	@XmlElement
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the modifiedDate
	 */
	public String getModifiedDate() {
		return modifiedDate;
	}
	/**
	 * @param modifiedDate the modifiedDate to set
	 */
	@XmlElement(name="modifieddate")
	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	/**
	 * @return the modifiedBy
	 */
	public String getModifiedBy() {
		return modifiedBy;
	}
	/**
	 * @param modifiedBy the modifiedBy to set
	 */
	@XmlElement(name="modifiedby")
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	/**
	 * @return the createdBy
	 */
	public String getCreatedBy() {
		return createdBy;
	}
	/**
	 * @param createdBy the createdBy to set
	 */
	@XmlElement(name="createdby")
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	/**
	 * @return the createdDate
	 */
	public String getCreatedDate() {
		return createdDate;
	}
	/**
	 * @param createdDate the createdDate to set
	 */
	@XmlElement(name="createddate")
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	/**
	 * @return the isAll
	 */
	public Boolean isAll() {
		return isAll;
	}
	/**
	 * @param isAll the isAll to set
	 */
	@XmlAttribute
	public void setAll(Boolean isAll) {
		this.isAll = isAll;
	}
	/**
	 * @return the orgName
	 */
	public String getOrgName() {
		return orgName;
	}
	/**
	 * @param orgName the orgName to set
	 */
	@XmlAttribute
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	/**
	 * @return the sprintName
	 */
	public String getSprintName() {
		return sprintName;
	}
	/**
	 * @param sprintName the sprintName to set
	 */
	@XmlElement(name="sprintname")
	public void setSprintName(String sprintName) {
		this.sprintName = sprintName;
	}
	/**
	 * @return the sprintId
	 */
	public String getSprintId() {
		return sprintId;
	}
	/**
	 * @param sprintId the sprintId to set
	 */
	@XmlElement(name="sprintid")
	public void setSprintId(String sprintId) {
		this.sprintId = sprintId;
	}
	/**
	 * @return the excludeActions
	 */
	public Boolean isExcludeActions() {
		return excludeActions;
	}
	/**
	 * @param excludeActions the excludeActions to set
	 */
	public void setExcludeActions(Boolean excludeActions) {
		this.excludeActions = excludeActions;
	}

}
