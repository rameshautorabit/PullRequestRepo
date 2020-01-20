package com.rabit.alm.rtc;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;

import org.apache.log4j.Logger;
import org.eclipse.core.runtime.IProgressMonitor;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.ibm.team.foundation.common.text.XMLString;
import com.ibm.team.process.client.IProcessItemService;
import com.ibm.team.process.common.IDescription;
import com.ibm.team.process.common.IDevelopmentLine;
import com.ibm.team.process.common.IDevelopmentLineHandle;
import com.ibm.team.process.common.IIteration;
import com.ibm.team.process.common.IIterationHandle;
import com.ibm.team.process.common.IProcessDefinition;
import com.ibm.team.process.common.IProjectArea;
import com.ibm.team.process.common.IProjectAreaHandle;
import com.ibm.team.process.internal.common.Iteration;
import com.ibm.team.process.internal.common.IterationHandle;
import com.ibm.team.repository.client.IItemManager;
import com.ibm.team.repository.client.ITeamRepository;
import com.ibm.team.repository.common.IAuditableHandle;
import com.ibm.team.repository.common.IContributor;
import com.ibm.team.repository.common.TeamRepositoryException;
import com.ibm.team.workitem.client.IDetailedStatus;
import com.ibm.team.workitem.client.IQueryClient;
import com.ibm.team.workitem.client.IWorkItemClient;
import com.ibm.team.workitem.client.IWorkItemWorkingCopyManager;
import com.ibm.team.workitem.client.WorkItemWorkingCopy;
import com.ibm.team.workitem.common.IAuditableCommon;
import com.ibm.team.workitem.common.IWorkItemCommon;
import com.ibm.team.workitem.common.expression.AttributeExpression;
import com.ibm.team.workitem.common.expression.Expression;
import com.ibm.team.workitem.common.expression.IQueryableAttribute;
import com.ibm.team.workitem.common.expression.IQueryableAttributeFactory;
import com.ibm.team.workitem.common.expression.QueryableAttributes;
import com.ibm.team.workitem.common.expression.Term;
import com.ibm.team.workitem.common.model.AttributeOperation;
import com.ibm.team.workitem.common.model.IAttribute;
import com.ibm.team.workitem.common.model.ICategory;
import com.ibm.team.workitem.common.model.IComment;
import com.ibm.team.workitem.common.model.IComments;
import com.ibm.team.workitem.common.model.IEnumeration;
import com.ibm.team.workitem.common.model.ILiteral;
import com.ibm.team.workitem.common.model.IPriority;
import com.ibm.team.workitem.common.model.IState;
import com.ibm.team.workitem.common.model.IWorkItem;
import com.ibm.team.workitem.common.model.IWorkItemHandle;
import com.ibm.team.workitem.common.model.IWorkItemType;
import com.ibm.team.workitem.common.model.Identifier;
import com.ibm.team.workitem.common.query.IQueryDescriptor;
import com.ibm.team.workitem.common.query.IQueryResult;
import com.ibm.team.workitem.common.query.IResult;
import com.ibm.team.workitem.common.query.QueryTypes;
import com.ibm.team.workitem.common.workflow.IWorkflowInfo;
import com.rabit.alm.ALMLoginDetails;
import com.rabit.alm.ALMProject;
import com.rabit.alm.ALMProjects;
import com.rabit.alm.ALMUtils;
import com.rabit.alm.PlannedForType;
import com.rabit.alm.PlannedForTypes;
import com.rabit.alm.QueryParams;
import com.rabit.alm.WorkItem;
import com.rabit.alm.WorkItemPriorities;
import com.rabit.alm.WorkItemPriority;
import com.rabit.alm.WorkItemStatus;
import com.rabit.alm.WorkItemStatuses;
import com.rabit.alm.WorkItemType;
import com.rabit.alm.WorkItemTypes;
import com.rabit.alm.WorkItems;
import com.rabit.connectors.ConnectorTypes;
import com.rabit.connectors.RMConnector;
import com.rabit.errorcodes.ErrorCodeMessages;
import com.rabit.errorcodes.ExceptionCode;
import com.rabit.main.Messages;
import com.rabit.service.ws.exception.RabitServicesException;
import com.rabit.util.jaxb.JAXBUtils;
import com.rabit.util.xml.DOMUtil;
import com.rabit.util.xml.XPathUtil;

/**
 * @author sreenivasrao.m
 *
 */
public class RTCConnector implements RMConnector {
	
	private static final Logger LOG = Logger.getLogger(RTCConnector.class);
	private static RTCConnector rtcConnector;
	private static ITeamRepository iTeamRepository = null;
	private static IProgressMonitor monitor;
	
	private RTCConnector() {}
	public static RTCConnector getInstance(String orgName,String userEmail,String labelName) throws RabitServicesException {
		RTCAuthenticator.startRTCClient();
		if(rtcConnector == null) {
			rtcConnector = new RTCConnector();
		}
		if(Messages.TEST_MSG.equalsIgnoreCase(userEmail)){
    		return rtcConnector;
    	}
		monitor = new LogProgressMonitor();
		createInstance(orgName,userEmail,labelName);
		return rtcConnector;
	}
	
	public static void createInstance(String orgName,String userEmail,String labelName) throws RabitServicesException{
			ALMLoginDetails almLoginDetails = null;
			try {
				almLoginDetails = new ALMUtils(orgName,userEmail,labelName).getLoginDetails();
				if(almLoginDetails != null){
					iTeamRepository = RTCAuthenticator.login(new LogProgressMonitor(), almLoginDetails.getUrl(), almLoginDetails.getUserName(), almLoginDetails.getPassWord());
				}else{
					LOG.error(ErrorCodeMessages.ALMLOGIN_DETAILS);
					throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(),ExceptionCode.ALMLOGINDETAILSEXCEPTION.getDescription());
				}
			} catch (TeamRepositoryException tre) {
				LOG.error(tre.getMessage(), tre);
				throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), ExceptionCode.RTCCONNECTIONEXCEPTION.getDescription());
			}
	}
	
	public IProjectArea getProjectArea(String projectAreaName) {
		IProjectArea projectArea = null;
		try {
			IProcessItemService connect = (IProcessItemService) iTeamRepository.getClientLibrary(IProcessItemService.class);
			URI uri = URI.create(projectAreaName.replaceAll(" ", "%20"));
			projectArea = (IProjectArea) connect.findProcessArea(uri, null, null);
		} catch (TeamRepositoryException e) {
			LOG.error("Error: " + e.getMessage());
		}
		return projectArea;
	}
	@Override
	public Object getProjects(String orgName) throws RabitServicesException {
		Element projectsElement = null;
		List<IProjectArea> projectsAreaList = null;
		ALMProject project = null;
		try {
			IProcessItemService connect = (IProcessItemService) iTeamRepository.getClientLibrary(IProcessItemService.class);
			projectsAreaList = connect.findAllProjectAreas(null, null);
			ALMProjects almProjects = new ALMProjects();
			ArrayList<ALMProject> projectList = new ArrayList<ALMProject>();
			for (IProjectArea iProjectArea : projectsAreaList) {
				project = new ALMProject();
				project.setName(iProjectArea.getName());
				project.setId(iProjectArea.getItemId().getUuidValue());
				project.setKey(iProjectArea.getName());
				projectList.add(project);
			}
			almProjects.setProjects(projectList);
			projectsElement = JAXBUtils.getXMLObject(almProjects, ALMProjects.class);
		} catch (TeamRepositoryException | JAXBException | ParserConfigurationException | SAXException | IOException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), tre.getMessage());
		}
		return projectsElement;
	}
	@Override
	public String createUsers(String orgName, Element almEle) throws RabitServicesException {
		return null;
	}
	@Override
	public Object createProjects(String orgName, String projectName, String projDesc) throws RabitServicesException {
		IProjectArea area = null;
        IProcessItemService service= (IProcessItemService) iTeamRepository.getClientLibrary(IProcessItemService.class);
        final String cCRUM_PROCESS = "scrum2.process.ibm.com";
        IProcessDefinition[] definitions;
		try {
			definitions = service.deployPredefinedProcessDefinitions(new String[] { cCRUM_PROCESS }, null);
			if (definitions.length == 0) {
	            throw new TeamRepositoryException("Process template " + cCRUM_PROCESS + " does not exist.");
	        }
	        area = service.createProjectArea();
	        area.setName(projectName);
	        area.setProcessDefinition(definitions[0]);
	        IDescription description = area.getDescription();
	        description.setSummary(projectName + " example project based on the Scrum project template");
	        area = (IProjectArea) service.save(area, null);
	        monitor.subTask("Created project and team called " + area.getName());
		} catch (TeamRepositoryException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), ExceptionCode.RTCCONNECTIONEXCEPTION.getDescription());
		}
        return area;
	}
	@Override
	public Object getGroups() {
		return null;
	}
	@Override
	public Object getRoles() throws RabitServicesException {
		return null;
	}
	@Override
	public Object getPriorities(String projectKey) throws RabitServicesException {
		Element rootEle = null;
		IWorkItemCommon workItemCommon = (IWorkItemCommon) iTeamRepository.getClientLibrary(IWorkItemCommon.class);
		try {
			WorkItemPriorities priorities = new WorkItemPriorities();
			WorkItemPriority priority = null;
			ArrayList<WorkItemPriority> prioritiesList = new ArrayList<WorkItemPriority>();
			List<IPriority> rtcpriorities = workItemCommon.findPriorities(getProjectArea(projectKey), null);
			for (IPriority itemPriority : rtcpriorities) {
				priority = new WorkItemPriority();
				priority.setId(itemPriority.getIdentifier2().getStringIdentifier());
				priority.setName(itemPriority.getName());
				prioritiesList.add(priority);
			}
			priorities.setPriorities(prioritiesList);
			rootEle = JAXBUtils.getXMLObject(priorities, WorkItemPriorities.class);
		} catch (TeamRepositoryException | JAXBException | ParserConfigurationException | SAXException | IOException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), tre.getMessage());
		}
		return rootEle;
	}
	@Override
	public WorkItemStatuses getStatuses(String projectKey, String workItemType) throws RabitServicesException {
		Element rootEle = null;
		IWorkItemCommon workItemCommon = (IWorkItemCommon) iTeamRepository.getClientLibrary(IWorkItemCommon.class);
		List<IWorkItemType> workItemTypes = null;
		WorkItemStatuses statuses = null;
		WorkItemWorkingCopy wc = null;
		IWorkflowInfo workFlowInfo = null;
		Identifier<IState> states[] = null;
		WorkItemStatus status = null;
		String statusName = "";
		ArrayList<WorkItemStatus> statusesList = null;
		try {
			IProjectArea projectArea = getProjectArea(projectKey);
			workItemTypes = workItemCommon.findWorkItemTypes(projectArea, null);
			IWorkItemClient workItemClient = (IWorkItemClient) iTeamRepository.getClientLibrary(IWorkItemClient.class);
			IWorkItemWorkingCopyManager workingManager = workItemClient.getWorkItemWorkingCopyManager();
			for (IWorkItemType iworkItemType : workItemTypes) {
				if(iworkItemType.getDisplayName().equalsIgnoreCase(workItemType)){
					wc = workingManager.getWorkingCopy(workingManager.connectNew(iworkItemType, null));
					workFlowInfo = workItemCommon.findWorkflowInfo(wc.getWorkItem(), null);
					states = workFlowInfo.getAllStateIds();
					statuses = new WorkItemStatuses();
					statusesList = new ArrayList<WorkItemStatus>();
					for (Identifier<IState> identifier : states) {
						status = new WorkItemStatus();
						statusName = workFlowInfo.getStateName(identifier);
						status.setId(identifier.getStringIdentifier());
						status.setName(statusName);
						statusesList.add(status);
					}
					statuses.setStatuses(statusesList);	
					break;
				}
			}
			if(statuses != null){
				rootEle = JAXBUtils.getXMLObject(statuses, WorkItemStatuses.class);				
			}
		} catch (TeamRepositoryException | JAXBException | ParserConfigurationException | SAXException | IOException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), tre.getMessage());
		}
		return statuses;
	}
	@Override
	public Object getWorkItemTypes(String projectKey) throws RabitServicesException {
		Element rootEle = null;
		IWorkItemCommon workItemCommon = (IWorkItemCommon) iTeamRepository.getClientLibrary(IWorkItemCommon.class);
		List<IWorkItemType> workItemTypes = null;
		try {
			IProjectArea projectArea = getProjectArea(projectKey);
			if(projectArea != null){
				WorkItemTypes itemTypes = new WorkItemTypes();
				workItemTypes = workItemCommon.findWorkItemTypes(projectArea, null);
				WorkItemType itemType = null;
				ArrayList<WorkItemType> itemTypeList = new ArrayList<WorkItemType>();
				workItemTypes = workItemCommon.findWorkItemTypes(projectArea, null);
				IWorkItemClient workItemClient = (IWorkItemClient) iTeamRepository.getClientLibrary(IWorkItemClient.class);
				IWorkItemWorkingCopyManager workingManager = workItemClient.getWorkItemWorkingCopyManager();
				WorkItemWorkingCopy wc = null;
				IWorkflowInfo workFlowInfo = null;
				Identifier<IState> states[] = null;
				WorkItemStatuses statuses = null;
				WorkItemStatus status = null;
				String statusName = "";
				ArrayList<WorkItemStatus> statusesList = null;
				for (IWorkItemType iworkItemType : workItemTypes) {
					wc = workingManager.getWorkingCopy(workingManager.connectNew(iworkItemType, null));
					workFlowInfo = workItemCommon.findWorkflowInfo(wc.getWorkItem(), null);
					states = workFlowInfo.getAllStateIds();
					statuses = new WorkItemStatuses();
					statusesList = new ArrayList<WorkItemStatus>();
					for (Identifier<IState> identifier : states) {
						status = new WorkItemStatus();
						statusName = workFlowInfo.getStateName(identifier);
						status.setId(identifier.getStringIdentifier());
						status.setName(statusName);
						if(statusName.equalsIgnoreCase("In Progress")){
							status.setType("Default");
						}
						statusesList.add(status);
					}
					if(!statusesList.isEmpty()){
						 Collections.sort(statusesList, new WorkItemStatus());
					}
					statuses.setStatuses(statusesList);
					itemType = new WorkItemType();
					itemType.setId(iworkItemType.getIdentifier());
					itemType.setName(iworkItemType.getDisplayName());
					itemType.setDisplayname(iworkItemType.getDisplayName());
					itemType.setStatuses(statuses);
					itemTypeList.add(itemType);
				}
				if(!itemTypeList.isEmpty()){
					Collections.sort(itemTypeList, new WorkItemType());
				}
				itemTypes.setWorkitemtypes(itemTypeList);
				rootEle = JAXBUtils.getXMLObject(itemTypes, WorkItemTypes.class);	
			}else{
				return "Please Select the Project.";
			}
		} catch (TeamRepositoryException | JAXBException | ParserConfigurationException | SAXException | IOException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(),tre.getMessage());
		}
		return rootEle;
	}
	@Override
	public Object getRequirementsByProject(String orgName, String projectID) throws RabitServicesException {
		return null;
	}
	@Override
	public Object getIssuesByProject(String orgName, String projectKey) throws RabitServicesException {
		Element rootEle = null;
		IWorkItemCommon workItemCommon = (IWorkItemCommon) iTeamRepository.getClientLibrary(IWorkItemCommon.class);
		List<IWorkItemType> workItemTypes = null;
		try {
			rootEle = DOMUtil.getRoot(DOMUtil.getDocument("<root/>"));
			workItemTypes = workItemCommon.findWorkItemTypes(getProjectArea(projectKey), null);
			Element workItemTypesEle = DOMUtil.createElement("issuetypes", rootEle);
			Element workItemTypeEle = null;
			for (IWorkItemType iworkItemType : workItemTypes) {
				workItemTypeEle = DOMUtil.createElement("issuetype", workItemTypesEle);
				DOMUtil.setAttribute(workItemTypeEle, "name", iworkItemType.getDisplayName());
				DOMUtil.setAttribute(workItemTypeEle, "id", iworkItemType.getIdentifier());
			}
		} catch (TeamRepositoryException | ParserConfigurationException | SAXException | IOException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), tre.getMessage());
		}
		return rootEle;
	}
	@Override
	public String createIssues(String orgName, String projectId, String issueType, String subject, String description, String status, String priority) throws RabitServicesException {
		IWorkItemClient workItemClient = (IWorkItemClient) iTeamRepository.getClientLibrary(IWorkItemClient.class);
		IProjectArea projectArea = getProjectArea(projectId);
		IWorkItem workItem = null;
		try {
			IWorkItemType iWorkItemType = workItemClient.findWorkItemType(projectArea, issueType, null);
			if(iWorkItemType != null){
			IWorkItemHandle handle = workItemClient.getWorkItemWorkingCopyManager().connectNew(iWorkItemType, null);
			WorkItemWorkingCopy wc = workItemClient.getWorkItemWorkingCopyManager().getWorkingCopy(handle);
			workItem = wc.getWorkItem();
			List<ICategory> findCategories = workItemClient.findCategories(projectArea, ICategory.FULL_PROFILE, null);
			ICategory category = findCategories.get(0);
			workItem.setCategory(category);
			workItem.setCreator(iTeamRepository.loggedInContributor());
			workItem.setOwner(iTeamRepository.loggedInContributor());
			workItem.setHTMLSummary(XMLString.createFromPlainText(subject));
			IDetailedStatus s = wc.save(null);
			if (!s.isOK()) {
				throw new TeamRepositoryException("Error saving work item", s.getException());
			}
			workItem = (IWorkItem) iTeamRepository.itemManager().fetchCompleteItem(workItem, IItemManager.DEFAULT, null);
			monitor.subTask("Created a work item " + workItem.getId());
			return String.valueOf(workItem.getId());
			}
			return null;
		} catch (TeamRepositoryException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), ExceptionCode.RTCCONNECTIONEXCEPTION.getDescription());
		} finally {
			if(workItem != null){
			workItemClient.getWorkItemWorkingCopyManager().disconnect(workItem);
		}
	}
	}
	@SuppressWarnings({ "unchecked" })
	public IIteration getIterationForSprintRecursive(IIterationHandle[] iterationHandles,String iterationName) throws RabitServicesException {
	    IIteration iteration = null;
	    Iteration childIteration = null;
	    IIteration returnIteration = null;
	    List<Iteration> iterationLines = null;
	    try {
	    	if (iterationHandles != null) {
	    		iterationLines = iTeamRepository.itemManager().fetchCompleteItems(Arrays.asList(iterationHandles),IItemManager.DEFAULT, null);
	    		for (Iterator<Iteration> e1 = iterationLines.iterator(); e1.hasNext();) {
					iteration = (IIteration) e1.next();
					if (iteration != null && iteration.getName() != null&&!iteration.isArchived() && iteration.getName().equals(iterationName)){
						LOG.info("Equal Iteration return Iteration::"+iteration.getName());
						returnIteration=iteration;
						return returnIteration;
					}
					if (iteration != null && iteration.getChildren() != null) {
						childIteration = (Iteration) getIterationForSprintRecursive(iteration.getChildren(),iterationName);
						if (childIteration != null &&childIteration.getName() != null&&!childIteration.isArchived() && childIteration.getName().equals(iterationName)){
							LOG.info("Equal childIteration Iteration return Iteration:"+childIteration.getName());
							returnIteration=childIteration;
							return returnIteration;
						}
					}
	    		}
	    	}
	    } catch (TeamRepositoryException tre) {
	    	LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), ExceptionCode.RTCCONNECTIONEXCEPTION.getDescription());
        }
        return returnIteration;
	}

	@SuppressWarnings("unchecked")
	public IterationHandle getIterationForSprint(String projectKey,String iterationName) throws RabitServicesException{
		LOG.info("::Start getIterationForSprint method::");
		Iteration iteration = null;
		IProjectArea projectArea = getProjectArea(projectKey);
		IDevelopmentLineHandle[] developmentHandles = projectArea.getDevelopmentLines();
		IDevelopmentLine line = null;
	    List<Iteration> developmentLines = null;
        try {
        	if (developmentHandles != null) {
	            developmentLines = iTeamRepository.itemManager().fetchCompleteItems(Arrays.asList(developmentHandles),IItemManager.DEFAULT, null);
	            for (Iterator<Iteration> e = developmentLines.iterator(); e.hasNext();) {
	            	line = (IDevelopmentLine) e.next();
	            	IIterationHandle[] iterationHandles = line.getIterations();
	            	iteration = (Iteration)getIterationForSprintRecursive(iterationHandles,iterationName);
	            	if(iteration != null){
	            		return iteration;
	            	}
	            }
	        }
        } catch (TeamRepositoryException tre) {
        	LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), ExceptionCode.RTCCONNECTIONEXCEPTION.getDescription());
        }
	    return iteration;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<String> plannedForRecursive(IIterationHandle[] iterationHandles) throws RabitServicesException {
        ArrayList<String> interationNameList = new ArrayList<String>();
        List<Iteration> iterationLines = null;
        IIteration iteration = null;
        ArrayList<String> tempList = null;
		try {
			if (iterationHandles != null) {
				iterationLines = iTeamRepository.itemManager().fetchCompleteItems(Arrays.asList(iterationHandles),IItemManager.DEFAULT, null);
				for (Iterator<Iteration> e1 = iterationLines.iterator(); e1.hasNext();) {
					iteration = e1.next();
					if (iteration != null && iteration.getName() != null && !iteration.isArchived())
						interationNameList.add(iteration.getName());
					if (iteration != null && iteration.getChildren() != null) {
						tempList = plannedForRecursive(iteration.getChildren());
					}
					if (tempList != null) {
						for (String sprintName : tempList) {
							if (sprintName != null) {
								interationNameList.add(sprintName);
		                        LOG.info("planned Sprints:"+sprintName);
							}
						}
					}
				}
			}
	    } catch (TeamRepositoryException tre) {
	    	LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), ExceptionCode.RTCCONNECTIONEXCEPTION.getDescription());
	    }
        return interationNameList;
    }
	@SuppressWarnings("unchecked")
	@Override
	public Object getPlannedForList(String projectKey, QueryParams queryParams)
			throws RabitServicesException {
		LOG.info("Start getPlannedForSprintsList");
		Element rootEle = null;
        ArrayList<String> list = new ArrayList<String>();
        ArrayList<ArrayList<String>> listall = new ArrayList<ArrayList<String>>();
        IProjectArea projectArea = getProjectArea(projectKey);
        if(projectArea != null){
        	IDevelopmentLineHandle[] developmentHandles = projectArea.getDevelopmentLines();
        	IDevelopmentLine line = null;
        	List<Iteration> developmentLines = null;
        	PlannedForTypes plannedTypes = new PlannedForTypes();
        	PlannedForType plannedType = null;
        	ArrayList<PlannedForType> plannedTypeList = new ArrayList<PlannedForType>();
        	try {
        		if (developmentHandles != null) {
        			developmentLines = iTeamRepository.itemManager().fetchCompleteItems(Arrays.asList(developmentHandles),IItemManager.DEFAULT, null);
        			for (Iterator<Iteration> e = developmentLines.iterator(); e.hasNext();) {
        				line = (IDevelopmentLine) e.next();
        				IIterationHandle[] iterationHandles = line.getIterations();
        				list = plannedForRecursive(iterationHandles);
        				if (list != null)
        					listall.add(list);
        			}
        			int i = 1;
        			for (ArrayList<String> lis : listall) {
        				if (lis != null) {
        					for (String s : lis) {
        						plannedType = new PlannedForType();
        						if (s != null) {
        							plannedType.setId(String.valueOf(i));
        							plannedType.setName(s);
        							plannedType.setDisplayname(s);
        							i++;
        						}
        						plannedTypeList.add(plannedType);
        					}
        				}
        			}
        			plannedTypes.setPlannedfortypes(plannedTypeList);
        			rootEle = JAXBUtils.getXMLObject(plannedTypes, PlannedForTypes.class);
        		}
        	}catch (TeamRepositoryException | JAXBException | ParserConfigurationException | SAXException | IOException tre) {
        		LOG.error(tre.getMessage(), tre);
        		throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), tre.getMessage());
        	}
        	return rootEle;	
        }
        else{
        	return "Project doesnot exist. Please ReConfigure the Project.";
        }
    }
	@Override
	public Object getTaskManagementSummary(String orgName) throws RabitServicesException {
		return null;
	}
	@Override
	public Object getAllWorkItems(String projectKey, QueryParams queryParams) throws RabitServicesException {
		Element rootEle = null;
		try {
			if(queryParams.getSprintId() != null && !"undefined".equalsIgnoreCase(queryParams.getSprintId())){
				IWorkItemClient workItemClient = (IWorkItemClient) iTeamRepository.getClientLibrary(IWorkItemClient.class);
				IAuditableCommon iAuditableCommon = (IAuditableCommon) iTeamRepository.getClientLibrary(IAuditableCommon.class);
				IProjectArea projectArea = getProjectArea(projectKey);
				IQueryableAttributeFactory factory = QueryableAttributes.getFactory( IWorkItem.ITEM_TYPE );
				IQueryableAttribute projectAttribute = factory.findAttribute(projectArea, IWorkItem.PROJECT_AREA_PROPERTY, iAuditableCommon, null );
				LOG.info("Selected Sprint Name to Fetch Work Items::"+queryParams.getSprintName());
				AttributeExpression plan = null;
				if(!"".equals(queryParams.getSprintName())){
					IterationHandle iteration = getIterationForSprint(projectKey,queryParams.getSprintName());
					plan = new AttributeExpression(factory.findAttribute(projectArea, IWorkItem.TARGET_PROPERTY, iAuditableCommon, null),AttributeOperation.EQUALS,iteration);  	
				}
				Expression inProjectArea = new AttributeExpression(projectAttribute, AttributeOperation.EQUALS, projectArea);
				Term term = new Term(Term.Operator.AND);
				term.add(inProjectArea);
				term.add(plan);

				IQueryClient queryClient = workItemClient.getQueryClient();
				IQueryDescriptor iQueryDescriptor = queryClient.createQuery(projectArea, QueryTypes.WORK_ITEM_QUERY, "AllItems", term);
				IQueryResult<IResult> queryResult = queryClient.getQueryResults(iQueryDescriptor);
				WorkItems workItems = new WorkItems();
				TreeSet<WorkItem> workItemsSet = new TreeSet<>();
				WorkItem workItem = null;
				IResult result = null;
				IWorkItem iWorkItem = null;
				IWorkflowInfo iWorkFlowInfo = null;
				IWorkItemType iWorkItemType = null;
				IEnumeration<? extends ILiteral> pEnumeration = null;
				IEnumeration<? extends ILiteral> sEnumeration = null;
				ILiteral piLiteral = null;
				ILiteral siLiteral = null;
				List<IAttribute> iAttributes = workItemClient.findAttributes(projectArea, null);
				IAttribute iAttributePriority = null;
				IAttribute iAttributeSeverity = null;
				IContributor iContributor = null;
				WorkItemStatus itemStatus = null;
				List<WorkItemStatus> workItemStatus = null;
				for (IAttribute iAttribute : iAttributes) {
					if(iAttribute.getDisplayName().equalsIgnoreCase("Severity")) {
						iAttributeSeverity = iAttribute;
					} else if(iAttribute.getDisplayName().equalsIgnoreCase("Priority")) {
						iAttributePriority = iAttribute;
					}
				}
				Element workItemTypes = (Element) getWorkItemTypes(projectKey);
				//Element workitemtype = XPathUtil.selectSingleElement(workItemTypes, "./workitemtype[@name='"+WorkitemId+"']")
				
				while(queryResult.hasNext(null)) {
					result = (IResult)queryResult.next(null);
					iWorkItem = iAuditableCommon.resolveAuditable((IAuditableHandle)result.getItem(), IWorkItem.FULL_PROFILE, null);
					iWorkItemType = workItemClient.findWorkItemType(projectArea, iWorkItem.getWorkItemType(), null);
					sEnumeration = workItemClient.resolveEnumeration(iAttributeSeverity, null);
					siLiteral = sEnumeration.findEnumerationLiteral(iWorkItem.getSeverity());
					pEnumeration = workItemClient.resolveEnumeration(iAttributePriority, null);
					iWorkFlowInfo = workItemClient.findWorkflowInfo(iWorkItem, null);
					piLiteral = pEnumeration.findEnumerationLiteral(iWorkItem.getPriority());
					workItem = new WorkItem();
					workItem.setId(String.valueOf(iWorkItem.getId()));
					workItem.setName(iWorkItem.getHTMLSummary().getPlainText());
					workItem.setDescription(iWorkItem.getHTMLDescription().getPlainText());
					workItem.setPriority(piLiteral.getName());
					workItem.setSeverity(siLiteral.getName());
					workItem.setStatus(iWorkFlowInfo.getStateName(iWorkItem.getState2()));
					workItem.setType(iWorkItemType.getDisplayName());
					iContributor = (IContributor) iTeamRepository.itemManager().fetchCompleteItem(iWorkItem.getOwner(), IItemManager.REFRESH, null);
					workItem.setOwner(iContributor.getName());
					//Next status for each and every workitem.
					Element workitemtype = XPathUtil.selectSingleElement(workItemTypes, "./workitemtypes/workitemtype[@name='"+iWorkItemType.getDisplayName()+"']");
					Element[] statuses = XPathUtil.selectElements(workitemtype, "./statuses/status");
					workItemStatus = new ArrayList<WorkItemStatus>();
					for (Element status : statuses) {
						itemStatus= new WorkItemStatus();
						itemStatus.setId(status.getAttribute("id"));
						itemStatus.setName(status.getAttribute("name"));
						workItemStatus.add(itemStatus);
					}
					if(workItemStatus != null && !workItemStatus.isEmpty()){
						Collections.sort(workItemStatus, new WorkItemStatus());
						workItem.setActions(workItemStatus);
					}
					workItemsSet.add(workItem);
				}
				LOG.info("Work Items for selected Sprint::"+workItemsSet.size());
				workItems.setWorkitems((TreeSet<WorkItem>)workItemsSet.descendingSet());
				rootEle = JAXBUtils.getXMLObject(workItems, WorkItems.class);
				
			}else{
					return  Messages.ALM_SPRINTID_VALIDATION_MSG;
			}
		} catch (TeamRepositoryException | JAXBException | ParserConfigurationException | SAXException | IOException | XPathExpressionException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), tre.getMessage());
		}
		return rootEle;
	}
	
	public static ArrayList<String> findAllPredefinedQueries(IProjectArea projectArea) throws RabitServicesException {
		ArrayList<String> sharedQueries = new ArrayList<String>();
		ITeamRepository teamRepository = (ITeamRepository) projectArea.getOrigin();
		IWorkItemClient workItemClient = (IWorkItemClient) teamRepository.getClientLibrary(IWorkItemClient.class);
		IQueryClient queryClient = workItemClient.getQueryClient();
		List sharingTargets = new ArrayList();
		sharingTargets.add(projectArea);
		List<IQueryDescriptor> queries;
		try {
			queries = queryClient.findSharedQueries(projectArea.getProjectArea(), sharingTargets, QueryTypes.WORK_ITEM_QUERY, IQueryDescriptor.FULL_PROFILE, new LogProgressMonitor());
			for (IQueryDescriptor iQueryDescriptor : queries) {
				sharedQueries.add(iQueryDescriptor.getName());
			}
		} catch (TeamRepositoryException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), ExceptionCode.RTCCONNECTIONEXCEPTION.getDescription());
		}
		return sharedQueries;
	}
	@Override
	public String updateWorkItemStatus(String orgName,String labelName, String projectKey, String workItemId, String status,String commentMsg, Logger LOG) throws RabitServicesException {
		if(LOG == null) {
			LOG = RTCConnector.LOG;
		}
		String result = Messages.FAILED;
		IWorkItemClient workItemClient = (IWorkItemClient) iTeamRepository.getClientLibrary(IWorkItemClient.class);
		int id = new Integer(workItemId).intValue();
		IWorkItem workItem = null;
		String currentStatus = "";
		IWorkItemWorkingCopyManager wcm = null;
		try {
			workItem = workItemClient.findWorkItemById(id, IWorkItem.FULL_PROFILE, null);
			wcm = workItemClient.getWorkItemWorkingCopyManager();
			wcm.connect(workItem, IWorkItem.FULL_PROFILE, null);
			WorkItemWorkingCopy wc = wcm.getWorkingCopy(workItem);
			IWorkflowInfo workflowInfo = workItemClient.findWorkflowInfo(workItem, null);
			currentStatus = workflowInfo.getStateName(workItem.getState2());
			LOG.info("Work Item:"+ id+" Current Status:"+currentStatus);
			Identifier <IState> [] allStatus = workflowInfo.getAllStateIds();
			Identifier<IState> state = null;
			for (Identifier<IState> identifier : allStatus) {
				if(status.equalsIgnoreCase(workflowInfo.getStateName(identifier))) {
					state = identifier;
				}
			}
			wc.getWorkItem().setState2(state);	
			//Adding comments to the work itemm
			if(commentMsg != null && !"".equalsIgnoreCase(commentMsg)){
				IComments comments= wc.getWorkItem().getComments();
				IComment comment= comments.createComment(wc.getWorkItem().getOwner(),XMLString.createFromPlainText(commentMsg));
				comments.append(comment);	
			}
			IDetailedStatus s = wc.save(null);
			if (!s.isOK()) {
				throw new TeamRepositoryException("Error saving work item", s.getException());
			}
			currentStatus = workflowInfo.getStateName(workItem.getState2());
			LOG.info("Work item:"+id+" Updated Status:"+ workflowInfo.getStateName(workItem.getState2()));
			result = Messages.SUCCESS;
		} catch (TeamRepositoryException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.RTCCONNECTIONEXCEPTION.getCode(), ExceptionCode.RTCCONNECTIONEXCEPTION.getDescription());
		}
		finally{
			if(wcm != null){
				wcm.disconnect(workItem);
			}
		}
		return result;
	}
	@Override
	public String testConnection(String url,String userName,String password, Logger LOG) throws RabitServicesException {
		if(LOG == null) {
			LOG = RTCConnector.LOG;
		}
		RTCAuthenticator.startRTCClient();
		if(rtcConnector == null) {
			rtcConnector = new RTCConnector();
		}
		monitor = new LogProgressMonitor();
		try {
			iTeamRepository = RTCAuthenticator.login(new LogProgressMonitor(), url, userName, password);
			if(iTeamRepository != null){
				return Messages.SUCCESS;
			}else{
				throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
			}
		} catch (TeamRepositoryException tre) {
			LOG.error(tre.getMessage(), tre);
			throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
		}
	}
	
	@Override
	public Object getAllStatuses(String projId) throws RabitServicesException {
		return null;
	}
	@Override
	public Object getworkItem(String orgName,String labelName,String workItemId,String projectId) throws RabitServicesException {

		WorkItem workItem = new WorkItem();
		try {
			IWorkItemClient workItemClient = (IWorkItemClient) iTeamRepository.getClientLibrary(IWorkItemClient.class);
			IWorkItem iWorkItem = null;
			IWorkflowInfo iWorkFlowInfo = null;
			IEnumeration<? extends ILiteral> pEnumeration = null;
			IEnumeration<? extends ILiteral> sEnumeration = null;
			ILiteral piLiteral = null;
			ILiteral siLiteral = null;
			IWorkItemType iWorkItemType = null;
			ITeamRepository repository = null;
			IProjectArea projectArea = null;
			IIterationHandle iterHandle= null;
			IIteration iteration = null;
			iWorkItem = workItemClient.findWorkItemById(Integer.parseInt(workItemId), IWorkItem.FULL_PROFILE, null);
			IProjectAreaHandle projectAreaHandle = iWorkItem.getProjectArea();
			List<IAttribute> iAttributes = workItemClient.findAttributes(projectAreaHandle, null);
			IAttribute iAttributePriority = null;
			IAttribute iAttributeSeverity = null;
			IContributor iContributor = null;
			for (IAttribute iAttribute : iAttributes) {
				System.out.println(iAttribute.getDisplayName());
				if(iAttribute.getDisplayName().equalsIgnoreCase("Severity")) {
					iAttributeSeverity = iAttribute;
				} else if(iAttribute.getDisplayName().equalsIgnoreCase("Priority")) {
					iAttributePriority = iAttribute;
				}else if(iAttribute.getDisplayName().equalsIgnoreCase("Project Area")) {
					repository = (ITeamRepository)projectAreaHandle.getOrigin();
					projectArea = (IProjectArea)repository.itemManager().fetchCompleteItem(projectAreaHandle, IItemManager.DEFAULT, null);
					iterHandle= iWorkItem.getTarget();
					iteration = (IIteration) repository.itemManager().fetchCompleteItem((IIterationHandle) iterHandle,IItemManager.DEFAULT, null);
					workItem.setProjectid(projectArea.getName());
					workItem.setProjectName(projectArea.getName());
					workItem.setSprint(iteration.getName());
				}
			}
			sEnumeration = workItemClient.resolveEnumeration(iAttributeSeverity, null);
			siLiteral = sEnumeration.findEnumerationLiteral(iWorkItem.getSeverity());
			pEnumeration = workItemClient.resolveEnumeration(iAttributePriority, null);
			iWorkFlowInfo = workItemClient.findWorkflowInfo(iWorkItem, null);
			piLiteral = pEnumeration.findEnumerationLiteral(iWorkItem.getPriority());
			iWorkItemType = workItemClient.findWorkItemType(projectAreaHandle, iWorkItem.getWorkItemType(), null);
			workItem.setId(String.valueOf(iWorkItem.getId()));
			workItem.setTitle(iWorkItem.getHTMLSummary().getPlainText() );
			workItem.setDescription(iWorkItem.getHTMLDescription().getPlainText());
			workItem.setPriority(piLiteral.getName());
			workItem.setSeverity(siLiteral.getName());
			workItem.setStatus(iWorkFlowInfo.getStateName(iWorkItem.getState2()));
			workItem.setType(iWorkItemType.getDisplayName());
			iContributor = (IContributor) iTeamRepository.itemManager().fetchCompleteItem(iWorkItem.getOwner(), IItemManager.REFRESH, null);
			workItem.setOwner(iContributor.getName());
			workItem.setConnectorType(ConnectorTypes.IBMRTC.getConnectorType().toLowerCase());

		} catch (Exception jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.WEBSERVICEEXCEPTION.getCode(),jaxbe.getMessage());
		}
		return workItem;
	}
}
