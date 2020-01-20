package com.rabit.alm.vstfs;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.TreeSet;

import javax.naming.AuthenticationException;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.microsoft.tfs.core.TFSTeamProjectCollection;
import com.microsoft.tfs.core.clients.workitem.CoreFieldReferenceNames;
import com.microsoft.tfs.core.clients.workitem.WorkItem;
import com.microsoft.tfs.core.clients.workitem.node.Node;
import com.microsoft.tfs.core.clients.workitem.project.Project;
import com.microsoft.tfs.core.clients.workitem.project.ProjectCollection;
import com.microsoft.tfs.core.clients.workitem.query.WorkItemCollection;
import com.microsoft.tfs.core.clients.workitem.wittype.WorkItemType;
import com.microsoft.tfs.core.httpclient.UsernamePasswordCredentials;
import com.microsoft.tfs.core.util.URIUtils;
import com.rabit.alm.ALMLoginDetails;
import com.rabit.alm.ALMProject;
import com.rabit.alm.ALMProjects;
import com.rabit.alm.ALMUtils;
import com.rabit.alm.PlannedForType;
import com.rabit.alm.PlannedForTypes;
import com.rabit.alm.QueryParams;
import com.rabit.alm.WorkItemStatus;
import com.rabit.alm.WorkItemStatuses;
import com.rabit.alm.WorkItemTypes;
import com.rabit.alm.WorkItems;
import com.rabit.connectors.ConnectorTypes;
import com.rabit.connectors.RMConnector;
import com.rabit.errorcodes.ErrorCodeMessages;
import com.rabit.errorcodes.ExceptionCode;
import com.rabit.main.Constants;
import com.rabit.main.Messages;
import com.rabit.service.ws.exception.RabitServicesException;
import com.rabit.util.file.FileUtil;
import com.rabit.util.jaxb.JAXBUtils;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientHandlerException;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.Base64;

/**
 * 
 * @author ramesh.m
 *
 */
public class VSTFSConnector implements RMConnector {

	private static final Logger LOG = Logger.getLogger(VSTFSConnector.class);
	private static VSTFSConnector vstfsConnector;
	private static String vstfsBaseURL = null;
	private static TFSTeamProjectCollection tpc = null;
	private static String orgname;
	private static String fToken = null;

	private VSTFSConnector() {
	}

	public static VSTFSConnector getInstance(String orgName, String userEmail, String labelName)
			throws RabitServicesException {
		orgname = orgName;
		if (vstfsConnector == null) {
			vstfsConnector = new VSTFSConnector();
		}
		if (Messages.TEST_MSG.equalsIgnoreCase(userEmail)) {
			return vstfsConnector;
		}
		createInstance(orgName, userEmail, labelName);
		return vstfsConnector;
	}

	public static void createInstance(String orgName, String userEmail, String labelName)
			throws RabitServicesException {
		ALMLoginDetails almLoginDetails = null;
		try {
			almLoginDetails = new ALMUtils(orgName, userEmail, labelName).getLoginDetails();
			if (almLoginDetails != null) {
				vstfsBaseURL = almLoginDetails.getUrl();
				vstfsConnector.testConnection(vstfsBaseURL, almLoginDetails.getUserName(),
						almLoginDetails.getPassWord(), LOG);
				fToken = new String(Base64.encode(almLoginDetails.getUserName() + ":" + almLoginDetails.getPassWord()));
			} else {
				LOG.error(ErrorCodeMessages.ALMLOGIN_DETAILS);
				throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(),
						ExceptionCode.ALMLOGINDETAILSEXCEPTION.getDescription());
			}
		} catch (Exception e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.VSTFSAUTHENTICATIONFAILED.getCode(),
					ExceptionCode.VSTFSAUTHENTICATIONFAILED.getDescription());
		}
	}

	@Override
	public String testConnection(String url, String userName, String password, Logger LOG) throws RabitServicesException {
		if(LOG == null) {
			LOG = VSTFSConnector.LOG;
		}
		String message = "";
		tpc = connectToTFS(url, userName, password);
		if (tpc != null && tpc.getWorkItemClient() != null) {
			try {
				tpc.authenticate();
				message = Messages.SUCCESS;
			} catch (Exception e) {
				LOG.debug(e.getMessage(), e);
				message = e.getMessage();
			}
		} else {
			LOG.error(ExceptionCode.ALMAUTHFAIL.getDescription());
			throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(),
					ExceptionCode.ALMAUTHFAIL.getDescription());
		}
		return message;
	}

	public TFSTeamProjectCollection connectToTFS(String url, String userName, String password) {
		return new TFSTeamProjectCollection(URIUtils.newURI(url), new UsernamePasswordCredentials(userName, password));
	}

	@Override
	public Object getProjects(String orgName) throws RabitServicesException {
		ALMProjects almProjects = new ALMProjects();
		ArrayList<ALMProject> almProjectList = new ArrayList<>();
		ALMProject almProject = null;
		Element projectsElement = null;
		try {
			ProjectCollection projectCollection = tpc.getWorkItemClient().getProjects();
			LOG.info("Number Of Project Avaible ::" + projectCollection.size());
			for (int i = 0; i < projectCollection.size(); i++) {
				Project project = projectCollection.getProjects()[i];
				almProject = new ALMProject();
				almProject.setId(Integer.toString(project.getID()));
				almProject.setKey(Integer.toString(project.getID()));
				almProject.setName(project.getName());
				almProjectList.add(almProject);
			}
			almProjects.setProjects(almProjectList);
			projectsElement = JAXBUtils.getXMLObject(almProjects, ALMProjects.class);
		} catch (JAXBException | ParserConfigurationException | SAXException | IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ioe.getMessage());
		}
		return projectsElement;
	}

	@Override
	public Object getPlannedForList(String projectKey, QueryParams queryParams) throws RabitServicesException {
		Element iterationEle = null;
		PlannedForType plannedType = null;
		PlannedForTypes plannedTypes = new PlannedForTypes();
		ArrayList<PlannedForType> plannedTypeList = new ArrayList<>();
		try {
			Project project = tpc.getWorkItemClient().getProjects().getByID(Integer.parseInt(projectKey));
			if (project != null && project.getIterationRootNodes() != null
					&& project.getIterationRootNodes().size() > 0) {
				Node[] nodeCollection = project.getIterationRootNodes().getNodes();
				LOG.info("Total Number of Iterations::" + nodeCollection.length + " For Project::" + project.getName());
				for (int j = 0; j < nodeCollection.length; j++) {
					plannedType = new PlannedForType();
					plannedType.setId(Integer.toString(nodeCollection[j].getID()));
					plannedType.setName(nodeCollection[j].getName());
					plannedType.setDisplayname(nodeCollection[j].getName());
					plannedTypeList.add(plannedType);
				}
				plannedTypes.setPlannedfortypes(plannedTypeList);
				iterationEle = JAXBUtils.getXMLObject(plannedTypes, PlannedForTypes.class);
			}
		} catch (JAXBException | ParserConfigurationException | SAXException | IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ioe.getMessage());
		}
		return iterationEle;
	}

	@Override
	public Object getAllWorkItems(String projectKey, QueryParams queryParams) throws RabitServicesException {
		Element rootEle = null;
		com.rabit.alm.WorkItem arworkItem = null;
		WorkItems workItems = new WorkItems();
		WorkItemStatuses statuses = null;
		TreeSet<com.rabit.alm.WorkItem> workItemsSet = new TreeSet<>();
		List<WorkItemStatus> actionList = new ArrayList<WorkItemStatus>();
		String wiqlQuery = null;
		try {
			LOG.info("IN getAllWorkItems for Project::" + projectKey + " ProjectName::" + queryParams.getProjectName());
			boolean trueFlag = true;
			boolean falseFlag = false;
			boolean getOnlyParentWorkitems;
			Properties properties = FileUtil.loadPropertyFile(Constants.ALM_PROP_FILE);
			String addQuery = "";
			if (properties != null && properties.getProperty("vstfsparenttypeorgs") != null) {
				getOnlyParentWorkitems = properties.getProperty("vstfsparenttypeorgs").contains(orgname) ? trueFlag
						: falseFlag;
				if (getOnlyParentWorkitems && properties.getProperty("vstfsparentworkitemtypes") != null) {
					addQuery = " AND [System.WorkItemType] IN " + properties.getProperty("vstfsparentworkitemtypes");
				}
			}
			if (queryParams != null && queryParams.getSprintId() != null
					&& !"undefined".equalsIgnoreCase(queryParams.getSprintId())) {
				wiqlQuery = "SELECT [System.Id],[System.WorkItemType],[system.AssignedTo],[System.Title],[Description],[Severity],[System.State],[System.AreaPath],[system.TeamProject] FROM workitems WHERE [System.IterationId] ="
						+ queryParams.getSprintId().trim() + addQuery + " ORDER BY [System.Id] DESC";
			} else {
				wiqlQuery = "SELECT [System.Id],[System.WorkItemType],[system.AssignedTo],[System.Title],[Description],[Severity],[System.State],[System.AreaPath] FROM workitems WHERE [System.TeamProject] ='"
						+ queryParams.getProjectName().trim() + addQuery + "' ORDER BY [System.Id] DESC";
			}
			if (wiqlQuery != null) {
				WorkItemCollection workItemsCollection = tpc.getWorkItemClient().query(wiqlQuery);
				LOG.info("Total Number of Workitems::" + workItemsCollection.size());
				for (int i = 0; i < workItemsCollection.size(); i++) {
					WorkItem workitem = workItemsCollection.getWorkItem(i);
					arworkItem = new com.rabit.alm.WorkItem();
					arworkItem.setId(Integer.toString(workitem.getID()));
					arworkItem.setKey(Integer.toString(workitem.getID()));
					arworkItem.setName(workitem.getTitle());
					arworkItem.setType(workitem.getType().getName());
					arworkItem.setDescription(
							(workitem.getFields().getField(CoreFieldReferenceNames.DESCRIPTION).getValue() != null
									? workitem.getFields().getField(CoreFieldReferenceNames.DESCRIPTION).getValue()
											.toString()
									: ""));
					arworkItem.setAssigne(
							(workitem.getFields().getField(CoreFieldReferenceNames.ASSIGNED_TO).getValue() != null
									? workitem.getFields().getField(CoreFieldReferenceNames.ASSIGNED_TO).getValue()
											.toString()
									: ""));
					arworkItem.setPriority((workitem.getFields().getField("Severity").getValue() != null
							? workitem.getFields().getField("Severity").getValue().toString()
							: ""));
					arworkItem
							.setStatus((workitem.getFields().getField(CoreFieldReferenceNames.STATE).getValue() != null
									? workitem.getFields().getField(CoreFieldReferenceNames.STATE).getValue().toString()
									: ""));
					arworkItem.setProjectkey(Integer.toString(workitem.getProject().getID()));
					statuses = (WorkItemStatuses) getStatuses(queryParams.getProjectName(), arworkItem.getType());
					if (statuses != null) {
						actionList = statuses.getStatuses();
						arworkItem.setActions(actionList);
					}
					workItemsSet.add(arworkItem);
				}
				workItems.setWorkitems((TreeSet<com.rabit.alm.WorkItem>) workItemsSet.descendingSet());
				rootEle = JAXBUtils.getXMLObject(workItems, WorkItems.class);
			}

		} catch (ParserConfigurationException | SAXException | IOException | JAXBException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ioe.getMessage());

		}
		return rootEle;
	}

	@Override
	public Object getWorkItemTypes(String projectName) throws RabitServicesException {
		Element rootEle = null;
		try {
			WorkItemType[] types = tpc.getWorkItemClient().getProjects().get(projectName).getVisibleWorkItemTypes();
			LOG.info("work item types ::" + types.length + " for project::" + projectName);
			WorkItemTypes aritemTypes = new WorkItemTypes();
			com.rabit.alm.WorkItemType aritemType = null;
			ArrayList<com.rabit.alm.WorkItemType> aritemTypeList = new ArrayList<>();
			WorkItemStatuses statuses = null;
			for (WorkItemType type : types) {
				aritemType = new com.rabit.alm.WorkItemType();
				aritemType.setId(Integer.toString(type.getID()));
				aritemType.setName(type.getName());
				aritemType.setDisplayname(type.getName());
				statuses = (WorkItemStatuses) getStatuses(projectName, aritemType.getName());
				if (statuses != null) {
					aritemType.setStatuses(statuses);
				}
				aritemTypeList.add(aritemType);
			}
			if (!aritemTypeList.isEmpty()) {
				Collections.sort(aritemTypeList, new com.rabit.alm.WorkItemType());
			}
			aritemTypes.setWorkitemtypes(aritemTypeList);
			rootEle = JAXBUtils.getXMLObject(aritemTypes, WorkItemTypes.class);
		} catch (ParserConfigurationException | SAXException | IOException | JAXBException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ioe.getMessage());
		}
		return rootEle;
	}

	@Override
	public Object getStatuses(String projectKey, String workItemType) throws RabitServicesException {
		WorkItemStatuses statuses = new WorkItemStatuses();
		WorkItemStatus status = null;
		ArrayList<WorkItemStatus> statusesList = new ArrayList<>();
		String workitemTypesURL = "/_apis/wit/workitemtypes/";
		String apiVersion = "/states?api-version=5.0-preview.1";
		String states = null;
		if (workItemType != null) {
			try {
				workItemType = workItemType.replace(" ", "%20");
				projectKey = projectKey.replace(" ", "%20");
				states = invokeGetMethod(projectKey + workitemTypesURL + workItemType + apiVersion);
				JSONObject jsonObject = new JSONObject(states);
				if (jsonObject.has("count")) {
					LOG.info(workItemType + " Count of states::" + jsonObject.getString("count"));
					JSONArray statesArray = new JSONArray(jsonObject.getString("value"));
					for (int j = 0; j < statesArray.length(); j++) {
						JSONObject projsub = statesArray.getJSONObject(j);
						status = new WorkItemStatus();
						status.setId(projsub.getString("color"));
						status.setName(projsub.getString("name"));
						status.setType("category");
						statusesList.add(status);
					}
					statuses.setStatuses(statusesList);
				}
			} catch (AuthenticationException | ClientHandlerException | JSONException ioe) {
				LOG.error(ioe.getMessage(), ioe);
				throw new RabitServicesException(ioe.getMessage());
			}
		}
		return statuses;
	}

	private static String invokeGetMethod(String url) throws AuthenticationException, ClientHandlerException {
		Client client = Client.create();
		WebResource webResource = client.resource(vstfsBaseURL + "/" + url);
		// EnableBasic Authentication
		ClientResponse response = webResource.header("Authorization", "Basic " + fToken)
				.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);

		/*
		 * ClientResponse response = webResource.header("Authorization", "Bearer " +
		 * fToken).type(MediaType.APPLICATION_JSON)
		 * .accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
		 */
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException("Invalid Username or Password");
		}
		return response.getEntity(String.class);
	}

	@Override
	public String updateWorkItemStatus(String orgName, String labelName, String projectKey, String workItemId,
			String status, String comment, Logger LOG) throws RabitServicesException {
		if(LOG == null) {
			LOG = VSTFSConnector.LOG;
		}
		String result = Messages.FAILED;
		try {
		WorkItem workItem = tpc.getWorkItemClient().getWorkItemByID(Integer.parseInt(workItemId));
		LOG.info("Workitem::" + workItemId + " Old Status::"
				+ workItem.getFields().getField(CoreFieldReferenceNames.STATE).getValue());
		workItem.getFields().getField(CoreFieldReferenceNames.STATE).setValue(status.trim());
		workItem.getFields().getField(CoreFieldReferenceNames.HISTORY).setValue("<p>" + comment + "</p>");
		workItem.save();
		LOG.info("Updated Workitem::" + workItem.getID() + " and New Status::"
				+ workItem.getFields().getField(CoreFieldReferenceNames.STATE).getValue());
		result = Messages.SUCCESS;
		}catch(Exception e) {
			 LOG.error(e.getMessage(), e);
		}
		return result;
	}

	@Override
	public String createUsers(String orgName, Element almEle) throws RabitServicesException {
		return null;
	}

	@Override
	public Object createProjects(String orgName, String projectName, String projDesc) throws RabitServicesException {
		return null;
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
		return null;
	}

	@Override
	public Object getRequirementsByProject(String orgName, String projectID) throws RabitServicesException {
		return null;
	}

	@Override
	public Object getIssuesByProject(String orgName, String projectKey) throws RabitServicesException {
		return null;
	}

	@Override
	public String createIssues(String orgName, String projectId, String issueType, String subject, String description,
			String status, String priority) throws RabitServicesException {
		return null;
	}

	@Override
	public Object getTaskManagementSummary(String orgName) throws RabitServicesException {
		return null;
	}

	@Override
	public Object getAllStatuses(String projId) throws RabitServicesException {
		return null;
	}

	@Override
	public Object getworkItem(String orgName,String labelName,String workItemId,String projectId) throws RabitServicesException {
		com.rabit.alm.WorkItem arworkItem = new com.rabit.alm.WorkItem();
		try {
		WorkItem workitem = tpc.getWorkItemClient().getWorkItemByID(Integer.parseInt(workItemId));
		LOG.info("Workitem::" + workItemId + "Status::"
				+ workitem.getFields().getField(CoreFieldReferenceNames.STATE).getValue());

		arworkItem.setId(Integer.toString(workitem.getID()));
		arworkItem.setKey(Integer.toString(workitem.getID()));
		arworkItem.setType(workitem.getType().getName());
		arworkItem.setTitle(workitem.getTitle());
		arworkItem.setDescription(
				(workitem.getFields().getField(CoreFieldReferenceNames.DESCRIPTION).getValue() != null
						? workitem.getFields().getField(CoreFieldReferenceNames.DESCRIPTION).getValue()
								.toString()
						: ""));
		arworkItem.setAssigne(
				(workitem.getFields().getField(CoreFieldReferenceNames.ASSIGNED_TO).getValue() != null
						? workitem.getFields().getField(CoreFieldReferenceNames.ASSIGNED_TO).getValue()
								.toString()
						: ""));
		arworkItem.setPriority((workitem.getFields().getField("Severity").getValue() != null
				? workitem.getFields().getField("Severity").getValue().toString()
				: ""));
		arworkItem.setStatus((workitem.getFields().getField(CoreFieldReferenceNames.STATE).getValue() != null
						? workitem.getFields().getField(CoreFieldReferenceNames.STATE).getValue().toString()
						: ""));
		String proj_sprint = workitem.getFields().getField(CoreFieldReferenceNames.ITERATION_PATH).getValue().toString();
		if(proj_sprint != null) {
		String[] proj_sprint_arr = proj_sprint.split("\\\\");
		projectId = tpc.getWorkItemClient().getProjects().get(proj_sprint_arr[0]).getID()+"";
		arworkItem.setProjectid(projectId);
		arworkItem.setProjectName(proj_sprint_arr[0]);
		arworkItem.setSprint(proj_sprint_arr[1]);
		}
		arworkItem.setConnectorType(ConnectorTypes.VSTFS.getConnectorType().toLowerCase());
		}catch (Exception jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.WEBSERVICEEXCEPTION.getCode(),jaxbe.getMessage());
		}
		return arworkItem;
	}

	/*
	 * public static void main(String[] args) {
	 * System.setProperty("com.microsoft.tfs.jni.native.base-directory",
	 * System.getenv("RBA_HOME") + File.separator + "utils" + File.separator +
	 * "tfsutil" + File.separator + "native"); TFSTeamProjectCollection tpc = new
	 * TFSTeamProjectCollection(URIUtils.newURI(serverUrl), new
	 * UsernamePasswordCredentials(userName, password)); //Authenticate Connection
	 * tpc.authenticate(); ProjectCollection projectCollection =
	 * tpc.getWorkItemClient().getProjects();
	 * System.out.println("No Of Project Avaible ::"+projectCollection.size()); for
	 * (int i = 0; i < projectCollection.size(); i++) { Project project =
	 * projectCollection.getProjects()[i];
	 * System.out.println("ProjectName::"+project.getName());
	 * System.out.println("ProjectID::"+project.getID()); Node[] nodeCollection =
	 * project.getIterationRootNodes().getNodes(); for (int j = 0; j <
	 * nodeCollection.length; j++) { System.out.println("IterationName::"+
	 * nodeCollection[j].getName());
	 * System.out.println("IterationID::"+Integer.toString(nodeCollection[j].getID()
	 * )); } WorkItemTypeCollection collection = project.getWorkItemTypes();
	 * System.out.println("work item types ::"+collection.size());
	 * if(collection.getTypes().length >0) { WorkItemType[] types =
	 * collection.getTypes(); for(int k=0;k<types.length ;k++) { WorkItemType type =
	 * types[k]; System.out.println("workitem Type Name::"+type.getName()); } } } }
	 */

	/*
	 * public static void main(String args[]) {
	 * System.setProperty("com.microsoft.tfs.jni.native.base-directory",
	 * System.getenv("RBA_HOME") + File.separator + "utils" + File.separator +
	 * "tfsutil" + File.separator + "native"); String serverUrl =
	 * "https://devteamdemo.visualstudio.com/"; String userName =
	 * "ramesh.m@autorabit.com";
	 *//**
		 * Security Token - This has to be generated by client This will Expired by
		 * 3/5/2018
		 */
	/*
	 * String password = "y7p3yt5auwipzowr7ezxndl4vqgbyb2l3lhaemxleifjycsiupnq";
	 * TFSTeamProjectCollection tpc = new
	 * TFSTeamProjectCollection(URIUtils.newURI(serverUrl), new
	 * UsernamePasswordCredentials(userName, password)); //Authenticate Connection
	 * tpc.authenticate(); ProjectCollection projectCollection =
	 * tpc.getWorkItemClient().getProjects();
	 * System.out.println("No Of Project Avaible ::"+projectCollection.size()); for
	 * (int i = 0; i < projectCollection.size(); i++) { Project project =
	 * projectCollection.getProjects()[i];
	 * System.out.println("ProjectName::"+project.getName());
	 * System.out.println("ProjectID::"+project.getID()); Node[] nodeCollection =
	 * project.getIterationRootNodes().getNodes(); for (int j = 0; j <
	 * nodeCollection.length; j++) { System.out.println("IterationName::"+
	 * nodeCollection[j].getName());
	 * System.out.println("IterationID::"+Integer.toString(nodeCollection[j].getID()
	 * )); } }
	 *//**
		 * This is to fetch the available Projects
		 */
	/*
	 * ProjectCollection projectCollection = tpc.getWorkItemClient().getProjects();
	 * System.out.println("No Of Project Avaible ::"+projectCollection.size()); for
	 * (int i = 0; i < projectCollection.size(); i++) { Project project =
	 * projectCollection.getProjects()[i];
	 * System.out.println("ProjectName::"+project.getName());
	 * System.out.println("ProjectID::"+project.getID());
	 *//**
		 * This is to fetch the Projects Iterations
		 */
	/*
	 * Node[] nodeCollection = project.getIterationRootNodes().getNodes(); for (int
	 * j = 0; j < nodeCollection.length; j++) {
	 * System.out.println("IterationName::"+ nodeCollection[j].getName());
	 * System.out.println("IterationID::"+Integer.toString(nodeCollection[j].getID()
	 * )); }
	 * 
	 *//**
		 * To get All workitem Types
		 */
	/*
	 * WorkItemTypeCollection collection = project.getWorkItemTypes();
	 * System.out.println("work item types ::"+collection.size());
	 * if(collection.getTypes().length >0) { WorkItemType[] types =
	 * collection.getTypes(); for(int k=0;k<types.length ;k++) { WorkItemType type =
	 * types[k]; System.out.println("workitem Type Name::"+type.getName()); } }
	 *//**
		 * To get only visible Workitem Types
		 */
	/*
	 * WorkItemType[] types = project.getVisibleWorkItemTypes(); for(int
	 * k=0;k<types.length ;k++) { WorkItemType type = types[k];
	 * System.out.println("workitem Type Name::"+type.getName()); } }
	 *//**
		 * Get revision Info
		 */
	/*
	 * WorkItemClient workItemClient = tpc.getWorkItemClient(); WorkItem
	 * wi=workItemClient.getWorkItemByID(252); RevisionCollection rsc=
	 * wi.getRevisions(); for(Revision rev:rsc) { for(RevisionField
	 * fs:rev.getFields()) {
	 * System.out.println(fs.getName()+";"+fs.getValue()+""+fs.getOriginalValue());
	 * } }
	 * 
	 *//**
		 * To Get All the Workitems Query Need to Modify to get workitems by Selected
		 * Iteration.
		 */
	/*
	 * // String wiqlQuery = //
	 * "Select [System.Id], [System.Title], [System.State],[system.AssignedTo],[Description],[Severity] from WorkItems where (State = 'New') order by Title"
	 * ;
	 * 
	 * 
	 * // String wiqlQuery =
	 * "SELECT [System.Id],[System.WorkItemType],[system.AssignedTo],[System.Title],[Description],[Severity],[System.State],[System.AreaPath],[system.TeamProject] FROM workitems WHERE [System.IterationId] ="
	 * + "132  AND [System.WorkItemType] IN ('Bug','Product Backlog Item') "
	 * +" ORDER BY [System.Id] DESC";
	 * 
	 * String wiqlQuery =
	 * "SELECT [System.Id],[System.WorkItemType],[system.AssignedTo],[System.Title],[Description],[Severity],[System.State],[System.AreaPath],[system.TeamProject] FROM workitems WHERE [System.IterationId] ="
	 * + "108"+" ORDER BY [System.Id] DESC";
	 * 
	 * 
	 * 
	 * WorkItemCollection workItems = tpc.getWorkItemClient().query(wiqlQuery);
	 * System.out.println("**************************************");
	 * System.out.println("**************************************");
	 * System.out.println("Number Of Workitems::"+workItems.size()); for (int i = 0;
	 * i < workItems.size(); i++) { WorkItem workitem = workItems.getWorkItem(i);
	 * tpc = new TFSTeamProjectCollection(URIUtils.newURI(serverUrl), new
	 * UsernamePasswordCredentials(userName, password));
	 * System.out.println(workitem.getType().getName()+" ::"+workitem.getID()
	 * +":: "+workitem.getTitle()+"::"+workitem.getFields().getField("Assigned to").
	 * getValue()+"::"+workitem.getFields().getField("State").getValue()+"::"+
	 * "::"+workitem.getFields().getField("Severity").getValue());
	 * 
	 * }
	 *//**
		 * Update the state and Comment
		 */
	/*
	 * WorkItem workitem = tpc.getWorkItemClient().getWorkItemByID(4799);
	 * LOG.info("Workitem::"+workitem.getID()+" Old Status::"+workitem.getFields().
	 * getField(CoreFieldReferenceNames.STATE).getValue());
	 * workitem.getFields().getField(CoreFieldReferenceNames.STATE).setValue(
	 * "Committed");
	 * workitem.getFields().getField(CoreFieldReferenceNames.HISTORY).setValue(
	 * "<p>Created automatically by a sample Rams2</p>"); workitem.save();
	 * 
	 *//**
		 * Create Workitem
		 *//*
			 * Project project = tpc.getWorkItemClient().getProjects().getByID(2);
			 * WorkItemType bugWorkItemType = project.getWorkItemTypes().get("Bug");
			 * 
			 * // Create a new work item of the specified type. WorkItem newWorkItem =
			 * project.getWorkItemClient().newWorkItem(bugWorkItemType);
			 * 
			 * // Set the title on the work item. newWorkItem.setTitle("Example Work Item");
			 * 
			 * // Add a comment as part of the change
			 * newWorkItem.getFields().getField(CoreFieldReferenceNames.HISTORY).setValue(
			 * "<p>Created automatically by a sample</p>");
			 * 
			 * // Save the new work item to the server. newWorkItem.save(); }
			 */
}
