package com.rabit.alm.pivotal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.naming.AuthenticationException;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.rabit.alm.ALMLoginDetails;
import com.rabit.alm.ALMProject;
import com.rabit.alm.ALMProjects;
import com.rabit.alm.ALMUtils;
import com.rabit.alm.GITRepoWorkItem;
import com.rabit.alm.GITRepoWorkItems;
import com.rabit.alm.PlannedForType;
import com.rabit.alm.PlannedForTypes;
import com.rabit.alm.QueryParams;
import com.rabit.alm.WorkItem;
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
import com.rabit.util.DateUtil;
import com.rabit.util.jaxb.JAXBUtils;
import com.rabit.util.xml.DOMUtil;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientHandlerException;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
public class PivotalConnector implements RMConnector{
	private static final Logger LOG = Logger.getLogger(PivotalConnector.class);
	private static PivotalConnector pivotalConnector;
	private static String fToken = null;
	private static String PIVOTALTRACKER_URL = null;
	private static final String GET_API_URL = "/services/v5/me";
	private static final String GET_PROJECT_URL = "/services/v5/projects/";
	private static final String STORY_TRANSITIONS = "/story_transitions";
	private static final String STORIES = "/stories/";
	private static final String ITERATIONS = "/iterations/";
	private static final String COMMENTS = "/comments";
	private static final String OWNERS = "/owners/";
	private static final List<String> storyTypes = Arrays.asList("feature", "bug", "chore", "release");
	private static final String INVALID_PASSSWORD_MSG = "Invalid Username or Password";
	private static final String XTRACKER_TOKEN = "X-TrackerToken";
	private static final String NUMBER = "number";
	private static final String STATE = "state";

	private PivotalConnector() {
	}

	public static PivotalConnector getInstance(String orgName, String userEmail,String labelName) throws RabitServicesException {
		if (pivotalConnector == null) {
			pivotalConnector = new PivotalConnector();
		}
		if (Messages.TEST_MSG.equalsIgnoreCase(userEmail)) {
			return pivotalConnector;
		}
		createInstance(orgName, userEmail,labelName);
		return pivotalConnector;
	}
	public static void createInstance(String orgName,String userEmail,String labelName) throws RabitServicesException {
		ALMLoginDetails almLoginDetails = null;
		try {
			almLoginDetails = new ALMUtils(orgName,userEmail,labelName).getLoginDetails();
			if(almLoginDetails != null){
				PIVOTALTRACKER_URL = almLoginDetails.getUrl();
				loginToPivotal(almLoginDetails.getUserName(), almLoginDetails.getPassWord());
			}else{
				LOG.error(ErrorCodeMessages.ALMLOGIN_DETAILS);
				throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(),ExceptionCode.ALMLOGINDETAILSEXCEPTION.getDescription());
			}
		} 
		catch (ClientHandlerException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.PIVOTALTRACKERAUTHFAIL.getCode(), ExceptionCode.PIVOTALTRACKERAUTHFAIL.getDescription());
		} catch (AuthenticationException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.PIVOTALTRACKERAUTHFAIL.getCode(), ExceptionCode.PIVOTALTRACKERAUTHFAIL.getDescription());
		} 
	}

	public static String loginToPivotal(String userName,String password) throws AuthenticationException, ClientHandlerException{
		String userCredentials ="";
		if(!"".equalsIgnoreCase(PIVOTALTRACKER_URL.trim()) && !"".equalsIgnoreCase(userName.trim())&&!"".equalsIgnoreCase(password.trim())){
			LOG.info("Pivotal REST Service is initialized: " + PIVOTALTRACKER_URL+ GET_API_URL);
			fToken = "220ee970175cde047eb998082f78a1cf";
			userCredentials = invokeGetMethod(PIVOTALTRACKER_URL+ GET_API_URL);
			if(userCredentials != null){
				return Messages.SUCCESS;
			}
		}else{
			LOG.error("Please verify the credentials. not able to connect to PIVOTAL");
		}
		return userCredentials;
	}
	@Override
	public String testConnection(String url, String userName, String password, Logger LOG) throws RabitServicesException {
		if(LOG == null) {
			LOG = PivotalConnector.LOG;
		}
		if(!"".equalsIgnoreCase(url.trim()) && !"".equalsIgnoreCase(userName.trim())&&!"".equalsIgnoreCase(password.trim())){
			LOG.info("Pivotsl REST Service is initialized: " + url+ GET_API_URL);
			fToken = password;
			Client client = Client.create();
			WebResource webResource = client.resource( url + GET_API_URL );
			ClientResponse response = webResource.header(XTRACKER_TOKEN, fToken).type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
			int statusCode = response.getStatus();
			if(statusCode == 200){
				return Messages.SUCCESS; 
			}else{
				throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
			}
		}
		return ErrorCodeMessages.PIVOTALTRACKER_AUTH_FAIL_MSG;
	}

	@Override
	public Object getProjects(String orgName) throws RabitServicesException {
		Element projectsElement = null;
		ALMProject project = null;
		try {
			ALMProjects almProjects = new ALMProjects();
			ArrayList<ALMProject> projectList = new ArrayList<>();
			String projects = invokeGetMethod(PIVOTALTRACKER_URL+GET_API_URL);
			JSONObject projs = new JSONObject(projects);
			JSONObject proj =null;
			JSONArray projectArray=projs.getJSONArray("projects");
			for (int i = 0; i < projectArray.length(); i++) {
				proj = projectArray.getJSONObject(i);
				project = new ALMProject();
				project.setId(proj.getString("project_id"));
				project.setName(proj.getString("project_name"));
				projectList.add(project);
			}
			almProjects.setProjects(projectList);
			projectsElement = JAXBUtils.getXMLObject(almProjects, ALMProjects.class);
		}  catch (AuthenticationException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.PIVOTALTRACKERAUTHFAIL.getCode(), ExceptionCode.PIVOTALTRACKERAUTHFAIL.getDescription());
		} catch (JSONException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ie.getMessage());
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			LOG.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}
		return projectsElement;
	}

	@Override
	public Object getWorkItemTypes(String projectKey) throws RabitServicesException {
		Element rootEle = null;
		WorkItemTypes itemTypes = new WorkItemTypes();
		WorkItemType itemType = null;
		ArrayList<WorkItemType> itemTypeList = new ArrayList<>();
		WorkItemStatuses statuses = null;
		WorkItemStatus wiStatus = null;
		ArrayList<WorkItemStatus> statusesList = null;
		JSONArray storyJsonArray = null;
		Set<String> storySet = new HashSet<>();
		try {
			statuses = new WorkItemStatuses();
			statusesList = new ArrayList<>();
			LOG.info("projectId:" + projectKey);
			String transitions = invokeGetMethod(PIVOTALTRACKER_URL + GET_PROJECT_URL + projectKey + STORY_TRANSITIONS);
			storyJsonArray = new JSONArray(transitions);
			for (int i = 0; i < storyJsonArray.length(); i++) {
				JSONObject proj = storyJsonArray.getJSONObject(i);
				storySet.add(proj.getString(STATE));
			}
			for (String stat : storySet) {
				wiStatus = new WorkItemStatus();
				wiStatus.setName(stat);
				statusesList.add(wiStatus);
			}
			if (!statusesList.isEmpty()) {
				Collections.sort(statusesList, new WorkItemStatus());
			}
			statuses.setStatuses(statusesList);
			for (int i = 0; i < storyTypes.size(); i++) {
				itemType = new WorkItemType();
				itemType.setName(storyTypes.get(i));
				itemType.setDisplayname(storyTypes.get(i));
				itemType.setStatuses(statuses);
				itemTypeList.add(itemType);
			}
			if (!itemTypeList.isEmpty()) {
				Collections.sort(itemTypeList, new WorkItemType());
			}
			itemTypes.setWorkitemtypes(itemTypeList);
			rootEle = JAXBUtils.getXMLObject(itemTypes, WorkItemTypes.class);
			return rootEle;
		} catch (java.rmi.RemoteException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REMOTEAUTHENTICATIONEXCEPTION.getCode(),ExceptionCode.REMOTEAUTHENTICATIONEXCEPTION.getDescription());
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(),ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			LOG.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(),ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(),ExceptionCode.IOEXCEPTION.getDescription());
		} catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(),ExceptionCode.JAXBEXCEPTION.getDescription());
		} catch (AuthenticationException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.PIVOTALTRACKERAUTHFAIL.getCode(),ExceptionCode.PIVOTALTRACKERAUTHFAIL.getDescription());
		} catch (JSONException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(e.getMessage());
		}
	}

	@Override
	public String updateWorkItemStatus(String orgName,String labelName, String projectKey, String storyId, String status, String comment, Logger LOG) throws RabitServicesException {
		String updateResponse = null;
		if(LOG == null) {
			LOG = PivotalConnector.LOG;
		}
		String result = Messages.FAILED;
		try {
			LOG.info("workItemId:" + storyId + " status:" + status);
			String storyTransiitionURL = GET_PROJECT_URL + projectKey + STORIES + storyId;
			String updateIssueData = "{\"current_state\":\"" + status + "\"}";
			updateResponse = invokePutMethod(storyTransiitionURL, updateIssueData);
			LOG.info("updateStatusResponse::" + updateResponse);
			if (comment != null && !"".equalsIgnoreCase(comment.trim())) {
				String addcomment = "{\"text\":\"" + comment + "\"}";
				String commentresponse = invokePostMethod(GET_PROJECT_URL + projectKey + STORIES + storyId + COMMENTS,addcomment);
				LOG.info("updateCommentResponse::" + commentresponse);
			}
			result = Messages.SUCCESS;
		} catch (AuthenticationException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.PIVOTALTRACKERAUTHFAIL.getCode(),ExceptionCode.PIVOTALTRACKERAUTHFAIL.getDescription());
		}
		return result;
	}

	@Override
	public Object getAllWorkItems(String projectKey, QueryParams queryParams) throws RabitServicesException {
		WorkItem workItem = null;
		WorkItems workItems = new WorkItems();
		TreeSet<WorkItem> workItemsSet = new TreeSet<>();
		Element rootEle = null;
		List<WorkItemStatus> actionslst = null;
		WorkItemStatus workItemStatus = null;
		JSONArray storiesJsonArray = null;
		JSONArray storyJsonArray = null;
		JSONArray ownerJsonObjectArray = null;
		JSONObject storyObj = null;
		JSONObject ownerJsonObject = null;
		JSONObject storyJsonObj = null;
		try {
			String iterationJson = invokeGetMethod(PIVOTALTRACKER_URL + GET_PROJECT_URL + projectKey + ITERATIONS + queryParams.getSprintId());
			String transitions = invokeGetMethod(PIVOTALTRACKER_URL + GET_PROJECT_URL + projectKey + STORY_TRANSITIONS);
			if (queryParams.getSprintId() != null && !"undefined".equalsIgnoreCase(queryParams.getSprintId())) {
				JSONObject projs = new JSONObject(iterationJson);
				storiesJsonArray = projs.getJSONArray("stories");
				for (int j = 0; j < storiesJsonArray.length(); j++) {
					storyJsonObj = storiesJsonArray.getJSONObject(j);
					workItem = new WorkItem();
					workItem.setId(storyJsonObj.getString("id"));
					workItem.setName(storyJsonObj.getString("name"));
					workItem.setType(storyJsonObj.getString("story_type"));
					workItem.setStatus(storyJsonObj.getString("current_state"));
					if (storyJsonObj.has("description"))
						workItem.setDescription(storyJsonObj.getString("description"));
					String ownerJson = invokeGetMethod(PIVOTALTRACKER_URL + GET_PROJECT_URL + projectKey + STORIES + workItem.getId() + OWNERS);
					ownerJsonObjectArray = new JSONArray(ownerJson);
					for (int k = 0; k < ownerJsonObjectArray.length(); k++) {
						ownerJsonObject = ownerJsonObjectArray.getJSONObject(k);
						if (ownerJsonObject.getString("id") != null) {
							workItem.setAssigne(ownerJsonObject.getString("name"));
						}
					}
					storyJsonArray = new JSONArray(transitions);
					actionslst = new ArrayList<>();
					Set<String> statusSet =new HashSet<>();
					for (int i = 0; i < storyJsonArray.length(); i++) {
						storyObj = storyJsonArray.getJSONObject(i);
						if (workItem.getId().equals(storyObj.getString("story_id"))) {
							workItemStatus = new WorkItemStatus();
							if (!statusSet.contains(storyObj.getString(STATE))) {
								workItemStatus.setName(storyObj.getString(STATE));
								actionslst.add(workItemStatus);
								statusSet.add(storyObj.getString(STATE));
							}
						}
					}
					if (!actionslst.isEmpty()) {
						Collections.sort(actionslst, new WorkItemStatus());
						workItem.setActions(actionslst);
					}
					workItemsSet.add(workItem);
				}
				workItems.setWorkitems((TreeSet<WorkItem>)workItemsSet.descendingSet());
				rootEle = JAXBUtils.getXMLObject(workItems, WorkItems.class);
				LOG.info("Root Ele:::::::::::" + DOMUtil.getXMLString(rootEle));
				LOG.info("processing Time completed at::" + DateUtil.getDateTime());
			}
		}catch (java.rmi.RemoteException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REMOTEAUTHENTICATIONEXCEPTION.getCode(),ExceptionCode.REMOTEAUTHENTICATIONEXCEPTION.getDescription());
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(),ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			LOG.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(),ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(),ExceptionCode.IOEXCEPTION.getDescription());
		} catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(),ExceptionCode.JAXBEXCEPTION.getDescription());
		} catch (AuthenticationException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.PIVOTALTRACKERAUTHFAIL.getCode(),ExceptionCode.PIVOTALTRACKERAUTHFAIL.getDescription());
		} catch (JSONException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(e.getMessage());
		} catch (TransformerException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.TRANSFORMEXCEPTION.getCode(),ExceptionCode.TRANSFORMEXCEPTION.getDescription());
		}
		return rootEle;
	}

	@Override
	public Object getPlannedForList(String projectKey, QueryParams queryParams) throws RabitServicesException {
		PlannedForTypes plannedTypes = new PlannedForTypes();
		PlannedForType plannedType = null;
		Element rootEle = null;
		try {
			String projectsJson = invokeGetMethod(PIVOTALTRACKER_URL + GET_PROJECT_URL + projectKey);
			JSONObject projsCurrentIteration = new JSONObject(projectsJson);
			String iterationJson = invokeGetMethod(PIVOTALTRACKER_URL + GET_PROJECT_URL + projectKey + ITERATIONS);
			JSONArray sprintsArray = new JSONArray(iterationJson);
			ArrayList<PlannedForType> plannedTypeList = new ArrayList<>();
			for (int i = 0; i < sprintsArray.length(); i++) {
				JSONObject proj = sprintsArray.getJSONObject(i);
				plannedType = new PlannedForType();
				plannedType.setId(proj.getString(NUMBER));
				plannedType.setName(proj.getString("project_id"));
				if(projsCurrentIteration.getString("current_iteration_number").equals(proj.getString(NUMBER))){
					plannedType.setDisplayname(proj.getString(NUMBER)+ "-" + "Current Iteration");
				}
				else{
					plannedType.setDisplayname(proj.getString(NUMBER));
				}
				plannedTypeList.add(plannedType);
			}
			if(!plannedTypeList.isEmpty()){
				plannedTypes.setPlannedfortypes(plannedTypeList);
			}
			rootEle = JAXBUtils.getXMLObject(plannedTypes, PlannedForTypes.class);
		} catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(),ExceptionCode.JAXBEXCEPTION.getDescription());
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(),ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			LOG.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(),ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(),ExceptionCode.IOEXCEPTION.getDescription());
		} catch (AuthenticationException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.PIVOTALTRACKERAUTHFAIL.getCode(),ExceptionCode.PIVOTALTRACKERAUTHFAIL.getDescription());
		} catch (JSONException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(e.getMessage());
		}
		return rootEle;
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
	public Object getStatuses(String projectKey, String workItemType) throws RabitServicesException {
		return null;
	}
	@Override
	public Object getRequirementsByProject(String orgName, String projectID) throws RabitServicesException {
		return null;
	}	
	@Override
	public String createIssues(String orgName, String projectId, String issueType, String subject, String description, String status, String priority) throws RabitServicesException {
		return null;
	}
	@Override
	public Object getTaskManagementSummary(String orgName) throws RabitServicesException {
		return null;
	}
	@Override
	public Object getIssuesByProject(String orgName, String projectKey) throws RabitServicesException {
		return null;
	}
	private static String invokeGetMethod(String url) throws AuthenticationException, ClientHandlerException {
		Client client = Client.create();
		WebResource webResource = client.resource(url);
		ClientResponse response = webResource.header(XTRACKER_TOKEN, fToken).type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException(INVALID_PASSSWORD_MSG);
		}
		return response.getEntity(String.class);
	}

	private static String invokePutMethod(String url, String data) throws AuthenticationException, ClientHandlerException {
		Client client = Client.create();
		WebResource webResource = client.resource(PIVOTALTRACKER_URL + url);
		ClientResponse response = webResource.type(MediaType.APPLICATION_JSON).header(XTRACKER_TOKEN, fToken).accept(MediaType.APPLICATION_JSON).put(ClientResponse.class, data);
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException(INVALID_PASSSWORD_MSG);
		} else if (statusCode == 403) {
			return Messages.PIVOTALTRAKER_AUHENTICATION_VALIDUSER;
		} else if (statusCode == 204) {
			return "Issue Updated Successfully";
		} else if (statusCode == 201) {
			return "Comment updated Successfully.";
		} else if (statusCode == 400) {
			throw new AuthenticationException(
					"Comment Input is invalid (e.g. missing required fields, invalid values etc)");
		}
		return response.getEntity(String.class);
	}

	private static String invokePostMethod(String url, String data) throws AuthenticationException {
		Client client = Client.create();
		WebResource webResource = client.resource(PIVOTALTRACKER_URL + url);
		ClientResponse response = webResource.type(MediaType.APPLICATION_JSON).header(XTRACKER_TOKEN, fToken).accept(MediaType.APPLICATION_JSON).post(ClientResponse.class, data);
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException(INVALID_PASSSWORD_MSG);
		} else if (statusCode == 403) {
			return Messages.PIVOTALTRAKER_AUHENTICATION_VALIDUSER;
		} else if (statusCode == 204) {
			return "Issue Updated Successfully";
		} else if (statusCode == 201) {
			return "Comment updated Successfully.";
		} else if (statusCode == 400) {
			throw new AuthenticationException("Comment Input is invalid (e.g. missing required fields, invalid values etc)");
		}
		return response.getEntity(String.class);
	}

	public Object getGitBasedPivotalCommits(String projectKey, String storyId) throws RabitServicesException {
		GITRepoWorkItem gitRepoWitem = null;
		GITRepoWorkItems gitRepoWitems = new GITRepoWorkItems();
		Element commitTypeEle = null;
		List<GITRepoWorkItem> gitworkItemsList = new ArrayList<>();
		try {
			String storyCommentTypes = invokeGetMethod(PIVOTALTRACKER_URL + GET_PROJECT_URL + projectKey + STORIES + storyId + COMMENTS);
			JSONArray storyCommentTypeArray = new JSONArray(storyCommentTypes);
			for (int i = 0; i < storyCommentTypeArray.length(); i++) {
				JSONObject commitTypes = storyCommentTypeArray.getJSONObject(i);
				if (commitTypes.has("commit_type")){
					String commentType = commitTypes.getString("commit_type");
					String[] url =commitTypes.getString("text").split("\n");
					 if (commentType.equals("github")) {
						gitRepoWitem = new GITRepoWorkItem();
						gitRepoWitem.setStoryId(storyId);
						gitRepoWitem.setCreatedDate(commitTypes.getString("created_at"));
						gitRepoWitem.setRevisionNum(commitTypes.getString("commit_identifier").substring(0, 7));
						gitRepoWitem.setURL(url[1]);
						gitworkItemsList.add(gitRepoWitem);
					}
					 if(!gitworkItemsList.isEmpty()){
						 gitRepoWitems.setGitrepoworkitems(gitworkItemsList);
					 }
					commitTypeEle = JAXBUtils.getXMLObject(gitRepoWitems, GITRepoWorkItems.class);
				}
			}
		} catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(),ExceptionCode.JAXBEXCEPTION.getDescription());
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(),ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			LOG.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(),ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(),ExceptionCode.IOEXCEPTION.getDescription());
		} catch (AuthenticationException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.PIVOTALTRACKERAUTHFAIL.getCode(),ExceptionCode.PIVOTALTRACKERAUTHFAIL.getDescription());
		} catch (JSONException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(e.getMessage());
		}
		return commitTypeEle;
	}

	@Override
	public Object getAllStatuses(String projId) throws RabitServicesException {
		return null;
	}

	@Override
	public Object getworkItem(String orgName,String labelName,String workItemId,String projectId) throws RabitServicesException {
		WorkItem item = new WorkItem();
		
		try {
			LOG.info("workItemId:" + workItemId + " projectId:" + projectId);
			String storyTransiitionURL = GET_PROJECT_URL + projectId + STORIES + workItemId;
			String updateResponse = invokeGetMethod(storyTransiitionURL);
			JSONObject workItemObj = new JSONObject(updateResponse);
			if(workItemObj.has("current_state")) {
				item.setStatus(workItemObj.getString("current_state"));
			}
			if(workItemObj.has("description")) {
				item.setDescription(workItemObj.getString("description"));
			}
			if(workItemObj.has("project_id")) {
				item.setProjectkey(workItemObj.getString("project_id"));
			}
			item.setConnectorType(ConnectorTypes.PIVOTAL.getConnectorType().toLowerCase());
			LOG.info("updateStatusResponse::" + updateResponse);
		} catch (Exception jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.WEBSERVICEEXCEPTION.getCode(),jaxbe.getMessage());
		}
		return item;
	}

}

