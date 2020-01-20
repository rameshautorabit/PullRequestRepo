/**
 * 
 */
package com.rabit.alm;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * @author srinivas.s
 *
 */
@XmlRootElement(name="workitemsnotes")
public class AlmWorkItemNotes {

	private List<AlmWorkItemNote> workItemNotes;
	/**
	 * @return the workItemNotes
	 */
	@XmlElement(name="workitemsnote")
	public List<AlmWorkItemNote> getWorkItemNotes() {
		return workItemNotes;
	}
	/**
	 * @param workItemNotes the workItemNotes to set
	 */
	public void setWorkItemNotes(List<AlmWorkItemNote> workItemNotes) {
		this.workItemNotes = workItemNotes;
	}
	
	

}
