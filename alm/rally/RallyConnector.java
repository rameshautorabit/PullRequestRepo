package com.rabit.alm.rally;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.TreeSet;

import javax.naming.AuthenticationException;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
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
import com.rabit.main.Constants;
import com.rabit.main.Messages;
import com.rabit.service.ws.exception.RabitServicesException;
import com.rabit.util.file.FileUtil;
import com.rabit.util.jaxb.JAXBUtils;
import com.rallydev.rest.RallyRestApi;
import com.rallydev.rest.request.QueryRequest;
import com.rallydev.rest.request.UpdateRequest;
import com.rallydev.rest.response.QueryResponse;
import com.rallydev.rest.response.UpdateResponse;
import com.rallydev.rest.util.Fetch;
import com.rallydev.rest.util.QueryFilter;
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

public class RallyConnector implements RMConnector {
    private static final Logger LOG = Logger.getLogger(RallyConnector.class);
    private static RallyRestApi restApi = null;
    private static final String[] assetTypes = new String[] { "HierarchicalRequirement", "Defect", "DefectSuite" };
    private static final String[] SchduledStates = new String[] { "Defined", "In-Progress", "Completed", "Accepted" };
    private static RallyConnector rallyConnector = null;
    private static String rallyBaseURL = null;
    private static String fToken = null;
    private static String orgname ;
    private static final String DESCRIPTION = "Description";
    private static final String DISPLAYNAME = "DisplayName";
    private static final String FLOWSTATE = "FlowState";
    private static final String FORMATTED_ID = "FormattedID";
    private static final String LASTLOGINDATE = "LastLoginDate";
    private static final String NOTES = "Notes";
    private static final String OBJECTID = "ObjectID";
    private static final String OWNER = "Owner";
    private static final String PRIORITY = "Priority";
    private static final String SECHEDULESTATE = "ScheduleState";
    private static final String STATE = "State";
    private static final String REFOBJECTNAME = "_refObjectName";
    private static final String TYPE = "_type";
    private static final String PROJECT = "project/";
    private static final String RALLY_TEAMBOARD_ORGS ="rallyteamboardorgs";
    private static final String RALLY_APITOKEN_AUTH_ORGS ="rallyapitokenorgs";
    private static final String NAME ="Name";
    private static final String ITERATION ="Iteration";
    

    private RallyConnector() {
    }

    public static RallyConnector getInstance(String orgName, String userEmail,String labelName) throws RabitServicesException {
    	orgname = orgName;
        if (rallyConnector == null) {
            rallyConnector = new RallyConnector();
        }
        if (Messages.TEST_MSG.equalsIgnoreCase(userEmail)) {
            return rallyConnector;
        }
        createInstance(orgName, userEmail,labelName);
        return rallyConnector;
    }

    public static void createInstance(String orgName, String userEmail,String labelName) throws RabitServicesException {
        ALMLoginDetails almLoginDetails = null;
        try {
            almLoginDetails = new ALMUtils(orgName, userEmail, labelName).getLoginDetails();
            if (almLoginDetails != null) {
                rallyBaseURL = almLoginDetails.getUrl();
                rallyConnector.testConnection(rallyBaseURL, almLoginDetails.getUserName(), almLoginDetails.getPassWord(), LOG);
                fToken = new String(Base64.encode(almLoginDetails.getUserName()+":"+almLoginDetails.getPassWord()));
            } else {
                LOG.error(ErrorCodeMessages.ALMLOGIN_DETAILS);
                throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(), ExceptionCode.ALMLOGINDETAILSEXCEPTION.getDescription());
            }
        } catch (ClientHandlerException e) {
            LOG.error(e.getMessage(), e);
            throw new RabitServicesException(ExceptionCode.RALLYAAUTHENTICATIONFAILED.getCode(), ExceptionCode.RALLYAAUTHENTICATIONFAILED.getDescription());
        }
    }

    @Override
    public Object getProjects(String orgName) throws RabitServicesException {
        Element projectsElement = null;
        String name = null;
        try {
            QueryRequest projectRequest = new QueryRequest("/Project");
            projectRequest.setFetch(new Fetch("Name", OBJECTID, STATE));
            projectRequest.setQueryFilter(new QueryFilter(STATE, "=", "Open"));
            ALMProjects almProjects = new ALMProjects();
            ArrayList<ALMProject> almProjectList = new ArrayList<>();
            ALMProject almProject = null;
            QueryResponse projectQueryResponse = restApi.query(projectRequest);
            LOG.info("Total Number of Projects ::" + projectQueryResponse.getTotalResultCount());
            int numberofProjects = projectQueryResponse.getTotalResultCount();
            if (numberofProjects > 0) {
                for (int i = 0; i < numberofProjects; i++) {
                    JsonObject projectJsonObj = projectQueryResponse.getResults().get(i).getAsJsonObject();
                    name = projectJsonObj.get("Name").getAsString();
                    almProject = new ALMProject();
                    almProject.setId(projectJsonObj.get(OBJECTID).getAsString());
                    almProject.setKey(projectJsonObj.get(OBJECTID).getAsString());
                    almProject.setName(name);
                    almProjectList.add(almProject);
                }
                almProjects.setProjects(almProjectList);
                projectsElement = JAXBUtils.getXMLObject(almProjects, ALMProjects.class);
            }
        } catch (ParserConfigurationException | IOException | JAXBException | SAXException pce) {
            LOG.error(pce.getMessage(), pce);
            throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), pce.getMessage());
        }  finally {
            // Release resources
            IOUtils.closeQuietly(restApi);
        }
        return projectsElement;
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
    public Object getStatuses(String projectKey, String projectName) throws RabitServicesException {
    	boolean rallyTeamboardOrgs = false;
    	Properties properties = FileUtil.loadPropertyFile(Constants.ALM_PROP_FILE);
		if(properties != null && properties.getProperty(RALLY_TEAMBOARD_ORGS) != null) {
			rallyTeamboardOrgs = properties.getProperty(RALLY_TEAMBOARD_ORGS).contains(orgname)? true:false;
		}
		WorkItemStatuses statuses = new WorkItemStatuses();
		ArrayList<WorkItemStatus> statusesList = new ArrayList<>();
		WorkItemStatus status = null;
		if(rallyTeamboardOrgs) {
			statuses = (WorkItemStatuses) getTeamBoardStatuesofProject(projectKey,projectName,false);
		}else {
			for (String scheduledsatus : SchduledStates) {
				status = new WorkItemStatus();
				status.setId(scheduledsatus);
				status.setName(scheduledsatus);
				statusesList.add(status);
			}
			if(!statusesList.isEmpty()){
				Collections.sort(statusesList, new WorkItemStatus());
			}
			statuses.setStatuses(statusesList);
		}
        return statuses;
    }

    @Override
    public Object getWorkItemTypes(String projectKey) throws RabitServicesException {
        Element rootEle = null;
        try {
            WorkItemTypes itemTypes = new WorkItemTypes();
            WorkItemType itemType = null;
            WorkItemStatuses statuses = null;
            ArrayList<WorkItemType> itemTypeList = new ArrayList<>();
            for (String assetType : assetTypes) {
                itemType = new WorkItemType();
                itemType.setId(projectKey);
                itemType.setName(assetType);
                itemType.setDisplayname(assetType);
                statuses = (WorkItemStatuses) getStatuses(projectKey, assetType);
                if (statuses != null) {
                    itemType.setStatuses(statuses);
                }
                itemTypeList.add(itemType);
            }
            if (!itemTypeList.isEmpty()) {
                Collections.sort(itemTypeList, new WorkItemType());
            }
            itemTypes.setWorkitemtypes(itemTypeList);
            rootEle = JAXBUtils.getXMLObject(itemTypes, WorkItemTypes.class);
        } catch (ParserConfigurationException | JAXBException | SAXException | IOException pce) {
            LOG.error(pce.getMessage(), pce);
            throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), pce.getMessage());
        }  finally {
           // IOUtils.closeQuietly(restApi);
        }
        return rootEle;
    }

    @Override
    public Object getAllWorkItems(String projectKey, QueryParams queryParams) throws RabitServicesException {
        Element rootEle = null;
        WorkItem workItem = null;
        WorkItems workItems = new WorkItems();
        WorkItemStatuses statuses = null;
        boolean rallyTeamboardOrgs = false;
        List<WorkItemStatus> actionList = null;
        try {
            TreeSet<WorkItem> workItemsSet = new TreeSet<>();
            String name;
            String ownerName;
            String priority;
            String objectId;
            String assetType; 
            String description; 
            String key = null;
            Properties properties = FileUtil.loadPropertyFile(Constants.ALM_PROP_FILE);
			if(properties != null && properties.getProperty(RALLY_TEAMBOARD_ORGS) != null) {
				rallyTeamboardOrgs = properties.getProperty(RALLY_TEAMBOARD_ORGS).contains(orgname)? true:false;
			}
            if (assetTypes != null && assetTypes.length > 0) {
        	    statuses = (WorkItemStatuses) getStatuses(projectKey, queryParams.getProjectName());
                for (String issueType : assetTypes) {
                    QueryRequest storyRequest = new QueryRequest(issueType);
                    storyRequest.setProject(PROJECT + projectKey);
                    storyRequest.setFetch(new Fetch(new String[] { "Name", FORMATTED_ID, FLOWSTATE,SECHEDULESTATE, OBJECTID, DESCRIPTION, OWNER, TYPE, PRIORITY }));
                    storyRequest.setLimit(1000);
                    storyRequest.setScopedDown(false);
                    storyRequest.setScopedUp(false);
                    storyRequest.setQueryFilter(new QueryFilter("Iteration.ObjectID", "=", queryParams.getSprintId()));
                    QueryResponse storyQueryResponse = restApi.query(storyRequest);
                    JsonObject flowstateObj = null;
                    for (int j = 0; j < storyQueryResponse.getResults().size(); j++) {
                    	workItem = new WorkItem();
                        JsonObject storyJsonObject = storyQueryResponse.getResults().get(j).getAsJsonObject();
                        name = storyJsonObject.get("Name").getAsString();
                        key = storyJsonObject.get(FORMATTED_ID).getAsString();
                        ownerName = (!storyJsonObject.get(OWNER).isJsonNull()) ? storyJsonObject.get(OWNER).getAsJsonObject().get(REFOBJECTNAME).getAsString() : "";
                        if ("Defect".equalsIgnoreCase(issueType)) {
                            priority = (!storyJsonObject.get(PRIORITY).isJsonNull()) ? storyJsonObject.get(PRIORITY).getAsString() : "";
                            workItem.setPriority(priority);
                        }
                        String status = !(storyJsonObject.get(SECHEDULESTATE).isJsonNull())? storyJsonObject.get(SECHEDULESTATE).getAsString():"";
                        objectId = !(storyJsonObject.get(OBJECTID).isJsonNull())?storyJsonObject.get(OBJECTID).getAsString():"";
                        assetType = !(storyJsonObject.get(TYPE).isJsonNull())?storyJsonObject.get(TYPE).getAsString():"";
                        description = !(storyJsonObject.get(DESCRIPTION).isJsonNull())?storyJsonObject.get(DESCRIPTION).getAsString():"";
                        if(rallyTeamboardOrgs) {
                        	flowstateObj = storyJsonObject.getAsJsonObject(FLOWSTATE);
                        	LOG.info("Name::"+flowstateObj.get("Name").getAsString() +" ObjectID::"+flowstateObj.get(OBJECTID).getAsString());
                        	workItem.setStatus(flowstateObj.get("Name").getAsString());
                        }else {
                        	workItem.setStatus(status);
                        }
                        workItem.setId(key);
                        workItem.setKey(objectId);
                        workItem.setName(name);
                        workItem.setDescription(description);
                        workItem.setAssigne(ownerName);
                        workItem.setProjectkey(projectKey);
                        workItem.setType(assetType);
                        if (statuses != null) {
                        	actionList = new ArrayList<>();
                            actionList = statuses.getStatuses();
                            workItem.setActions(actionList);
                        }
                        workItemsSet.add(workItem);
                    }
                }
                workItems.setWorkitems((TreeSet<WorkItem>)workItemsSet.descendingSet());
                rootEle = JAXBUtils.getXMLObject(workItems, WorkItems.class);
            }
        } catch (IOException | JAXBException | ParserConfigurationException | SAXException e) {
            LOG.error(e.getMessage(), e);
            throw new RabitServicesException(ExceptionCode.RALLYAAUTHENTICATIONFAILED.getCode(), e.getMessage());
        }  finally {
            // Release resources
            IOUtils.closeQuietly(restApi);
        }
        return rootEle;
    }

    @Override
    public Object getPlannedForList(String projectKey, QueryParams queryParams) throws RabitServicesException {
        Element rootEle = null;
        try {
            PlannedForType plannedType = null;
            PlannedForTypes plannedTypes = new PlannedForTypes();
            ArrayList<PlannedForType> plannedTypeList = new ArrayList<>();
            QueryRequest iterationRequest = new QueryRequest("Iteration");
            iterationRequest.setFetch(new Fetch("Name", OBJECTID, "StartDate", "EndDate"));
            iterationRequest.setScopedDown(false);
            iterationRequest.setScopedUp(false);
            iterationRequest.setProject(PROJECT + projectKey);
            QueryResponse iterationQueryResponse = restApi.query(iterationRequest);
            int numberOfIteraitons = iterationQueryResponse.getTotalResultCount();
            if (numberOfIteraitons > 0) {
                for (int i = 0; i < numberOfIteraitons; i++) {
                    JsonObject iterationJsonObject = iterationQueryResponse.getResults().get(i).getAsJsonObject();
                    String iterationName = !(iterationJsonObject.get("Name").isJsonNull())? iterationJsonObject.get("Name").getAsString():"";
                    String objectID = !(iterationJsonObject.get(OBJECTID).isJsonNull())?iterationJsonObject.get(OBJECTID).getAsString():"";
                    plannedType = new PlannedForType();
                    plannedType.setId(objectID);
                    plannedType.setName(iterationName);
                    plannedType.setDisplayname(iterationName);
                    plannedTypeList.add(plannedType);
                }
                plannedTypes.setPlannedfortypes(plannedTypeList);
                rootEle = JAXBUtils.getXMLObject(plannedTypes, PlannedForTypes.class);
            }
        } catch (IOException | JAXBException | ParserConfigurationException | SAXException e) {
            LOG.error(e.getMessage(), e);
            throw new RabitServicesException(ExceptionCode.RALLYAAUTHENTICATIONFAILED.getCode(), e.getMessage());
        } finally {
            // Release resources
            IOUtils.closeQuietly(restApi);
        }
        return rootEle;
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
    public String createIssues(String orgName, String projectId, String issueType, String subject, String description, String status, String priority) throws RabitServicesException {
        return null;
    }

    @Override
    public Object getTaskManagementSummary(String orgName) throws RabitServicesException {
        return null;
    }

    @Override
    public String updateWorkItemStatus(String orgName,String labelName, String projectKey, String workItemId, String status, String comment, Logger LOG) throws RabitServicesException {
    	if(LOG == null) {
			LOG = RallyConnector.LOG;
		}
    	String result = Messages.FAILED;
    	JsonObject obj = null;
        UpdateResponse updateResponse;
        String type = null; 
		String id = null;
		String objectID = null;
		String prevNotes= "";
        boolean rallyTeamboardOrgs = true;
        try {
            LOG.info("\nUpdating Workitem.." + workItemId);
            Properties properties = FileUtil.loadPropertyFile(Constants.ALM_PROP_FILE);
			if(properties != null && properties.getProperty(RALLY_TEAMBOARD_ORGS) != null) {
				rallyTeamboardOrgs = properties.getProperty(RALLY_TEAMBOARD_ORGS).contains(orgname)? true:false;
			}
            if (workItemId.contains(",") && restApi != null) {
                type = workItemId.split(",")[0];
                id = workItemId.split(",")[1];
                QueryRequest queryRequest = new QueryRequest(type);
                queryRequest.setProject(PROJECT + projectKey);
                queryRequest.setFetch(new Fetch(new String[] { SECHEDULESTATE,FLOWSTATE, STATE, "Name", OBJECTID,NOTES }));
                queryRequest.setQueryFilter(new QueryFilter(FORMATTED_ID, "=", id));
                QueryResponse workitemQueryResponse = restApi.query(queryRequest);
                JsonObject flowstateObj = null;
                if (workitemQueryResponse.wasSuccessful() && workitemQueryResponse.getTotalResultCount() > 0) {
                    JsonObject jsonObject = workitemQueryResponse.getResults().get(0).getAsJsonObject();
                    LOG.info(String.format("Previous ScheduleState State. ScheduleState = %s", jsonObject.get(SECHEDULESTATE).getAsString()));
                    objectID = !jsonObject.get(OBJECTID).isJsonNull()?jsonObject.get(OBJECTID).getAsString():"";
                    prevNotes = !jsonObject.get(NOTES).isJsonNull()?jsonObject.get(NOTES).getAsString():"";
                    if(rallyTeamboardOrgs) {
                    	flowstateObj = jsonObject.getAsJsonObject(FLOWSTATE);
                    	LOG.info(String.format("Previous FlowState. FlowState = %s", flowstateObj.get("Name").getAsString()));
                    }
                    JsonObject updatedDefect = new JsonObject();
                    if(comment!= null && !"".equalsIgnoreCase(comment)){
                    	comment = comment +"  \n"+prevNotes;
                    	updatedDefect.addProperty(NOTES, comment);
                    }
                    if(rallyTeamboardOrgs && flowstateObj != null) {
                    	JSONObject newFlowStateObj =  (JSONObject) getTeamBoardStatuesofProject(projectKey,status,true);
                    	flowstateObj.addProperty("_ref",newFlowStateObj.getString("_ref"));
                    	flowstateObj.addProperty("_refObjectUUID",newFlowStateObj.getString("_refObjectUUID"));
                    	flowstateObj.addProperty(REFOBJECTNAME, newFlowStateObj.getString(REFOBJECTNAME));
                    	updatedDefect.add(FLOWSTATE, flowstateObj);
                    }else {
                    	updatedDefect.addProperty(SECHEDULESTATE, status);
                    }
                    if(objectID != null && !"".equalsIgnoreCase(objectID)) {
                    	UpdateRequest updateRequest = new UpdateRequest("/" + type + "/" + objectID, updatedDefect);
                    	updateResponse = restApi.update(updateRequest);
                    	if (updateResponse.wasSuccessful()) {
                    		obj = updateResponse.getObject();
                    		if(rallyTeamboardOrgs) {
                    			flowstateObj = obj.getAsJsonObject(FLOWSTATE);
                    			LOG.info(String.format("Updated Flow. FlowState = %s", flowstateObj.get(REFOBJECTNAME)));
                    		}else {
                    			LOG.info(String.format("Updated ScheduleState. ScheduleState = %s", obj.get(SECHEDULESTATE)));
                    		}
                    	}
                    	result = Messages.SUCCESS;
                    }
                }
            }
        } catch (IOException | JSONException e) {
            LOG.error(e.getMessage(), e);
            throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), e.getMessage());
        } finally {
            // Release resources
          //  IOUtils.closeQuietly(restApi);
        }
        return result;
    }

    @Override
    public String testConnection(String url, String userName, String password, Logger LOG) throws RabitServicesException {
    	if(LOG == null) {
			LOG = RallyConnector.LOG;
		}
    	boolean rallyAPITokenAuthentication = false;
    	try {
    		Properties properties = FileUtil.loadPropertyFile(Constants.ALM_PROP_FILE);
    		if(properties != null && properties.getProperty(RALLY_APITOKEN_AUTH_ORGS) != null) {
    			rallyAPITokenAuthentication = properties.getProperty(RALLY_APITOKEN_AUTH_ORGS).contains(orgname)? true:false;
    		}
            QueryRequest userRequest = new QueryRequest("User");
            userRequest.setFetch(new Fetch("UserName", "Subscription", DISPLAYNAME, LASTLOGINDATE, OBJECTID, "Role", "SubscriptionAdmin"));
            if(rallyAPITokenAuthentication) {
       		 restApi = new RallyRestApi(new URI(url), password);
            }else {
            	userRequest.setQueryFilter(new QueryFilter("UserName", "=", userName));
            	restApi = new RallyRestApi(new URI(url), userName, password);
            }
            QueryResponse userQueryResponse = restApi.query(userRequest);
            JsonArray userQueryResults = userQueryResponse.getResults();
            JsonElement userQueryElement = userQueryResults.get(0);
            JsonObject userQueryObject = userQueryElement.getAsJsonObject();
            String userRef = (userQueryObject.get(LASTLOGINDATE) != null && !(userQueryObject.get(LASTLOGINDATE).isJsonNull()))?userQueryObject.get(LASTLOGINDATE).getAsString():"";
            String displayName = !(userQueryObject.get(DISPLAYNAME).isJsonNull())? userQueryObject.get(DISPLAYNAME).getAsString():"";
            LOG.info("Authentication Success::" + displayName + "::" + userRef);
        } catch (IOException | URISyntaxException e) {
            LOG.error(e.getMessage(), e);
            throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
        } 
        return Messages.SUCCESS;
    }
    
   /**
    *  
    * @param projectKey
    * @param projectName
    * @param isupdate set true for updateworkitem else false
    * @return
    * @throws RabitServicesException
    */
    public Object getTeamBoardStatuesofProject(String projectKey,String updateStatus,Boolean isupdate) throws RabitServicesException {
    	String allFlowStates = null;
    	WorkItemStatus status = null;
    	ArrayList<WorkItemStatus> statusesList = new ArrayList<>();
    	WorkItemStatuses statuses = new WorkItemStatuses();
    	try {
    		String commonslm ="/slm/webservice/v2.0/";
    		String queryString = "&query=&start=1&pagesize=500";
    		String url = commonslm+"flowstate?project="+rallyBaseURL+commonslm+"/project/"+projectKey+queryString;
    		allFlowStates =  invokeGetMethod(url);
			if(allFlowStates != null) {
				JSONObject projectFlowStatesObj = new JSONObject(allFlowStates);
				JSONObject queryResultObje = new JSONObject(projectFlowStatesObj.getString("QueryResult"));
				JSONArray flowStates = new JSONArray(queryResultObje.getString("Results"));
				String flowStateRef = null;
				String flowStateObj = null;
				for (int i = 0; i < flowStates.length(); i++) {
					JSONObject flowState = flowStates.getJSONObject(i);
					flowStateRef = flowState.getString("_ref");
					flowStateObj = invokeGetMethodforFlowState(flowStateRef);
					if(flowStateObj != null) {
						JSONObject flowstatecompleteObj = new JSONObject(flowStateObj);
						JSONObject flowStateJson = new JSONObject(flowstatecompleteObj.getString(FLOWSTATE));
						if(flowStateJson.has("Project")) {
							JSONObject projectJson = new JSONObject(flowStateJson.getString("Project"));
							if(projectJson.has(REFOBJECTNAME) && projectJson.getString("_ref").contains(projectKey)) {
								if(isupdate && flowStateJson.has("Name") && updateStatus.equalsIgnoreCase(flowStateJson.getString("Name"))) {
									return flowStateJson;
								}else {
									status = new WorkItemStatus();
									status.setId(flowState.getString("_ref"));
									status.setName(flowState.getString(REFOBJECTNAME));
									statusesList.add(status);
								}
							}
						}
					}
				}
				if(!statusesList.isEmpty()){
					Collections.sort(statusesList, new WorkItemStatus());
				}
				statuses.setStatuses(statusesList);
			}
		} catch (AuthenticationException | JSONException e) {
			LOG.error(e.getMessage(), e);
            throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), e.getMessage());
		} 
    	return statuses;
    }
    
    private static String invokeGetMethodforFlowState(String url) throws AuthenticationException {
		Client client = Client.create();
		WebResource webResource = client.resource(url);
		ClientResponse response = webResource.header("Authorization", "Basic " + fToken).type(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
		int statusCode = response.getStatus();
		if (statusCode == 401) {
			throw new AuthenticationException("Invalid Username or Password");
		}
		return response.getEntity(String.class);
	}
    
    private static String invokeGetMethod(String url) throws AuthenticationException {
		Client client = Client.create();
		WebResource webResource = client.resource(rallyBaseURL+url);
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
	public Object getworkItem(String orgName,String labelName,String workItemId,String projectId) throws RabitServicesException {
		String type = null;
		 String ownerName;
         String priority;
         String objectId;
         String description; 
         boolean rallyTeamboardOrgs = true;
		WorkItem workItem= new WorkItem();
		QueryRequest queryRequest = null;
		try {
			LOG.info("\nUpdating Workitem.." + workItemId);
			Properties properties = FileUtil.loadPropertyFile(Constants.ALM_PROP_FILE);
			if(properties != null && properties.getProperty(RALLY_TEAMBOARD_ORGS) != null) {
				rallyTeamboardOrgs = properties.getProperty(RALLY_TEAMBOARD_ORGS).contains(orgname)? true:false;
			}
			if (restApi != null) {
				if(workItemId.startsWith("US")) {
					queryRequest = new QueryRequest("HierarchicalRequirement");
					type = "HierarchicalRequirement";
				}else if(workItemId.startsWith("DE")) {
					queryRequest = new QueryRequest("Defect");
					type = "Defect";
				}else if(workItemId.startsWith("DS")) {
					queryRequest = new QueryRequest("DefectSuite");
					type = "DefectSuite";
				}
				if(queryRequest!=null) {
					queryRequest.setFetch(new Fetch(new String[] { NAME, FORMATTED_ID, FLOWSTATE,SECHEDULESTATE, OBJECTID, DESCRIPTION, OWNER, TYPE, PRIORITY,ITERATION,"Project" }));
					queryRequest.setQueryFilter(new QueryFilter(FORMATTED_ID, "=", workItemId));
					QueryResponse workitemQueryResponse = restApi.query(queryRequest);
					if (workitemQueryResponse.wasSuccessful() && workitemQueryResponse.getTotalResultCount() > 0) {
						JsonObject storyJsonObject = workitemQueryResponse.getResults().get(0).getAsJsonObject();
						ownerName = (!storyJsonObject.get(OWNER).isJsonNull()) ? storyJsonObject.get(OWNER).getAsJsonObject().get(REFOBJECTNAME).getAsString() : "";
						if ("Defect".equalsIgnoreCase(type)) {
							priority = (!storyJsonObject.get(PRIORITY).isJsonNull()) ? storyJsonObject.get(PRIORITY).getAsString() : "";
							workItem.setPriority(priority);
						}
						String status = !(storyJsonObject.get(SECHEDULESTATE).isJsonNull())? storyJsonObject.get(SECHEDULESTATE).getAsString():"";
						objectId = !(storyJsonObject.get(OBJECTID).isJsonNull())?storyJsonObject.get(OBJECTID).getAsString():"";
						description = !(storyJsonObject.get(DESCRIPTION).isJsonNull())?storyJsonObject.get(DESCRIPTION).getAsString():"";
						if(rallyTeamboardOrgs) {
							JsonObject flowstateObj = storyJsonObject.getAsJsonObject(FLOWSTATE);
							LOG.info("Name::"+flowstateObj.get(NAME).getAsString() +" ObjectID::"+flowstateObj.get(OBJECTID).getAsString());
							workItem.setStatus(flowstateObj.get(NAME).getAsString());
						}else {
							workItem.setStatus(status);
						}
						workItem.setTitle(storyJsonObject.get(REFOBJECTNAME).getAsString());
						workItem.setId(workItemId);
						workItem.setKey(objectId);
						workItem.setType(type);
						workItem.setDescription(description);
						workItem.setAssigne(ownerName);
						if(!storyJsonObject.get("Project").isJsonNull()) {
							workItem.setProjectName(storyJsonObject.get("Project").getAsJsonObject().get(REFOBJECTNAME).getAsString());
							workItem.setProjectid(storyJsonObject.get("Project").getAsJsonObject().get(OBJECTID).getAsString());
						}
						if(!(storyJsonObject.get("Iteration").isJsonNull())) {
							workItem.setSprint(storyJsonObject.get("Iteration").getAsJsonObject().get(NAME).getAsString());
						}
						workItem.setConnectorType(ConnectorTypes.RALLY.getConnectorType().toLowerCase());
					}
				}
			}
		}catch (Exception jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.WEBSERVICEEXCEPTION.getCode(),jaxbe.getMessage());
		} finally {
            // Release resources
            IOUtils.closeQuietly(restApi);
        }
        return workItem;
    }
    
}
