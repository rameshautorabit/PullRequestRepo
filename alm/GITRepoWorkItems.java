package com.rabit.alm;


import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="gitrepoworkitems")
public class GITRepoWorkItems {
	
	private List<GITRepoWorkItem> gitrepoworkitems;

	public List<GITRepoWorkItem> getGitrepoworkitems() {
		return gitrepoworkitems;
	}

	@XmlElement(name="gitrepoworkitem")
	public void setGitrepoworkitems(List<GITRepoWorkItem> gitrepoworkitems) {
		this.gitrepoworkitems = gitrepoworkitems;
	}
	
	

	
}
