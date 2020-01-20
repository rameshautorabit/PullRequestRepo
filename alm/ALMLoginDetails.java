package com.rabit.alm;
/**
 * 
 * @author ramesh.m
 *
 */

public class ALMLoginDetails {
	private String url;
	private String userName;
	private String passWord;
	private String accessType;
	private String accessToken;
	private String almSystem;
	private String sharedSpaceId;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getAccessType() {
		return accessType;
	}
	public void setAccessType(String accessType) {
		this.accessType = accessType;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getAlmSystem() {
		return almSystem;
	}
	public void setAlmSystem(String almSystem) {
		this.almSystem = almSystem;
	}
	public void setsharedSpaceId(String sharedSpaceId) {
		this.sharedSpaceId = sharedSpaceId;
	}
	public String getsharedSpaceId() {
		return sharedSpaceId;
	}

}
