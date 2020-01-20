package com.rabit.alm.autorabit;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.TreeSet;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.rabit.alm.ALMProject;
import com.rabit.alm.ALMProjects;
import com.rabit.alm.PlannedForType;
import com.rabit.alm.PlannedForTypes;
import com.rabit.alm.QueryParams;
import com.rabit.alm.WorkItem;
import com.rabit.alm.WorkItemStatus;
import com.rabit.alm.WorkItemStatuses;
import com.rabit.alm.WorkItems;
import com.rabit.beans.ARMasterData;
import com.rabit.beans.ARProject;
import com.rabit.beans.ARSprint;
import com.rabit.beans.ARWorkitem;
import com.rabit.connectors.ConnectorTypes;
import com.rabit.connectors.RMConnector;
import com.rabit.controllers.AutoRabitAlmController;
import com.rabit.errorcodes.ExceptionCode;
import com.rabit.main.MasterDataCategory;
import com.rabit.main.Messages;
import com.rabit.service.ws.exception.RabitServicesException;
import com.rabit.util.DateUtil;
import com.rabit.util.Validator;
import com.rabit.util.jaxb.JAXBUtils;

/**
 * @author srinivas.s
 *
 */
public class AutoRabitALMConnector implements RMConnector {
	private static final Logger logger = Logger.getLogger(AutoRabitALMConnector.class);
	private static AutoRabitALMConnector autoRabitALMConnector;
	private static String orgname;
	private static String useremail;

	public static AutoRabitALMConnector getInstance(String orgName, String userEmail, String labelName) {
		logger.info("Initializing the instance for ALM Label "+labelName);
		if (autoRabitALMConnector == null) {
			autoRabitALMConnector = new AutoRabitALMConnector();
		}
		if (Messages.TEST_MSG.equalsIgnoreCase(userEmail)) {
			return autoRabitALMConnector;
		}
		orgname = orgName;
		useremail = userEmail;
		return autoRabitALMConnector;
	}
	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getProjects(java.lang.String)
	 */
	@Override
	public Object getProjects(String orgName) throws RabitServicesException {
		logger.info("Get Projects...");
		ALMProject project = null;
		ALMProjects almProjects = new ALMProjects();
		ArrayList<ALMProject> projectList = new ArrayList<>();
		Element projectsElement = null;
		try{
			List<ARProject> projectsResults = new AutoRabitAlmController(orgname).getArAlmProjectsList();
			if(projectsResults != null && !projectsResults.isEmpty()){
				for(ARProject arProject:projectsResults){
					project = new ALMProject();
					project.setId(arProject.getName());
					project.setKey(arProject.getKey());
					project.setName(arProject.getName());
					projectList.add(project);
				}
				almProjects.setProjects(projectList);
			}
			projectsElement = JAXBUtils.getXMLObject(almProjects, ALMProjects.class);
		}catch (ParserConfigurationException pce) {
			logger.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			logger.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			logger.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (JAXBException jaxbe) {
			logger.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}
		return projectsElement;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#createUsers(java.lang.String, org.w3c.dom.Element)
	 */
	@Override
	public String createUsers(String orgName, Element almEle) {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#createProjects(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public Object createProjects(String orgName, String projectName, String projDesc) {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getGroups()
	 */
	@Override
	public Object getGroups() {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getRoles()
	 */
	@Override
	public Object getRoles() {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getPriorities(java.lang.String)
	 */
	@Override
	public Object getPriorities(String projectKey) {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getStatuses(java.lang.String, java.lang.String)
	 */
	@Override
	public Object getStatuses(String projectKey, String workItemType) {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getWorkItemTypes(java.lang.String)
	 */
	@Override
	public Object getWorkItemTypes(String projectKey) {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getAllWorkItems(java.lang.String, com.rabit.alm.QueryParams)
	 */
	@Override
	public Object getAllWorkItems(String projectKey, QueryParams queryParams) throws RabitServicesException {
		logger.info("Get Workitems...");
		WorkItems workItems = new WorkItems();
		TreeSet<WorkItem> workItemsSet = null;
		Element rootEle = null;
		try{
			if(Validator.isNotNullorEmpty(projectKey) && Validator.isNotNullorEmpty(queryParams.getSprintName())){
				List<ARWorkitem> workitemResults = new AutoRabitAlmController(orgname).getArAlmWorkitemsList(queryParams.getSprintName());
				if(workitemResults != null && !workitemResults.isEmpty()){
					workItemsSet = translateToWorkitems(workitemResults, queryParams.isExcludeActions());
					workItems.setWorkitems((TreeSet<WorkItem>)workItemsSet.descendingSet());
					rootEle = JAXBUtils.getXMLObject(workItems, WorkItems.class);
					logger.info("processing Time completed at::"+DateUtil.getDateTime());
				}
			}else{
				return  Messages.ALM_SPRINTID_VALIDATION_MSG;
			}
		} catch (ParserConfigurationException pce) {
			logger.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			logger.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			logger.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (JAXBException jaxbe) {
			logger.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}
		return rootEle;
	}
	private TreeSet<WorkItem> translateToWorkitems(List<ARWorkitem> workitemResults, boolean isExcludeActions) throws RabitServicesException{
		WorkItem workItem = null;
		TreeSet<WorkItem> workItemsSet = new TreeSet<>();
		List<WorkItemStatus> workitemStatuses = getWorkItemStatuses();
		for(ARWorkitem arWorkitem:workitemResults){
			workItem = new WorkItem();
			workItem.setId(arWorkitem.getId());
			workItem.setName(arWorkitem.getName());
			workItem.setKey(arWorkitem.getKey());
			workItem.setDescription(arWorkitem.getDescription());
			workItem.setCreateddate(arWorkitem.getCreatedDate());
			workItem.setType(arWorkitem.getType());
			workItem.setReporter(arWorkitem.getReporter());
			workItem.setPriority(arWorkitem.getPriority());
			workItem.setAssigne(arWorkitem.getAssignee());
			workItem.setStatus(arWorkitem.getStatus());
			workItem.setReleasedate(arWorkitem.getReleaseDate());
			//Assign the status list for each workitem.
			//This could be changed to get only next possible statuses in future if the statuses follow workflow
			if(isExcludeActions && workitemStatuses != null && !workitemStatuses.isEmpty()) {
				workItem.setActions(workitemStatuses);
			}
			workItemsSet.add(workItem);
		}
		return workItemsSet;
	}
	private List<WorkItemStatus> getWorkItemStatuses() throws RabitServicesException{
		List<WorkItemStatus> workItemStatusList = null;
		WorkItemStatus workItemStatus = null;
		List<ARMasterData> statusList = new AutoRabitAlmController(orgname).getStatuses(MasterDataCategory.ALMWISTATUS.getCategory());
		workItemStatusList = new ArrayList<>();
		for (ARMasterData masterData : statusList) {
			workItemStatus = new WorkItemStatus();
			workItemStatus.setId(masterData.getValue());
			workItemStatus.setName(masterData.getName());
			workItemStatusList.add(workItemStatus);
		}
		if(!workItemStatusList.isEmpty()){
			Collections.sort(workItemStatusList, new WorkItemStatus());
		}
		return workItemStatusList;
	}
	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getPlannedForList(java.lang.String, com.rabit.alm.QueryParams)
	 */
	@Override
	public Object getPlannedForList(String projectKey, QueryParams queryParams) throws RabitServicesException {
		logger.info("Get Sprints...");
		PlannedForType plannedType = null;
		PlannedForTypes plannedTypes = new PlannedForTypes();
		ArrayList<PlannedForType> plannedTypeList = new ArrayList<>();
		Element rootEle = null;
		try{
			if(Validator.isNotNullorEmpty(projectKey)){
				List<ARSprint> sprintResults = new AutoRabitAlmController(orgname).getArAlmProjectSprintsList(projectKey);
				if(sprintResults != null && !sprintResults.isEmpty()){
					for(ARSprint arSprint:sprintResults){
						plannedType = new PlannedForType();
						plannedType.setId(arSprint.getId());
						plannedType.setName(arSprint.getName());
						plannedType.setDisplayname(arSprint.getName());
						plannedTypeList.add(plannedType);
					}
					plannedTypes.setPlannedfortypes(plannedTypeList);
					rootEle = JAXBUtils.getXMLObject(plannedTypes, PlannedForTypes.class);
					logger.info("processing Time completed at::"+DateUtil.getDateTime());
				}
			}else{
				return  Messages.ALM_SPRINTID_VALIDATION_MSG;
			}
		}catch (JAXBException jaxbe) {
			logger.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}catch (ParserConfigurationException pce) {
			logger.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			logger.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			logger.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} 
		return rootEle;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getAllStatuses(java.lang.String)
	 */
	@Override
	public Object getAllStatuses(String projId) throws RabitServicesException {
		Element rootEle = null;
		ArrayList<WorkItemStatus> workItemStatusList = null;
		WorkItemStatus workItemStatus = null;
		WorkItemStatuses workItemStatuses = new WorkItemStatuses();
		
		try {
			List<ARMasterData> statusList = new AutoRabitAlmController(orgname).getStatuses(MasterDataCategory.ALMWISTATUS.getCategory());
			workItemStatusList = new ArrayList<>();
			for (ARMasterData masterData : statusList) {
				workItemStatus = new WorkItemStatus();
				workItemStatus.setId(masterData.getValue());
				workItemStatus.setName(masterData.getName());
				workItemStatusList.add(workItemStatus);
			}
			if(!workItemStatusList.isEmpty()){
				Collections.sort(workItemStatusList, new WorkItemStatus());
				workItemStatuses.setStatuses(workItemStatusList);
			}
			rootEle = JAXBUtils.getXMLObject(workItemStatuses, WorkItemStatuses.class);
		}catch (JAXBException jaxbe) {
			logger.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}catch (ParserConfigurationException pce) {
			logger.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			logger.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			logger.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		}
		return rootEle;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.RMConnector#getRequirementsByProject(java.lang.String, java.lang.String)
	 */
	@Override
	public Object getRequirementsByProject(String orgName, String projectID) {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.RMConnector#getIssuesByProject(java.lang.String, java.lang.String)
	 */
	@Override
	public Object getIssuesByProject(String orgName, String projectKey) {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.RMConnector#createIssues(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public String createIssues(String orgName, String projectId, String issueType, String subject, String description,
			String status, String priority) {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.RMConnector#getTaskManagementSummary(java.lang.String)
	 */
	@Override
	public Object getTaskManagementSummary(String orgName) {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.RMConnector#updateWorkItemStatus(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public String updateWorkItemStatus(String orgName,String labelName, String projectKey, String workItemId, String status,
			String comment, Logger LOG) throws RabitServicesException {
		if(LOG == null) {
			LOG = AutoRabitALMConnector.logger;
		}
		return new AutoRabitAlmController(orgname).updateWorkItemStatus(projectKey, workItemId, status, comment, useremail);
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.RMConnector#testConnection(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public String testConnection(String url, String userName, String password, Logger LOG) {
		return null;
	}
	@Override
	public Object getworkItem(String orgName,String labelName,String workItemId,String projectId) throws RabitServicesException {
		WorkItem workItem = new WorkItem();
		ARWorkitem arWorkitem = new AutoRabitAlmController(orgname).getArAlmWorkitemWithId(workItemId);
		if(arWorkitem.getAssignee()!=null) {
			workItem.setAssigne(arWorkitem.getAssignee());
		}
		if(arWorkitem.getDescription()!=null) {
			workItem.setDescription(arWorkitem.getDescription());
		}
		if(arWorkitem.getPriority()!=null) {
			workItem.setPriority(arWorkitem.getPriority());
		}
		if(arWorkitem.getStatus()!=null) {
			workItem.setStatus(arWorkitem.getStatus());
		}
		if(arWorkitem.getSprint()!=null) {
			workItem.setSprint(arWorkitem.getSprint());
		}
		workItem.setConnectorType(ConnectorTypes.AUTORABIT.getConnectorType().toLowerCase());
		return workItem;
	}

}
