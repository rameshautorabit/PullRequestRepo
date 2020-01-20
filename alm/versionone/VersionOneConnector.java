package com.rabit.alm.versionone;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.TreeMap;
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

import com.rabit.alm.ALMLoginDetails;
import com.rabit.alm.ALMProject;
import com.rabit.alm.ALMProjects;
import com.rabit.alm.ALMUtils;
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
import com.rabit.util.jaxb.JAXBUtils;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientHandlerException;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.Base64;
import com.versionone.Oid;
import com.versionone.apiclient.Asset;
import com.versionone.apiclient.Query;
import com.versionone.apiclient.Services;
import com.versionone.apiclient.V1Connector;
import com.versionone.apiclient.exceptions.APIException;
import com.versionone.apiclient.exceptions.ConnectionException;
import com.versionone.apiclient.exceptions.OidException;
import com.versionone.apiclient.exceptions.V1Exception;
import com.versionone.apiclient.interfaces.IAssetType;
import com.versionone.apiclient.interfaces.IAttributeDefinition;
import com.versionone.apiclient.interfaces.IServices;
import com.versionone.apiclient.services.QueryResult;
/**
 * 
 * @author ramesh.m
 *
 */

public class VersionOneConnector implements RMConnector{
	private static final Logger LOG = Logger.getLogger(VersionOneConnector.class);
    private static String versionOneBaseURL = null;
    private static String fToken = null;
    private static String email = null;
    private static final String ASSETTYPE = "AssetType";
    private static final String ASSETS = "Assets";
    private static final String ATTRIBUTES = "Attributes";
    private static final String TOTAL = "total";
    private static final String VALUE = "value";
    
    private static VersionOneConnector versionOneConnector;
    
    private static TreeMap<String,String> statusesMap = new TreeMap<>();
    private VersionOneConnector(){}
    public static VersionOneConnector getInstance(String orgName,String userEmail,String labelName) throws RabitServicesException{
    	if(versionOneConnector == null){
    		versionOneConnector = new VersionOneConnector();
    	}
    	if(Messages.TEST_MSG.equalsIgnoreCase(userEmail)){
    		return versionOneConnector;
    	}
    	email = userEmail;
		createInstance(orgName,userEmail,labelName);
    	return versionOneConnector;
    }
    public static void createInstance(String orgName,String userEmail,String labelName) throws RabitServicesException {
    	ALMLoginDetails almLoginDetails = null;
		try {
			almLoginDetails = new ALMUtils(orgName,userEmail,labelName).getLoginDetails();
			if(almLoginDetails != null){
				versionOneBaseURL = almLoginDetails.getUrl();
				versionOneConnector.testConnection(versionOneBaseURL,almLoginDetails.getUserName(), almLoginDetails.getPassWord(), null);
			}else{
				LOG.error(ErrorCodeMessages.ALMLOGIN_DETAILS);
				throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(),ExceptionCode.ALMLOGINDETAILSEXCEPTION.getDescription());
			}
		} 
		catch (ClientHandlerException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.VONEAAUTHENTICATIONFAILED.getCode(), ExceptionCode.VONEAAUTHENTICATIONFAILED.getDescription());
		} 
	}
	public static V1Connector loginwithJavSdk(String orgName,String labelName) throws RabitServicesException{
		V1Connector connector = null;
		ALMLoginDetails almLoginDetails = null;
		try {
			almLoginDetails = new ALMUtils(orgName,email,labelName).getLoginDetails();
			if(almLoginDetails != null){
				versionOneBaseURL = almLoginDetails.getUrl();
				if(almLoginDetails.getAccessType() != null && "accesstoken".equalsIgnoreCase(almLoginDetails.getAccessType())){
					connector =  V1Connector.withInstanceUrl(versionOneBaseURL)
							.withUserAgentHeader("AppName", "1.0").withAccessToken(almLoginDetails.getAccessToken().trim()).useOAuthEndpoints().build();
				}else{
					connector =  V1Connector.withInstanceUrl(versionOneBaseURL)
							.withUserAgentHeader("AppName", "1.0").withUsernameAndPassword(almLoginDetails.getUserName(), almLoginDetails.getPassWord()).build();
				}
			}else{
				LOG.error(ErrorCodeMessages.ALMLOGIN_DETAILS);
				throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(),ExceptionCode.ALMLOGINDETAILSEXCEPTION.getDescription());
			}
		} catch (MalformedURLException e) {
			LOG.error(e.getMessage());
		} catch (V1Exception e) {
			LOG.error(e.getMessage());
			throw new RabitServicesException(ExceptionCode.VONEAAUTHENTICATIONFAILED.getCode(), ExceptionCode.VONEAAUTHENTICATIONFAILED.getDescription());
		} 
		return connector;
	}
	
	@Override
	public Object getProjects(String orgName) throws RabitServicesException {
		Element projectsElement = null;
		String name = null;
		try {
			String projectList = invokeGetMethod("rest-1.v1/Data/Scope?");
			if(projectList != null){
				ALMProjects almProjects = new ALMProjects();
				ArrayList<ALMProject> almProjectList = new ArrayList<>();
				ALMProject almProject = null;
				JSONObject projectsJson = new JSONObject(projectList);
				LOG.info("Total Number of Projects:"+projectsJson.get(TOTAL)+ " For Org:"+orgName);
				JSONArray projectsArray = new JSONArray(projectsJson.getString(ASSETS));
				for (int i = 0; i < projectsArray.length(); i++) {
					JSONObject project = projectsArray.getJSONObject(i);
					name = project.getJSONObject(ATTRIBUTES).getJSONObject("Name").getString(VALUE);
					almProject = new ALMProject();
					almProject.setId(project.getString("id"));
					almProject.setKey(project.getString("id"));
					almProject.setName(name);
					almProjectList.add(almProject);
				}
				if(!almProjectList.isEmpty()){
					almProjects.setProjects(almProjectList);
				}
				projectsElement = JAXBUtils.getXMLObject(almProjects, ALMProjects.class);
			}
		} catch (AuthenticationException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.VONEAAUTHENTICATIONFAILED.getCode(), ExceptionCode.VONEAAUTHENTICATIONFAILED.getDescription());
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
	public String createUsers(String orgName, Element almEle)
			throws RabitServicesException {
		return null;
	}
	@Override
	public Object createProjects(String orgName, String projectName,
			String projDesc) throws RabitServicesException {
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
	public Object getPriorities(String projectKey)
			throws RabitServicesException {
		return null;
	}
	@Override
	public Object getStatuses(String assetStatus, String workItemType)
			throws RabitServicesException {
			String storyStatus = null;
			String assetType= null;
			WorkItemStatuses statuses = null;
			WorkItemStatus status = null;
			ArrayList<WorkItemStatus> statusesList = null;
			JSONObject statusproj = null;
			try {
				if(assetStatus!=null){
					assetStatus = invokeGetMethod("rest-1.v1/Data/StoryStatus?where=AssetState='Active';SelectedInSchemes.Scopes='"+assetStatus+"'&sort=Order");
				}
				if(assetStatus != null){
					JSONObject assetStatusObj = new JSONObject(assetStatus);
					LOG.info("Total Number of Status::"+assetStatusObj.getString(TOTAL));
					JSONArray assetStatusArray = new JSONArray(assetStatusObj.getString(ASSETS));
					statuses = new WorkItemStatuses();
					statusesList = new ArrayList<>();
					for (int j = 0; j < assetStatusArray.length(); j++) {
						statusproj = assetStatusArray.getJSONObject(j);
						storyStatus  = statusproj.getJSONObject(ATTRIBUTES).getJSONObject("Name").getString(VALUE);
						assetType = statusproj.getJSONObject(ATTRIBUTES).getJSONObject(ASSETTYPE).getString(VALUE);
						status = new WorkItemStatus();
						if(!statusesMap.containsKey(storyStatus)){
							statusesMap.put(storyStatus, statusproj.getString("id"));
						}
						if(!"Epic".equalsIgnoreCase(workItemType)){
							if("StoryStatus".equalsIgnoreCase(assetType)){
								status.setId(statusproj.getString("id"));
								status.setName(storyStatus);
								statusesList.add(status);								
							}
						}else{
							if("EpicStatus".equalsIgnoreCase(assetType)){
								status.setId(statusproj.getString("id"));
								status.setName(storyStatus);
								statusesList.add(status);								
							}
						}
					}
					if(!statusesList.isEmpty()){
						 Collections.sort(statusesList, new WorkItemStatus());
						 statuses.setStatuses(statusesList);
					}
				}
			} catch (AuthenticationException ie) {
				LOG.error(ie.getMessage(), ie);
				throw new RabitServicesException(ExceptionCode.VONEAAUTHENTICATIONFAILED.getCode(), ExceptionCode.VONEAAUTHENTICATIONFAILED.getDescription());
			} catch (JSONException ie) {
				LOG.error(ie.getMessage(), ie);
				throw new RabitServicesException(ie.getMessage());
			} 
		return statuses;
	}
	@Override
	public Object getWorkItemTypes(String projectKey)
			throws RabitServicesException {
		Element rootEle = null;
		try {
			LOG.info("In  getWorkItemTypes projectId:"+projectKey);
			String assetTypes = invokeGetMethod("rest-1.v1/Data/PrimaryWorkitem?where=Scope='"+projectKey.trim()+"'");
			if(assetTypes != null){
				WorkItemTypes itemTypes = new WorkItemTypes();
				WorkItemType itemType = null;
				ArrayList<WorkItemType> itemTypeList = new ArrayList<>();
				WorkItemStatuses statuses = null;
				HashSet<String> commitstatus = new HashSet<>();
				JSONObject assetTypesObj = new JSONObject(assetTypes);
				JSONArray assetTypeArray = new JSONArray(assetTypesObj.getString(ASSETS));
				JSONObject proj = null;
				String assetType = null;
				for (int i = 0; i < assetTypeArray.length(); i++) {
					proj = assetTypeArray.getJSONObject(i);
					assetType  = proj.getJSONObject(ATTRIBUTES).getJSONObject(ASSETTYPE).getString(VALUE);
					if(!commitstatus.contains(assetType)){
						itemType = new WorkItemType();
						itemType.setId(projectKey);
						itemType.setName(assetType);
						itemType.setDisplayname(assetType);
						statuses = (WorkItemStatuses) getStatuses(projectKey, assetType);
						if(statuses != null){
							itemType.setStatuses(statuses);
						}
						itemTypeList.add(itemType);
						commitstatus.add(assetType);
					}
				}
				if(!itemTypeList.isEmpty()){
					Collections.sort(itemTypeList, new WorkItemType());
					itemTypes.setWorkitemtypes(itemTypeList);
				}
				rootEle = JAXBUtils.getXMLObject(itemTypes, WorkItemTypes.class);
			}
			return rootEle;
		} catch (AuthenticationException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.VONEAAUTHENTICATIONFAILED.getCode(), ExceptionCode.VONEAAUTHENTICATIONFAILED.getDescription());
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
	}
	@Override
	public Object getAllWorkItems(String projectKey, QueryParams queryParams)
			throws RabitServicesException {
		WorkItem workItem = null;
		WorkItems workItems = new WorkItems();
		Element rootEle = null;
		WorkItemStatuses statuses = null;
		TreeSet<WorkItem> workItemsSet = new TreeSet<>();
		List<WorkItemStatus> actionList = new ArrayList<>();
		String statuslst = null;
		String name = null;
		String ownerName = null;
		String priority = null;
		String number = null;
		String assetType = null;
		String description = null;
		JSONObject proj = null;
		JSONObject attributeObject = null;
		try {
			LOG.info("IN getAllWorkItems for Project::"+projectKey);
			if(queryParams != null && queryParams.getSprintId() != null && !"undefined".equalsIgnoreCase(queryParams.getSprintId())){
				statuslst = invokeGetMethod("rest-1.v1/Data/PrimaryWorkitem?where=Timebox='"+queryParams.getSprintId().trim()+"'");				
			}else{
				statuslst = invokeGetMethod("rest-1.v1/Hist/PrimaryWorkitem?where=Scope='"+projectKey.trim()+"'");
			}
			if(statuslst != null){
				JSONObject statusArray = new JSONObject(statuslst);
				LOG.info("Total Number of Workitems::"+statusArray.get(TOTAL));
				JSONArray substatusArray = new JSONArray(statusArray.getString(ASSETS));
				for (int i = substatusArray.length()-1; i >= 0; i--) {
					proj = substatusArray.getJSONObject(i);
					attributeObject =  proj.getJSONObject(ATTRIBUTES);
					name  = attributeObject.getJSONObject("Name").getString(VALUE);
					ownerName = attributeObject.getJSONObject("Owners.Name").getString(VALUE);
					priority = attributeObject.getJSONObject("Priority.Name").getString(VALUE);
					String status = attributeObject.getJSONObject("Status.Name").getString(VALUE);
					number = attributeObject.getJSONObject("Number").getString(VALUE);
					assetType = attributeObject.getJSONObject(ASSETTYPE).getString(VALUE);
					description = attributeObject.getJSONObject("Description").getString(VALUE);
					workItem = new WorkItem();
					workItem.setId(number);
					workItem.setKey(proj.getString("id"));
					workItem.setName(name);
					workItem.setDescription(description);
					workItem.setAssigne(ownerName);
					workItem.setPriority(priority);
					workItem.setStatus(status);
					workItem.setProjectkey(projectKey);
					workItem.setType(proj.getString("id").split(":")[0]);
					statuses = (WorkItemStatuses) getStatuses(projectKey, assetType);
					if(statuses != null){
						actionList = statuses.getStatuses();
						workItem.setActions(actionList);
					}
					workItemsSet.add(workItem);
				}
				workItems.setWorkitems((TreeSet<WorkItem>)workItemsSet.descendingSet());
				rootEle = JAXBUtils.getXMLObject(workItems, WorkItems.class);
			}
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
		} catch (AuthenticationException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.VONEAAUTHENTICATIONFAILED.getCode(), ExceptionCode.VONEAAUTHENTICATIONFAILED.getDescription());
		} catch (JSONException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(e.getMessage());
		} 
		return rootEle;
	}
	@Override
	public Object getPlannedForList(String projectKey, QueryParams queryParams)
			throws RabitServicesException {
		Element rootEle = null;
		try {
			String sprintsList = invokeGetMethod("rest-1.v1/Data/Timebox?where=Schedule.ScheduledScopes='"+projectKey+"'");
			if(sprintsList != null){
				PlannedForType plannedType = null;
				PlannedForTypes plannedTypes = new PlannedForTypes();
				JSONObject projectsJson = new JSONObject(sprintsList);
				LOG.info("Total Number of Sprints::"+projectsJson.get(TOTAL)+" for Project::");
				JSONArray projectsArray = new JSONArray(projectsJson.getString(ASSETS));
				ArrayList<PlannedForType> plannedTypeList = new ArrayList<>();
				JSONObject project = null;
				String name = null;
				String state = null;
				for (int i = 0; i < projectsArray.length(); i++) {
					project = projectsArray.getJSONObject(i);
					name  = project.getJSONObject(ATTRIBUTES).getJSONObject("Name").getString(VALUE);
					state  = project.getJSONObject(ATTRIBUTES).getJSONObject("State.Code").getString(VALUE);
					if(state != null && !state.equalsIgnoreCase("CLSD")) {
						plannedType = new PlannedForType();
						plannedType.setId(project.getString("id"));
						plannedType.setName(name);
						plannedType.setDisplayname(name);
						plannedTypeList.add(plannedType);
					}
				}
				plannedTypes.setPlannedfortypes(plannedTypeList);
				rootEle = JAXBUtils.getXMLObject(plannedTypes, PlannedForTypes.class);
			}
		} catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			LOG.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (AuthenticationException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.VONEAAUTHENTICATIONFAILED.getCode(), ExceptionCode.VONEAAUTHENTICATIONFAILED.getDescription());
		} catch (JSONException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(e.getMessage());
		} 
		return rootEle;
	}
	@Override
	public Object getRequirementsByProject(String orgName, String projectID)
			throws RabitServicesException {
		return null;
	}
	@Override
	public Object getIssuesByProject(String orgName, String projectKey)
			throws RabitServicesException {
		return null;
	}
	@Override
	public String createIssues(String orgName, String projectId,
			String issueType, String subject, String description,
			String status, String priority) throws RabitServicesException {
		return null;
	}
	@Override
	public Object getTaskManagementSummary(String orgName)
			throws RabitServicesException {
		return null;
	}
	@Override
	public String updateWorkItemStatus(String orgName,String labelName, String projectKey,
			String workItemId, String status, String comment, Logger LOG)
			throws RabitServicesException {
		if(LOG == null) {
			LOG = VersionOneConnector.LOG;
		} 	
		String resultStatus = Messages.FAILED;
		V1Connector connector =  loginwithJavSdk(orgName,labelName);
		 	IServices services = null;
		 	if(connector != null){
		 		services = new Services(connector);		 		
		 	}else{
		 		LOG.error("VersionOne Connector recieved as null.");
		 	}
			Oid assetID;
			try {
				if(workItemId != null && services != null){
					assetID = services.getOid(workItemId);
					IAssetType assetType = services.getAssetType(workItemId.split(":")[0]);
					Query query = new Query(assetID);
					IAttributeDefinition statusAttr = assetType.getAttributeDefinition("Status");
					IAttributeDefinition referenceAttr = assetType.getAttributeDefinition("Reference");
					query.getSelection().add(statusAttr);
					query.getSelection().add(referenceAttr);
					QueryResult result = services.retrieve(query);
					Asset asset = result.getAssets()[0];
					String oldStatus = asset.getAttribute(statusAttr).getValue().toString();
					LOG.info("Workitem::"+workItemId+" Old Status::"+oldStatus );	
					if(statusesMap.isEmpty()){
						getStatuses(projectKey, workItemId.split(":")[0]);
					}
					asset.setAttributeValue(statusAttr, statusesMap.get(status));
					asset.setAttributeValue(referenceAttr, comment);
					services.save(asset);
					String newStatus = asset.getAttribute(statusAttr).getValue().toString();
					String resolution = asset.getAttribute(referenceAttr).getValue().toString();
					LOG.info("Workitem::"+workItemId+" New Status::"+newStatus +" New Comment::"+resolution);
					resultStatus = Messages.SUCCESS;
				}
			} catch (OidException | ConnectionException | APIException e) {
				LOG.error(e.getMessage(), e);
				throw new RabitServicesException(ExceptionCode.VONEAAUTHENTICATIONFAILED.getCode(), ExceptionCode.VONEAAUTHENTICATIONFAILED.getDescription());
			}
			return resultStatus;
	}
	@Override
	public String testConnection(String url, String userName, String password, Logger LOG)
			throws RabitServicesException {
		if(LOG == null) {
			LOG = VersionOneConnector.LOG;
		}
		if(!"".equalsIgnoreCase(url.trim()) && !"".equalsIgnoreCase(userName.trim())&&!"".equalsIgnoreCase(password.trim())){
			LOG.info("Versionone REST Service is initialized: " + url+"/query.v1");
			fToken = new String(Base64.encode(userName+":"+password));
			Client client = Client.create();
			WebResource webResource = client.resource(url+"/query.v1");
			//Need to Handle for Accesstoken Authentication
			ClientResponse response = webResource.header("Authorization", "Basic " + fToken).type(MediaType.APPLICATION_JSON)
					.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
			int statusCode = response.getStatus();
			if(statusCode == 200){
				return Messages.SUCCESS; 
			}else{
				throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
			}
		}
		return ErrorCodeMessages.VONEAAUTHENTICATIONFAILED;
	}
	/**
	 * 
	 * @param url
	 * @return
	 * @throws AuthenticationException
	 * @throws ClientHandlerException
	 */
	private static String invokeGetMethod(String url) throws AuthenticationException, ClientHandlerException {
		Client client = Client.create();
		WebResource webResource = client.resource(versionOneBaseURL+"/"+url);
		ClientResponse response = webResource.header("Authorization", "Basic " + fToken).type(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException("Invalid Username or Password");
		}
		return response.getEntity(String.class);
	}
	@Override
	public Object getAllStatuses(String projId) throws RabitServicesException {
		return null;
	}
	@Override
	public Object getworkItem(String OrgName,String labelName,String workItemId,String projectId) throws RabitServicesException {
		WorkItem workItem = new WorkItem();
		String statuslst = null;
		String ownerName = null;
		String priority = null;
		String description = null;
		String status = null;
		try {
			String[] workitemarray = workItemId.split(":");
			statuslst = invokeGetMethod("rest-1.v1/Data/"+workitemarray[0]+"/"+workitemarray[1]);
				JSONObject statusArray = new JSONObject(statuslst);
				JSONObject substatusArray =  statusArray.getJSONObject(ATTRIBUTES);
				ownerName = substatusArray.getJSONObject("Owners.Name").getString(VALUE);
				priority = substatusArray.getJSONObject("Priority.Name").getString(VALUE);
				status = substatusArray.getJSONObject("Status.Name").getString(VALUE);
				description = substatusArray.getJSONObject("Description").getString(VALUE);
				description= description.replace("<p>", "").replace("</p>", "");
				workItem.setKey(statusArray.getString("id"));
				workItem.setId(substatusArray.getJSONObject("Number").getString(VALUE));
				workItem.setTitle(substatusArray.getJSONObject("Name").getString(VALUE));
				workItem.setAssigne(ownerName);
				workItem.setPriority(priority);
				workItem.setStatus(status);
				workItem.setDescription(description);
				workItem.setSprint(substatusArray.getJSONObject("Timebox.Name").getString(VALUE));
				workItem.setProjectid(substatusArray.getJSONObject("SecurityScope").getJSONObject(VALUE).getString("idref"));
				workItem.setProjectName(substatusArray.getJSONObject("Scope.Name").getString(VALUE));
				workItem.setType(substatusArray.getJSONObject("AssetType").getString(VALUE));
				workItem.setConnectorType(ConnectorTypes.VONE.getConnectorType().toLowerCase());
				
		} catch (Exception jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.WEBSERVICEEXCEPTION.getCode(),jaxbe.getMessage());
		}
		return workItem;
	}
	
}
