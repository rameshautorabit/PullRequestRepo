package com.rabit.alm;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="almsystems")
public class ALMSystems {
	private List<ALMSystem> almSystemList;

	@XmlElement(name="almsystem")
	public List<ALMSystem> getAlmSystemList() {
		return almSystemList;
	}

	public void setAlmSystemList(List<ALMSystem> almSystemList) {
		this.almSystemList = almSystemList;
	}
}
