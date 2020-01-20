package com.rabit.alm.jira;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.TreeSet;

import javax.naming.AuthenticationException;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.google.gson.Gson;
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
import com.rabit.install.InstallationTypes;
import com.rabit.main.Constants;
import com.rabit.main.Messages;
import com.rabit.proxy.Proxy;
import com.rabit.proxy.ProxyRepository;
import com.rabit.service.ws.exception.RabitServicesException;
import com.rabit.util.DateUtil;
import com.rabit.util.XMLUtil;
import com.rabit.util.file.FileUtil;
import com.rabit.util.jaxb.JAXBUtils;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientHandlerException;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.client.urlconnection.HttpURLConnectionFactory;
import com.sun.jersey.client.urlconnection.URLConnectionClientHandler;
import com.sun.jersey.core.util.Base64;
/**
 * @author ramesh.m
 *
 */
public final class JiraConnector implements RMConnector {

	private static final Logger LOG = Logger.getLogger(JiraConnector.class);
	private static JiraConnector jiraConnector;
    
    private static String fToken = null;
    private static String jiraBaseURL = null;
    private static String orgname ;
    private static final String ISSUE_URL = "/rest/api/2/issue/";
    private static final String SESSION_URL = "/rest/api/2/myself";
    private static final String TRANSITIONS = "/transitions";
    private static final String AUTHORIZATION = "Authorization";
    private static final String BASIC = "Basic ";
    private static final String ISSUE = "issues";
    private static final String TRANSITIONS_STR = "transitions";
    private static final String REST_END_MSG = "Getting Workitems Rest service Ended::";
    private JiraConnector(){}
    public static JiraConnector getInstance(String orgName,String userEmail,String labelName) throws RabitServicesException{
    	orgname = orgName;
    	if(jiraConnector == null){
    		jiraConnector = new JiraConnector();
    		if(XMLUtil.getInstance().getInstallationType().equalsIgnoreCase(InstallationTypes.hosted.name())) {
    		    disableSslVerification();
    		}
    	}
    	if(Messages.TEST_MSG.equalsIgnoreCase(userEmail)){
    		return jiraConnector;
    	}
		createInstance(orgName,userEmail, labelName);
    	return jiraConnector;
    }
    private static void disableSslVerification() {
	    try
	    {
	        // Create a trust manager that does not validate certificate chains
	        TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
	            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
	                return new X509Certificate[0];
	            }
	            @Override
				public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
					
				}
				@Override
				public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
					
				}
	        }
	        };
	        // Install the all-trusting trust manager
	        SSLContext sc = SSLContext.getInstance("TLSv1.2");
	        sc.init(null, trustAllCerts, new java.security.SecureRandom());
	        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

	        // Create all-trusting host name verifier
	        HostnameVerifier allHostsValid = (requestedHost, remoteServerSession) -> {
	        	return requestedHost.equalsIgnoreCase(remoteServerSession.getPeerHost());
	        };

	        // Install the all-trusting host verifier
	        HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
	    } catch (NoSuchAlgorithmException | KeyManagementException nsae) {
	        LOG.error(nsae.getMessage(), nsae);
	    } 
	}
	public static void createInstance(String orgName,String userEmail,String labelName) throws RabitServicesException {
		ALMLoginDetails almLoginDetails = null;
			try {
				almLoginDetails = new ALMUtils(orgName,userEmail,labelName).getLoginDetails();
				if(almLoginDetails != null){
					jiraBaseURL = almLoginDetails.getUrl();
					loginToJira(almLoginDetails.getUserName(), almLoginDetails.getPassWord());
				}else{
					LOG.error(ErrorCodeMessages.ALMLOGIN_DETAILS);
					throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(),ExceptionCode.ALMLOGINDETAILSEXCEPTION.getDescription());
				}
			} 
			catch (ClientHandlerException | AuthenticationException | JSONException e) {
				LOG.error(e.getMessage(), e);
				throw new RabitServicesException(ExceptionCode.JIRAAUTHENTICATIONFAILED.getCode(), e.getMessage());
			}
	}
	@Override
	public Object getProjects(String orgName) throws RabitServicesException {
		Element projectsElement = null;
		ALMProject project = null;
		try {
			ALMProjects almProjects = new ALMProjects();
			ArrayList<ALMProject> projectList = new ArrayList<>();
			String projects = invokeGetMethod("/rest/api/2/project");
			JSONArray projectArray = new JSONArray(projects);
			for (int i = 0; i < projectArray.length(); i++) {
				JSONObject proj = projectArray.getJSONObject(i);
				project = new ALMProject();
				project.setId(proj.getString("id"));
				project.setKey(proj.getString("key"));
				project.setName(proj.getString("name"));
				projectList.add(project);
			}
			almProjects.setProjects(projectList);
			projectsElement = JAXBUtils.getXMLObject(almProjects, ALMProjects.class);
		}  catch (AuthenticationException | JSONException | JAXBException | ParserConfigurationException | SAXException | IOException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.JIRAAUTHENTICATIONFAILED.getCode(), ie.getMessage());
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
		Element rootEle = null;
		WorkItemPriorities priorities = new WorkItemPriorities();
		ArrayList<WorkItemPriority> prioritiesList = new ArrayList<>();
		WorkItemPriority priority = null;
		try{
			String allpriorities = invokeGetMethod("/rest/api/2/priority");
			JSONArray priorityArray = new JSONArray(allpriorities);
			for (int i = 0; i < priorityArray.length(); i++) {
				priority = new WorkItemPriority();
				JSONObject proj = priorityArray.getJSONObject(i);
				priority.setId(proj.getString("id"));
				priority.setName(proj.getString("name"));
				prioritiesList.add(priority);
			}	
			priorities.setPriorities(prioritiesList);
			rootEle = JAXBUtils.getXMLObject(priorities, WorkItemPriorities.class);
		}
		catch (AuthenticationException | JSONException | JAXBException | ParserConfigurationException | SAXException | IOException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.JIRAAUTHENTICATIONFAILED.getCode(), ae.getMessage());
		} 
		return rootEle;
	}
	@Override
	public Object getStatuses(String projectKey, String workItemType)
			throws RabitServicesException {
		return null;
	}
	@Override
	public Object getWorkItemTypes(String projectKey)
			throws RabitServicesException {
		Element rootEle = null;
		try {
			LOG.info("projectId:"+projectKey);
			WorkItemTypes itemTypes = new WorkItemTypes();
			WorkItemType itemType = null;
			ArrayList<WorkItemType> itemTypeList = new ArrayList<>();
			WorkItemStatuses statuses = null;
			WorkItemStatus status = null;
			ArrayList<WorkItemStatus> statusesList = null;
			String statuslst = invokeGetMethod("/rest/api/2/project/"+projectKey.trim()+"/statuses");
			if(statuslst.contains("errorMessages") ){
				return rootEle;
			}
			JSONArray statusArray = new JSONArray(statuslst);
			for (int i = 0; i < statusArray.length(); i++) {
				itemType = new WorkItemType();
				JSONObject proj = statusArray.getJSONObject(i);
				itemType.setId(proj.getString("id"));
				itemType.setName(proj.getString("name"));
				itemType.setDisplayname(proj.getString("name"));
				JSONArray substatusArray = new JSONArray(proj.getString("statuses"));
				statuses = new WorkItemStatuses();
				statusesList = new ArrayList<>();
				for (int j = 0; j < substatusArray.length(); j++) {
					JSONObject projsub = substatusArray.getJSONObject(j);
					status = new WorkItemStatus();
					status.setId(projsub.getString("id"));
					status.setName(projsub.getString("name"));
					statusesList.add(status);
				}
				if(!statusesList.isEmpty()){
					 Collections.sort(statusesList, new WorkItemStatus());
				}
				statuses.setStatuses(statusesList);
				itemType.setStatuses(statuses);
				itemTypeList.add(itemType);
			}
			if(!itemTypeList.isEmpty()){
				Collections.sort(itemTypeList, new WorkItemType());
			}
			itemTypes.setWorkitemtypes(itemTypeList);
			rootEle = JAXBUtils.getXMLObject(itemTypes, WorkItemTypes.class);
			return rootEle;
		
		}  catch (JAXBException | ParserConfigurationException | SAXException | IOException | JSONException | AuthenticationException | ClientHandlerException ae) {
			LOG.error(ae.getMessage(), ae);
			throw new RabitServicesException(ExceptionCode.JIRAAUTHENTICATIONFAILED.getCode(), ae.getMessage());
		} 
	}
	@Override
	public Object getAllWorkItems(String projectKey, QueryParams queryParams)
			throws RabitServicesException {
		WorkItems workItems = new WorkItems();
		TreeSet<WorkItem> workItemsSet = null;
		Element rootEle = null;
		try {
			if((projectKey != null && !"".equalsIgnoreCase(projectKey)) || (queryParams.getSprintId() != null && !"undefined".equalsIgnoreCase(queryParams.getSprintId()))){
				String sprintissues = null;
				JSONObject jsonObject = null;
				JSONArray jsonArray = null;
				LOG.info("Getting Workitems Rest service Started::"+DateUtil.getDateTime());
				if(queryParams.getSprintId() != null && !"undefined".equalsIgnoreCase(queryParams.getSprintId())){
					List<JSONArray> jsonArrayList = retrieveWorkItemsWithType(projectKey, queryParams.getSprintId(), "Sprint");
					if(jsonArrayList != null && !jsonArrayList.isEmpty()) {
						workItemsSet = getWorkItemListWithJSONArrayList(jsonArrayList);
					} else {
						LOG.info("JSON arraylist is either null or size is zero");
					}
				}else{
					sprintissues = invokeGetMethod("/rest/api/2/search?jql=project%20%3D%20"+projectKey+"&maxResults=5000");
					LOG.info(REST_END_MSG+DateUtil.getDateTime());
					isValidJson(sprintissues);
					jsonObject = new JSONObject(sprintissues);
					if(jsonObject.has(ISSUE)){
						jsonArray = new JSONArray(jsonObject.getString(ISSUE));
						workItemsSet = getWorkItemList(jsonArray);
					}
				}
				if(workItemsSet != null){
					workItems.setWorkitems((TreeSet<WorkItem>)workItemsSet.descendingSet());
				}
				rootEle = JAXBUtils.getXMLObject(workItems, WorkItems.class);
				LOG.info("processing Time completed at::"+DateUtil.getDateTime());
			} else{
				return  Messages.ALM_SPRINTID_VALIDATION_MSG;
			}
			
		}  catch (ParserConfigurationException | JAXBException | SAXException | IOException | AuthenticationException | ClientHandlerException | JSONException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), pce.getMessage());
		} 
		return rootEle;
	}
	public boolean isValidJson(String data) {
		try {
			new JSONObject(data);
			return true;
		} catch (Exception e) {
			LOG.info("transistions Object from API:"+data);
			LOG.error("JSONException :::This is not a Valid Json: "+ e.getMessage());
			return false;
		}
	}
	@Override
	public Object getPlannedForList(String projectKey, QueryParams queryParams)
			throws RabitServicesException {
		PlannedForTypes plannedTypes = new PlannedForTypes();
		PlannedForType plannedType = null;
		Element rootEle = null;
		boolean includeClosedSprints = false;
		try {
			String sprints = invokeGetMethod("/rest/greenhopper/1.0/integration/teamcalendars/sprint/list?jql=project="+projectKey.trim()+"");
			JSONObject sprintsObject = new JSONObject(sprints);
			JSONArray sprintsArray = new JSONArray(sprintsObject.getString("sprints"));
			if(sprintsArray.length() == 0){
				sprints = invokeGetMethod("/rest/api/2/project/"+projectKey+"/versions");
				sprintsArray = new JSONArray(sprints);
			}
			Properties properties = FileUtil.loadPropertyFile(Constants.ALM_PROP_FILE);
			if(properties != null && properties.getProperty("includeclosedsprintsorgs") != null && properties.getProperty("includeclosedsprintsorgs").contains(orgname)) {
				includeClosedSprints = true;
			}
			ArrayList<PlannedForType> plannedTypeList = new ArrayList<>();
			for (int i = 0; i < sprintsArray.length(); i++) {	
				JSONObject proj = sprintsArray.getJSONObject(i);
				if(includeClosedSprints ||((proj.has("closed") && !"true".equalsIgnoreCase(proj.getString("closed"))) ||
						(proj.has("released") && !"true".equalsIgnoreCase(proj.getString("released"))))){
					plannedType = new PlannedForType();
					plannedType.setId(proj.getString("id"));
					plannedType.setName(proj.getString("name"));
					plannedType.setDisplayname(proj.getString("name"));
					plannedTypeList.add(plannedType);
				}
			}
			plannedTypes.setPlannedfortypes(plannedTypeList);
        	rootEle = JAXBUtils.getXMLObject(plannedTypes, PlannedForTypes.class);
		}catch (JAXBException | AuthenticationException | ClientHandlerException | JSONException | ParserConfigurationException | SAXException | IOException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), jaxbe.getMessage());
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
	public String createIssues(String orgName, String projectId, String issueType, String subject, String description, String status, String priority) throws RabitServicesException {
		String output = null;
		subject = subject != null ? subject.replace("\"", "\\\"") : "";
		String createissueDate = "{\"fields\":{\"project\":{\"key\":\""+projectId+"\"},\"summary\":\""+subject+"\",\"issuetype\":{\"id\":\""+issueType+"\"}}}";
		try {
			output = invokesessionPostMethod(fToken,"/rest/api/2/issue", createissueDate);
		} catch (AuthenticationException | ClientHandlerException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException("Exception is "+e.getMessage());
		}
		return output;
	}
	@Override
	public Object getTaskManagementSummary(String orgName)
			throws RabitServicesException {
		return null;
	}
	@Override
	public String updateWorkItemStatus(String orgName, String labelName,String projectKey,
			String workItemId, String status, String comment, Logger LOG) {
		String result = Messages.FAILED;
		if(LOG == null) {
			LOG = JiraConnector.LOG;
		}
		String updateResponse =null;
		LOG.info("workItemId:"+workItemId + " status: "+status);
		String commonURL = ISSUE_URL+workItemId.trim();
		String transitions = null;
		try {
			transitions = invokeGetMethod(commonURL+TRANSITIONS);
			JSONObject transitionsobj = new JSONObject(transitions);
			JSONArray transitionsArray = new JSONArray(transitionsobj.getString(TRANSITIONS_STR));
			for (int i = 0; i < transitionsArray.length(); i++) {
				JSONObject proj = transitionsArray.getJSONObject(i);
				JSONObject to = new JSONObject(proj.getString("to"));
				if(status.equalsIgnoreCase(to.getString("name"))){
					String updateIssueData = "{\"transition\":{\"id\":"+proj.getString("id")+"}}";
					updateResponse = invokePostMethod(commonURL+TRANSITIONS, updateIssueData);
					LOG.info("updateStatusResponse::"+updateResponse);
					break;
				}
			}
			
			//UpdateComment
			if(comment != null && !"".equalsIgnoreCase(comment.trim())){
				comment = comment.replace("\"", "\\\"");
				String addcomment = "{\"body\":\""+comment+"\"}";
				updateResponse = invokePostMethod(commonURL+"/comment",addcomment);
				LOG.info("updateCommentResponse::"+updateResponse);

			}
			result = Messages.SUCCESS;
		} catch (AuthenticationException | ClientHandlerException | JSONException ie) {
			LOG.error(ie.getMessage(), ie);
			if(ie.getMessage() != null && !ie.getMessage().isEmpty()){
				return "Failed due to : " + "<font color='red'>" + ie.getMessage() + "</font>";
			}
		}
		return result;
	}
	public static String loginToJira(String userName,String password) throws  RabitServicesException, AuthenticationException, ClientHandlerException, JSONException{
		if(!"".equalsIgnoreCase(jiraBaseURL.trim()) && !"".equalsIgnoreCase(userName.trim())&&!"".equalsIgnoreCase(password.trim())){
			LOG.info("Jira REST Service is initialized: " + jiraBaseURL+SESSION_URL);
			fToken = new String(Base64.encode(userName+":"+password));
			invokeGetMethod(SESSION_URL);
		}else{
			LOG.error("Please verify the credentials. not able to connect to JIRA");
		}
		return "";
	}
	public static void logoutFromJira() throws RabitServicesException{
		try {
			String logoutString = invokeDeleteMethod(SESSION_URL);
			LOG.info("logoutFromJira::"+ logoutString);
		} catch (ClientHandlerException e) {
			LOG.error(e.getMessage(), e);
		} catch (AuthenticationException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.JIRAAUTHENTICATIONFAILED.getCode(), ExceptionCode.JIRAAUTHENTICATIONFAILED.getDescription());
		} 
	}
	private static String invokePostMethod(String url, String data) throws AuthenticationException, ClientHandlerException {
		Client client = getClient();
		WebResource webResource = client.resource(jiraBaseURL+url);
		ClientResponse response = webResource.header(AUTHORIZATION, BASIC + fToken).type(MediaType.APPLICATION_JSON)
					.accept(MediaType.APPLICATION_JSON).post(ClientResponse.class,data);
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException("Invalid Username or Password");
		}
		else if(statusCode == 403){
			return Messages.JIRA_AUHENTICATION_VALIDUSER;
		}
		else if(statusCode == 204){
			return "Issue Updated Successfully";
		}
		else if(statusCode == 201){
			return "Comment updated Successfully.";
		}
		else if(statusCode == 400){
			throw new AuthenticationException("Comment Input is invalid (e.g. missing required fields, invalid values etc)");
		}
		return response.getEntity(String.class);
	}
	
	private static String invokeGetMethod(String url) throws AuthenticationException, ClientHandlerException {
		Client client = getClient();
		LOG.info("JIRA RestService Initiated URL:"+jiraBaseURL+url);
		WebResource webResource = client.resource(jiraBaseURL+url);
		ClientResponse response = webResource.header(AUTHORIZATION, BASIC + fToken).type(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException("Invalid Username or Password");
		}
		return response.getEntity(String.class);
	}
	private static String invokesessionPostMethod(String auth, String url, String data) throws AuthenticationException, ClientHandlerException, RabitServicesException {
		Client client = getClient();
		LOG.info("JIRA RestService Initiated URL:"+jiraBaseURL+url);
		WebResource webResource = client.resource(jiraBaseURL+url);
		ClientResponse response = webResource.header(AUTHORIZATION, BASIC + auth).type(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON).post(ClientResponse.class, data);
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException("Invalid Username or Password");
		}
		else if(statusCode == 403){
			throw new RabitServicesException(Messages.JIRA_AUHENTICATION_VALIDUSER);
		}
		return response.getEntity(String.class);
	}
	
	private static String invokeDeleteMethod(String url) throws AuthenticationException, ClientHandlerException {
		Client client = getClient();
		WebResource webResource = client.resource(jiraBaseURL+url);
		ClientResponse response = webResource.header(AUTHORIZATION, BASIC + fToken).type(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON).delete(ClientResponse.class);
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException("Invalid Username or Password");
		}
		if(statusCode == 204){
			return "User successfully logged out from the current session.";
		}
		return null;
	}
	@Override
	public String testConnection(String url,String userName,String password, Logger LOG) throws RabitServicesException {
		if(jiraConnector == null){
    		jiraConnector = new JiraConnector();
    	}
		if(LOG == null) {
			LOG = JiraConnector.LOG;
		}
		try {	
		  if(!"".equalsIgnoreCase(url.trim()) && !"".equalsIgnoreCase(userName.trim())&&!"".equalsIgnoreCase(password.trim())){
			  LOG.info("Jira REST Service is initialized: " + url+SESSION_URL);
			  fToken = new String(Base64.encode(userName+":"+password));
			  jiraBaseURL = url;
			  try {
				  String userData = invokeGetMethod(SESSION_URL);
				  if(isValidJson(userData)){
					  return Messages.SUCCESS;
				  }
				} catch (AuthenticationException e) {
					LOG.error(e.getMessage());
					throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
				}
			}
		  } 
		catch (ClientHandlerException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
		}
		return ExceptionCode.ALMAUTHFAIL.getDescription();
	}
	@Override
	public Object getAllStatuses(String wiKey) throws RabitServicesException {
		ArrayList<WorkItemStatus> actionslst= null;
		WorkItemStatus workItemStatus = null;
		WorkItemStatuses workItemStatuses = new WorkItemStatuses();
		Element rootEle = null;
		try {
			String commonURL = ISSUE_URL+wiKey.trim();
			String transitions = invokeGetMethod(commonURL+TRANSITIONS);
			JSONObject transitionsobj = new JSONObject(transitions);
			JSONArray transitionsArray = new JSONArray(transitionsobj.getString(TRANSITIONS_STR));
			actionslst = new ArrayList<>();
			for (int k = 0; k < transitionsArray.length(); k++) {
				workItemStatus = new WorkItemStatus();
				JSONObject transobj = transitionsArray.getJSONObject(k);
				JSONObject to = new JSONObject(transobj.getString("to"));
				workItemStatus.setId(to.getString("id"));
				workItemStatus.setName(to.getString("name"));
				actionslst.add(workItemStatus);
			}
			if(!actionslst.isEmpty()){
				Collections.sort(actionslst, new WorkItemStatus());
				workItemStatuses.setStatuses(actionslst);
			}
			rootEle = JAXBUtils.getXMLObject(workItemStatuses, WorkItemStatuses.class);
		}catch (JAXBException | AuthenticationException | ClientHandlerException | JSONException | ParserConfigurationException | SAXException | IOException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}
		return rootEle;
	}
	/**
	 * @author sampath.c
	 * @param projectKey
	 * @param sprintId
	 * @param workItemType
	 * @return
	 * @throws AuthenticationException
	 * @throws ClientHandlerException
	 */
	private List<JSONArray> retrieveWorkItemsWithType(String projectKey, String sprintId, String workItemType) throws AuthenticationException, ClientHandlerException {
		List<JSONArray> jsonArrayList = null;
		try {
			JSONObject jsonObject = null;
			JSONArray jsonArray = null;
			boolean isDone = false;
			int startIndex = 0;
			int maxResults = 100;
			String relativeUrl = "/rest/api/2/search";
			ClientResponse response = null;
			int statusCode;
			String jsonResString = null;
			boolean invokeFixVesionsBatchModel = false;
			int totalAvailRecords = 0;
			String postJSONString = null;
			JiraSearchBean jiraSearchBean = new JiraSearchBean();
			jiraSearchBean.setJql("project = " + projectKey + " AND " + workItemType + " = " + sprintId);
			while (!isDone) {
				jiraSearchBean.setStartAt(String.valueOf(startIndex));
				jiraSearchBean.setMaxResults(String.valueOf(maxResults));
				postJSONString = new Gson().toJson(jiraSearchBean);
				response = getClientResWithnvokePostMethod(relativeUrl, postJSONString);
				if(response != null) {
					statusCode = response.getStatus();
					if (statusCode == 401) {
						throw new AuthenticationException("Invalid Username or Password");
					}
					
					jsonResString = response.getEntity(String.class);
					isValidJson(jsonResString);
					jsonObject = new JSONObject(jsonResString);
					if(jsonObject.has(ISSUE)){
						if(jsonArrayList == null) {
							jsonArrayList = new ArrayList<>();
						}
						jsonArray = new JSONArray(jsonObject.getString(ISSUE));
						jsonArrayList.add(jsonArray);
//						logic for exchanging values
						if(jsonObject.has("total")) {
							totalAvailRecords = Integer.valueOf(jsonObject.get("total").toString());
							LOG.info("Total Number of Workitems::"+totalAvailRecords+" Sprint:"+sprintId +" maxResults::"+maxResults);
						}
						if(totalAvailRecords > maxResults) {
							startIndex = maxResults;
							maxResults += 100;
						} else {
							LOG.info(REST_END_MSG+DateUtil.getDateTime());
							isDone = true;
						}
					} else if(jsonObject.has("errorMessages") ){
						invokeFixVesionsBatchModel = true;
						isDone = true;
					} else {
						LOG.error("Did not found error messages and issues in JSON Object for Sprint work items");
						LOG.info(REST_END_MSG+DateUtil.getDateTime());
						isDone = true;
					}
				} else {
					LOG.error("Response is null");
					isDone = true;
				}
			}
			if(invokeFixVesionsBatchModel && !workItemType.equalsIgnoreCase("fixVersion")) {
				jsonArrayList =  retrieveWorkItemsWithType(projectKey, sprintId, "fixVersion");
			}
		} catch (JSONException e) {
			LOG.error(e.getMessage(), e);
		}
		return jsonArrayList;
	}
	/**
	 * @author sampath.c
	 * @param jsonArrayList
	 * @return
	 */
	public TreeSet<WorkItem> getWorkItemListWithJSONArrayList(List<JSONArray> jsonArrayList) {
		TreeSet<WorkItem> workItemList = new TreeSet<>();
		if(!jsonArrayList.isEmpty()) {
			TreeSet<WorkItem> specificList = null;
			for(JSONArray jsonArray: jsonArrayList) {
				specificList = getWorkItemList(jsonArray);
				if(!specificList.isEmpty()) {
					workItemList.addAll(specificList);
				}
			}
		} else {
			LOG.info("JSON arraylist is either null or size is zero");
		}
		return workItemList;
	}
	/**
	 * @author sampath.c
	 * @param jsonArray
	 * @return
	 */
	public TreeSet<WorkItem> getWorkItemList(JSONArray jsonArray) {
		TreeSet<WorkItem> workItemsList = new TreeSet<>();
		WorkItem workItem = null;
		if(jsonArray != null && jsonArray.length() >0){
			for (int i = 0; i < jsonArray.length(); i++) {
				try {
					if(isValidJson(jsonArray.getString(i))){
						JSONObject proj = jsonArray.getJSONObject(i);
						workItem = new WorkItem();
						
						if(proj.has("key")) {
							workItem.setId(proj.getString("key"));
						}
						if(proj.has("id")) {
							workItem.setKey(proj.getString("id"));
						}
						if(proj.has("fields")) {
							JSONObject fieldsObj = new JSONObject(proj.getString("fields"));
							workItem.setName(fieldsObj.has("summary")?fieldsObj.getString("summary"):"");
							workItem.setDescription(fieldsObj.has("description")?fieldsObj.getString("description"):"");
							
							if(fieldsObj.has("issuetype")) {
								JSONObject issueObj = new JSONObject(fieldsObj.getString("issuetype"));
								workItem.setType(issueObj.has("name")?issueObj.getString("name"):"");
							}
							if(fieldsObj.has("reporter")) {
								JSONObject reporterObj = new JSONObject(fieldsObj.getString("reporter"));
								workItem.setReporter(reporterObj.has("name")?reporterObj.getString("name"):"");
							}
							if(fieldsObj.has("priority")) {
								JSONObject priorityObj = new JSONObject(fieldsObj.getString("priority"));
								workItem.setPriority(priorityObj.has("name")?priorityObj.getString("name"):"");
							}
							if(fieldsObj.has("status")) {
								JSONObject statusObj = new JSONObject(fieldsObj.getString("status"));
								workItem.setStatus(statusObj.has("name")?statusObj.getString("name"):"");
								workItem.setStatusid(statusObj.has("id")?statusObj.getString("id"):"");
							}
							
							if(!"null".equalsIgnoreCase(fieldsObj.getString("assignee"))){
								JSONObject assigneeObj = new JSONObject(fieldsObj.getString("assignee"));
								workItem.setAssigne(assigneeObj.has("name")?assigneeObj.getString("name"):"");	
							}
							if(fieldsObj.has("project")) {
								JSONObject projectObj = new JSONObject(fieldsObj.getString("project"));
								workItem.setProjectkey(projectObj.has("key")?projectObj.getString("key"):"");
							}
						}
						workItemsList.add(workItem);
					}
				}catch (JSONException e) {
					LOG.error(e.getMessage(), e);
				}
			}
		}
		return workItemsList;
	}
	/**
	 * @author sampath.c
	 * @param url
	 * @param data
	 * @return
	 * @throws AuthenticationException
	 * @throws ClientHandlerException
	 */
	private static ClientResponse getClientResWithnvokePostMethod(String url, String data) throws AuthenticationException, ClientHandlerException {
		Client client = getClient();
		WebResource webResource = client.resource(jiraBaseURL+url);
		return webResource.header(AUTHORIZATION, BASIC + fToken).type("application/json")
					.accept("application/json").post(ClientResponse.class,data);
	}
	
	private static Client getClient() {
		Client client = Client.create();
		String proxyHost = null;
		String proxyPort = null;
		Proxy proxy = new ProxyRepository().getProxyByurl(orgname, jiraBaseURL);
		if (proxy != null) {
			LOG.info("Setting proxy from alm Prop File for : " + orgname);
			proxyHost = proxy.getHost();
			proxyPort = proxy.getPort();
		}
		if(proxyHost != null && proxyPort != null && !"".equals(proxyHost.trim()) && !"".equals(proxyPort.trim())) {
			String proxyHostfinal = proxyHost.trim();
			String proxyPortfinal = proxyPort.trim();
			client = new Client(new URLConnectionClientHandler(new HttpURLConnectionFactory() {
				java.net.Proxy proxy;
				private void initializeProxy() {
					proxy = new java.net.Proxy(java.net.Proxy.Type.HTTP, new InetSocketAddress(proxyHostfinal, Integer.parseInt(proxyPortfinal)));
				}
				@Override
				public HttpURLConnection getHttpURLConnection(URL proxyUrl) throws IOException {
					initializeProxy();
					return (HttpURLConnection) proxyUrl.openConnection(proxy);
				}
			}));
		}
		return client;
	}
	
	@Override
	public Object getworkItem(String orgName,String labelName,String workItemName,String projectId) throws RabitServicesException {
		WorkItem item = new WorkItem();
		try {
			String commonURL = ISSUE_URL+workItemName.trim();
			String workItemResp = invokeGetMethod(commonURL);
			String fieldResp = invokeGetMethod("/rest/api/2/field");
			JSONObject workItemObj = new JSONObject(workItemResp);
			JSONArray fieldRespObj = new JSONArray(fieldResp);
			String customFieldId=null;
			for(int i=0;i<fieldRespObj.length();i++) {
				JSONObject object = fieldRespObj.getJSONObject(i);
				if(object.has("name") && "Sprint".equalsIgnoreCase(object.getString("name"))) {
					if(object.has("id")) {
						customFieldId = object.getString("id");
						break;
					}
				}
			}
			item.setId(workItemObj.has("key")?workItemObj.getString("key"):"");
            item.setKey(workItemObj.has("id")?workItemObj.getString("id"):"");
			if(workItemObj.has("fields")) {
				workItemObj = workItemObj.getJSONObject("fields");
				item.setTitle(workItemObj.has("summary")?workItemObj.getString("summary"):"");
				if(workItemObj.has("assignee") && !"null".equalsIgnoreCase(workItemObj.getString("assignee"))) {
					JSONObject assigneeObj = new JSONObject(workItemObj.getString("assignee"));
					item.setAssigne(assigneeObj.has("name")?assigneeObj.getString("name"):"");
				}
				if(workItemObj.has("description") && !"null".equalsIgnoreCase(workItemObj.getString("description"))) {
					item.setDescription(workItemObj.getString("description"));
				}
				if(workItemObj.has("priority")) {
					JSONObject priorityObj = new JSONObject(workItemObj.getString("priority"));
					item.setPriority(priorityObj.has("name")?priorityObj.getString("name"):"");
				}
				if(workItemObj.has("status")) {
					JSONObject statusObj = new JSONObject(workItemObj.getString("status"));
					item.setStatus(statusObj.has("name")?statusObj.getString("name"):"");
				}
				if(workItemObj.has("project")) {
					JSONObject projectObj = new JSONObject(workItemObj.getString("project"));
					if(projectObj.has("id")){
						item.setProjectkey(projectObj.getString("id"));
					}
					if(projectObj.has("name")){
						item.setProjectName(projectObj.getString("name"));
					}
				}
				if(workItemObj.has("issuetype")) {
					JSONObject issuetypeObj = new JSONObject(workItemObj.getString("issuetype"));
					if(issuetypeObj.has("name")){
						item.setType(issuetypeObj.getString("name"));
					}
				}
				if(customFieldId!=null) {
					if(workItemObj.has(customFieldId)) {
						String[] customFieldObjarr = workItemObj.getString(customFieldId).split(",");
						for (String string : customFieldObjarr) {
							if(string.contains("name=")) {
								item.setSprint(string.substring(string.indexOf("=")+1));	
								break;
							}
						}
						
					}
				}
				item.setConnectorType(ConnectorTypes.JIRA.getConnectorType().toLowerCase());
			}
		}catch (Exception jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.WEBSERVICEEXCEPTION.getCode(),jaxbe.getMessage());
		}
		return item;
	}

	public static void main(String[] args) throws JSONException {
		/*orgname = "autorabit.com-W6d1rU";
		jiraBaseURL = "https://autorabit.atlassian.net";
		try {
			loginToJira("mahesh.k@autorabit.com","JspFlTTf1XHDj3cwxO6kF6A8");
		} catch (AuthenticationException | ClientHandlerException | RabitServicesException | JSONException e) {
			LOG.info(e.getMessage());
		}
		try {
			String output = invokeGetMethod("/rest/api/2/issue/DXTES-29");
			System.out.println(output);
		} catch (AuthenticationException | ClientHandlerException e) {
			LOG.info(e.getMessage());
		}*/
	}
}
