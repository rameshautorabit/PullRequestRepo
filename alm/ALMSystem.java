package com.rabit.alm;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBAttribute;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBHashKey;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBIgnore;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBRangeKey;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBTable;

/**
 * 
 * @author Ramesh.M
 *
 */
@DynamoDBTable(tableName="ALMSystem")
@XmlRootElement(name="almsystem")
public class ALMSystem {
	private String orgName;
	private String labelName;
	private String type;
	private String url;
	private String accessKey;
	private String sharedspaceid;
	private String uiLabel;
	private Boolean ismapped;
	private String labelkey;
	/**
	 * @return the orgName
	 */
	@DynamoDBHashKey
	@XmlAttribute(name="orgname")
	public String getOrgName() {
		return orgName;
	}
	/**
	 * @param orgName the orgName to set
	 */
	public ALMSystem setOrgName(String orgName) {
		this.orgName = orgName;
		return this;
	}
	@DynamoDBRangeKey
	@DynamoDBAttribute
	@XmlAttribute(name="label")
	public String getLabelName() {
		return labelName;
	}
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	/**
	 * @return the url
	 */
	@DynamoDBAttribute
	@XmlAttribute
	public String getUrl() {
		return url;
	}
	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	/**
	 * @return the accessKey
	 */
	@DynamoDBAttribute
	@XmlAttribute(name="accesskey")
	public String getAccessKey() {
		return accessKey;
	}
	public void setAccessKey(String accessKey) {
		this.accessKey = accessKey;
	}
	@DynamoDBAttribute
	@XmlAttribute
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@DynamoDBAttribute
	@XmlAttribute(name = "sharedspaceid")
	public String getSharedspaceid() {
		return sharedspaceid;
	}

	public void setSharedspaceid(String sharedspaceid) {
		this.sharedspaceid = sharedspaceid;
	}
	@DynamoDBAttribute
	@XmlAttribute(name = "uilabel")
	public String getUiLabel() {
		return uiLabel;
	}
	public void setUiLabel(String uiLabel) {
		this.uiLabel = uiLabel;
	}
	@DynamoDBIgnore
	@XmlAttribute
	public Boolean ismapped() {
		return ismapped;
	}
	public void setmapped(Boolean ismapped) {
		this.ismapped = ismapped;
	}
	
	
	@DynamoDBAttribute
	@XmlAttribute
	public String getLabelkey() {
		return labelkey;
	}
	public void setLabelkey(String labelkey) {
		this.labelkey = labelkey;
	}

}