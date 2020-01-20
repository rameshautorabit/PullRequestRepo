/**
 * 
 */
package com.rabit.alm;

import java.util.List;
import java.util.Set;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.rabit.util.jaxb.AdapterCDATA;

/**
 * @author sreenivasrao.m
 * 
 * modified
 * @author sampath.c
 *
 */
@XmlRootElement(name="workitem")
public class WorkItem implements Comparable<WorkItem>{
	
	private String id;
	private String name;
	private String type;
	private String status;
	private String statusid;
	private String priority;
	private String severity;
	private String description;
	private String owner;
	private String assigne;
	private String key;
	private String reporter;
	private List<WorkItemStatus> actions;
	private String projectkey;
	private String releasedate;
	private String createddate;
	private String release;
	private String sprint;
	private String scratchOrg;
	private String scratchOrgCreateddate;
	private String scratchOrgExpirationdate;
	private String scratchOrgStatus;
	private String reponame;
	private String repourl;
	private String branch;
	private String repoid;
	private String scmtype;
	private String orgid;
	private String orgusername;
	private String orguserid;
	private String projectid;
	private String projectName;
	private String connectorType;
	private String title;
	private Set<String> commitrevisions;
	private Set<String> mergedrevisions;
	private Set<String> deployedsforgs;
	
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	@XmlAttribute
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	@XmlAttribute
	public void setType(String type) {
		this.type = type;
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
	@XmlAttribute
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the priority
	 */
	public String getPriority() {
		return priority;
	}
	/**
	 * @param priority the priority to set
	 */
	@XmlAttribute
	public void setPriority(String priority) {
		this.priority = priority;
	}
	/**
	 * @return the severity
	 */
	public String getSeverity() {
		return severity;
	}
	/**
	 * @param severity the severity to set
	 */
	@XmlAttribute
	public void setSeverity(String severity) {
		this.severity = severity;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	@XmlJavaTypeAdapter(value=AdapterCDATA.class)
	public void setDescription(String description) {
		if(description.contains("]]>") || description.contains("<![CDATA[")) {
			description = description.replaceAll("]]>", "#777d;");
			this.description = description.replaceAll("<!\\[CDATA\\[", "#777s;");
		}else {
			this.description = description;
		}
	}
	/**
	 * @return the owner
	 */
	public String getOwner() {
		return owner;
	}
	/**
	 * @param owner the owner to set
	 */
	@XmlAttribute
	public void setOwner(String owner) {
		this.owner = owner;
	}
	/**
	 * @return the assigne
	 */
	public String getAssigne() {
		return assigne;
	}
	/**
	 * @param assigne the assigne to set
	 */
	@XmlAttribute
	public void setAssigne(String assigne) {
		this.assigne = assigne;
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
	@XmlAttribute
	public void setKey(String key) {
		this.key = key;
	}
	/**
	 * @return the reporter
	 */
	public String getReporter() {
		return reporter;
	}
	/**
	 * @param reporter the reporter to set
	 */
	@XmlAttribute
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	/**
	 * @return the projectkey
	 */
	public String getProjectkey() {
		return projectkey;
	}
	/**
	 * @param projectkey the projectkey to set
	 */
	@XmlAttribute
	public void setProjectkey(String projectkey) {
		this.projectkey = projectkey;
	}
	/**
	 * @return the actions
	 */
	public List<WorkItemStatus> getActions() {
		return actions;
	}
	/**
	 * @param actions the actions to set
	 */
	@XmlElement(name="status")
	public void setActions(List<WorkItemStatus> actions) {
		this.actions = actions;
	}
	/**
	 * @return the releasedate
	 */
	public String getReleasedate() {
		return releasedate;
	}
	/**
	 * @param releasedate the releasedate to set
	 */
	@XmlAttribute
	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}
	/**
	 * @return the createddate
	 */
	public String getCreateddate() {
		return createddate;
	}
	/**
	 * @param createddate the createddate to set
	 */
	@XmlAttribute
	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}
	/**
	 * @return the sprint
	 */
	public String getSprint() {
		return sprint;
	}
	/**
	 * @param sprint the sprint to set
	 */
	@XmlAttribute
	public void setSprint(String sprint) {
		this.sprint = sprint;
	}
	/**
	 * @return the scratchOrg
	 */
	public String getScratchOrg() {
		return scratchOrg;
	}
	/**
	 * @param scratchOrg the scratchOrg to set
	 */
	@XmlAttribute
	public void setScratchOrg(String scratchOrg) {
		this.scratchOrg = scratchOrg;
	}
	/**
	 * @return the reponame
	 */
	public String getReponame() {
		return reponame;
	}
	/**
	 * @param reponame the reponame to set
	 */
	@XmlAttribute
	public void setReponame(String reponame) {
		this.reponame = reponame;
	}
	/**
	 * @return the repourl
	 */
	public String getRepourl() {
		return repourl;
	}
	/**
	 * @param repourl the repourl to set
	 */
	@XmlAttribute
	public void setRepourl(String repourl) {
		this.repourl = repourl;
	}
	/**
	 * @return the branch
	 */
	public String getBranch() {
		return branch;
	}
	/**
	 * @param branch the branch to set
	 */
	@XmlAttribute
	public void setBranch(String branch) {
		this.branch = branch;
	}
	/**
	 * @return the scratchOrgCreateddate
	 */
	public String getScratchOrgCreateddate() {
		return scratchOrgCreateddate;
	}
	/**
	 * @param scratchOrgCreateddate the scratchOrgCreateddate to set
	 */
	@XmlAttribute(name="scratchorgcreateddate")
	public void setScratchOrgCreateddate(String scratchOrgCreateddate) {
		this.scratchOrgCreateddate = scratchOrgCreateddate;
	}
	/**
	 * @return the scratchOrgExpirationdate
	 */
	public String getScratchOrgExpirationdate() {
		return scratchOrgExpirationdate;
	}
	/**
	 * @param scratchOrgExpirationdate the scratchOrgExpirationdate to set
	 */
	@XmlAttribute(name="scratchorgexpirationdate")
	public void setScratchOrgExpirationdate(String scratchOrgExpirationdate) {
		this.scratchOrgExpirationdate = scratchOrgExpirationdate;
	}
	/**
	 * @return the scratchOrgStatus
	 */
	public String getScratchOrgStatus() {
		return scratchOrgStatus;
	}
	/**
	 * @param scratchOrgStatus the scratchOrgStatus to set
	 */
	@XmlAttribute(name="scratchorgstatus")
	public void setScratchOrgStatus(String scratchOrgStatus) {
		this.scratchOrgStatus = scratchOrgStatus;
	}
	/**
	 * @return the repoId
	 */
	public String getRepoid() {
		return repoid;
	}
	/**
	 * @param repoId the repoId to set
	 */
	@XmlAttribute
	public void setRepoid(String repoid) {
		this.repoid = repoid;
	}
	/**
	 * @return the scmtype
	 */
	public String getScmtype() {
		return scmtype;
	}
	/**
	 * @param scmtype the scmtype to set
	 */
	@XmlAttribute
	public void setScmtype(String scmtype) {
		this.scmtype = scmtype;
	}
	/**
	 * @return the orgid
	 */
	public String getOrgid() {
		return orgid;
	}
	/**
	 * @param orgid the orgid to set
	 */
	@XmlAttribute
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	/**
	 * @return the orgusername
	 */
	public String getOrgusername() {
		return orgusername;
	}
	/**
	 * @param orgusername the orgusername to set
	 */
	@XmlAttribute
	public void setOrgusername(String orgusername) {
		this.orgusername = orgusername;
	}
	/**
	 * @return the orguserid
	 */
	public String getOrguserid() {
		return orguserid;
	}
	/**
	 * @param orguserid the orguserid to set
	 */
	@XmlAttribute
	public void setOrguserid(String orguserid) {
		this.orguserid = orguserid;
	}
	/**
	 * @return the commitrevisions
	 */
	public Set<String> getCommitrevisions() {
		return commitrevisions;
	}
	/**
	 * @param commitrevisions the commitrevisions to set
	 */
	public void setCommitrevisions(Set<String> commitrevisions) {
		this.commitrevisions = commitrevisions;
	}
	/**
	 * @return the mergedrevisions
	 */
	public Set<String> getMergedrevisions() {
		return mergedrevisions;
	}
	/**
	 * @param mergedrevisions the mergedrevisions to set
	 */
	public void setMergedrevisions(Set<String> mergedrevisions) {
		this.mergedrevisions = mergedrevisions;
	}
	/**
	 * @return the deployedsforgs
	 */
	public Set<String> getDeployedsforgs() {
		return deployedsforgs;
	}
	/**
	 * @param deployedsforgs the deployedsforgs to set
	 */
	public void setDeployedsforgs(Set<String> deployedsforgs) {
		this.deployedsforgs = deployedsforgs;
	}
	/**
	 * @return the statusid
	 */
	public String getStatusid() {
		return statusid;
	}
	/**
	 * @param statusid the statusid to set
	 */
	@XmlAttribute
	public void setStatusid(String statusid) {
		this.statusid = statusid;
	}
	/**
	 * @return the projectid
	 */
	public String getProjectid() {
		return projectid;
	}
	/**
	 * @param projectid the projectid to set
	 */
	@XmlAttribute
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	/**
	 * @return the connectorType
	 */
	public String getConnectorType() {
		return connectorType;
	}
	/**
	 * @param connectorType the connectorType to set
	 */
	@XmlAttribute
	public void setConnectorType(String connectorType) {
		this.connectorType = connectorType;
	}
	
	/**
	 * @return the projectName
	 */
	public String getProjectName() {
		return projectName;
	}
	/**
	 * @param projectName the projectName to set
	 */
	@XmlAttribute
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	@XmlAttribute
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public int compareTo(WorkItem workItem) {
		if(workItem.getId() != null && this.getId() != null) {
			return this.getId().compareTo(workItem.getId());
		}
		return 0;
	}
	
	
}
