package com.rabit.alm.hpalm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;

import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.hpe.adm.nga.sdk.Octane;
import com.hpe.adm.nga.sdk.authentication.Authentication;
import com.hpe.adm.nga.sdk.authentication.SimpleUserAuthentication;
import com.hpe.adm.nga.sdk.entities.EntityList;
import com.hpe.adm.nga.sdk.entities.get.GetEntities;
import com.hpe.adm.nga.sdk.model.EntityModel;
import com.hpe.adm.nga.sdk.model.FieldModel;
import com.hpe.adm.nga.sdk.model.ModelParser;
import com.hpe.adm.nga.sdk.model.ReferenceFieldModel;
import com.hpe.adm.nga.sdk.model.StringFieldModel;
import com.hpe.adm.nga.sdk.query.Query;
import com.hpe.adm.nga.sdk.query.QueryMethod;
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
public class HPOctaneAlmConnector implements RMConnector{


	private static final Logger LOG = Logger.getLogger(HPOctaneAlmConnector.class);
	private static HPOctaneAlmConnector octaneConnector;
	private static String octaneBaseURL = null;
	private static String userEmail ;
	private static EntityList entityList ;
	private static Query.QueryBuilder statement;
	private static GetEntities get;
	private static Octane.Builder octaneBuilder;
	private static Properties properties = FileUtil.loadPropertyFile(Constants.ALM_PROP_FILE);
	Octane octane ;
	public static HPOctaneAlmConnector getInstance(String orgName,String useremail,String labelName) throws RabitServicesException{
		userEmail = useremail;
		if(octaneConnector == null){
			octaneConnector = new HPOctaneAlmConnector();
		}
		if(Messages.TEST_MSG.equalsIgnoreCase(useremail)){
			return octaneConnector;
		}
		try {
			createInstance(orgName,userEmail,labelName);
		} catch(Exception e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(), e.getMessage());
		}
		return octaneConnector;
	}

	public static void createInstance(String orgName,String userEmail,String labelName) throws RabitServicesException {
		LOG.info("In createInstance ");
		ALMLoginDetails almLoginDetails = null;
		try {
			almLoginDetails = new ALMUtils(orgName,userEmail,labelName).getLoginDetails();
			if(almLoginDetails != null){
				octaneBaseURL = almLoginDetails.getUrl();
				new HPOctaneAlmConnector().testConnection(octaneBaseURL,almLoginDetails.getUserName(), almLoginDetails.getPassWord(), LOG);
					Authentication userPassAuthentication = new SimpleUserAuthentication(almLoginDetails.getUserName(), almLoginDetails.getPassWord());
					//to form octane builder to use globally  
					if(almLoginDetails.getUrl() != null && !almLoginDetails.getUrl().isEmpty() && almLoginDetails.getsharedSpaceId()!=null){
						octaneBuilder = new Octane.Builder(userPassAuthentication);
						octaneBuilder.Server(almLoginDetails.getUrl());
						octaneBuilder.sharedSpace(Long.valueOf(almLoginDetails.getsharedSpaceId()));
					}else {
						LOG.info("createInstance ::: userPassAuthentication ===>"+userPassAuthentication);
						LOG.info("createInstance ::: almLoginDetails.getUrl() ===>"+almLoginDetails.getUrl());
						LOG.info("createInstance ::: almLoginDetails.getsharedSpaceId() ===>"+almLoginDetails.getsharedSpaceId());
						throw new RabitServicesException(ExceptionCode.JSONEXCEPTION.getCode(), ExceptionCode.JSONEXCEPTION.getDescription());
					}
			}else{
				LOG.error(ErrorCodeMessages.ALMLOGIN_DETAILS);
				throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(),ExceptionCode.ALMLOGINDETAILSEXCEPTION.getDescription());
			}
		} 
		catch (ClientHandlerException e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.HPOCTANEAUTHENTICATIONFAILED.getCode(), ExceptionCode.HPOCTANEAUTHENTICATIONFAILED.getDescription());
		}
	}


	@Override
	public String testConnection(String url, String userName, String password, Logger LOG) throws RabitServicesException {
		Client client = Client.create();
		if(LOG == null) {
			LOG = HPOctaneAlmConnector.LOG;
		}
		LOG.info(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
		LOG.info("testConnection ::: octaneBaseURL ===>"+url);
		LOG.info("testConnection ::: userName ===>"+userName);
		LOG.info("testConnection ::: getPassWord ===>"+ password);
		LOG.info(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");

		if(!"".equalsIgnoreCase(url.trim()) && !"".equalsIgnoreCase(userName.trim())&&!"".equalsIgnoreCase(password.trim())) {
			String auth = new String(Base64.encode(userName+":"+password));
			String  statusCode ;
			String userCredentials = "{\"user\":\""+userName+"\",\"password\":\""+password+"\"}";
			WebResource webResource = client.resource(url+"/authentication/sign_in");
			ClientResponse response =webResource.header("Authorization", "Basic " + auth).type(MediaType.APPLICATION_JSON_TYPE).post(ClientResponse.class, userCredentials);
			statusCode = response.getStatus()+"";
			LOG.info("testConnection ::: status code ===>"+statusCode);
			if("200".equalsIgnoreCase(statusCode)){
				return Messages.SUCCESS;
			}
			else if ("401".equalsIgnoreCase(statusCode)) {
				throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
			}else{
				throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
			}
		} else {
			throw new RabitServicesException(ExceptionCode.ALMAUTHFAIL.getCode(), ExceptionCode.ALMAUTHFAIL.getDescription());
		}
	}
	@Override
	public Object getProjects(String orgName) throws RabitServicesException {
		Element rootElement = null;
		ALMProject project = null;
		LOG.info("In getProjects ");
		try {
			ALMProjects almProjects = new ALMProjects();
			ArrayList<ALMProject> projectList = new ArrayList<>();
			octane = octaneBuilder.build();
			JSONArray projectArray =ModelParser.getInstance().getEntitiesJSONObject(octane.entityList("workspaces").get().execute()).getJSONArray("data");
			LOG.info("getProjects ::: projectArray size ===> "+projectArray.length());
			for (int i = 0; i < projectArray.length(); i++) {
				JSONObject proj = projectArray.getJSONObject(i);
				project = new ALMProject();
				project.setId(proj.getString("id"));
				project.setKey(proj.getString("id"));
				project.setName(proj.getString("name"));
				projectList.add(project);
			}
			almProjects.setProjects(projectList);
			rootElement = JAXBUtils.getXMLObject(almProjects, ALMProjects.class);
		} catch (JSONException jsonexc) {
			LOG.error(jsonexc.getMessage(), jsonexc);
			throw new RabitServicesException("JSONException is "+jsonexc.getMessage());
		} catch (ParserConfigurationException parseExc) {
			LOG.error(parseExc.getMessage(), parseExc);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		}catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}catch (Exception e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.HPOCTANEPROCESSFAILED.getCode(), e.getMessage());
		} 
		LOG.info("At end of  getProjects ");
		return rootElement;
	}

	@Override
	public Object getPlannedForList(String projectKey, QueryParams queryParams) throws RabitServicesException {
		// release and sprint composite key
		PlannedForTypes plannedTypes = new PlannedForTypes();
		PlannedForType plannedType = null;
		Element rootEle = null;
		LOG.info("In getPlannedForList ");
		LOG.info("**************************************** getPlannedForList input parms ************************************");
		LOG.info("In getPlannedForList  ::: projectKey ====>"+projectKey);
		LOG.info("***********************************************************************************************************");
		try {
			//to get workspaceId from queryparams
			octaneBuilder.workSpace(Long.valueOf(projectKey));
			octane = octaneBuilder.build();
			ArrayList<PlannedForType> plannedForList = new ArrayList<>();

			//to get release's in a workspace
			JSONArray releaseArr = ModelParser.getInstance().getEntitiesJSONObject(octane.entityList("releases").get().execute()).getJSONArray("data");
			LOG.info("getPlannedForList ::: releaseArr size  ===> "+releaseArr.length());
			for (int i =0;i<releaseArr.length();i++) {
				JSONObject releaseObj = releaseArr.getJSONObject(i);
				entityList = octane.entityList("sprints");
				get = entityList.get();
				statement = Query.statement("release", QueryMethod.EqualTo,
						Query.statement("id", QueryMethod.EqualTo, releaseObj.getInt("id")));

				//to get sprint's of a single release
				JSONArray sprintArr = ModelParser.getInstance().getEntitiesJSONObject(get.query(statement.build()).execute()).getJSONArray("data");
				LOG.info("getPlannedForList ::: sprintArr size  ===> "+sprintArr.length());
				for (int j =0;j<sprintArr.length();j++) {
					JSONObject sprintObj = sprintArr.getJSONObject(j);
					plannedType = new PlannedForType();
					plannedType.setId(releaseObj.getString("id") +" - "+sprintObj.getString("id"));
					plannedType.setName(releaseObj.getString("name") +" - "+sprintObj.getString("name"));
					plannedType.setDisplayname(releaseObj.getString("name") +" - "+sprintObj.getString("name"));
					plannedForList.add(plannedType);
				}
			}
			LOG.info("getPlannedForList ::: Total plannedForList size  ===> "+plannedForList.size());
			plannedTypes.setPlannedfortypes(plannedForList);
			rootEle = JAXBUtils.getXMLObject(plannedTypes, PlannedForTypes.class);
		}catch (JSONException jsonexc) {
			LOG.error(jsonexc.getMessage(), jsonexc);
			throw new RabitServicesException("JSONException is "+jsonexc.getMessage());
		} catch (ParserConfigurationException parseExc) {
			LOG.error(parseExc.getMessage(), parseExc);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		}catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}
		catch (Exception e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.HPOCTANEPROCESSFAILED.getCode(), e.getMessage());
		}
		LOG.info("At end of  getPlannedForList ");
		return rootEle;
	}
	@Override
	public Object getAllWorkItems(String projectKey, QueryParams queryParams) throws RabitServicesException {
		List<String> workItemList = new ArrayList<>();
		WorkItem workItem = null;
		WorkItems workItems = new WorkItems();
		TreeSet<WorkItem> workItemsList = new TreeSet<>();
		Element rootEle = null;

		LOG.info("In  getAllWorkItems ");
		LOG.info("**************************************** getAllWorkItems input parms *************************************");
		LOG.info("In  getAllWorkItems  ::: projectKey ====>"+projectKey);
		LOG.info("In  getAllWorkItems  ::: queryParams ====>"+queryParams.getSprintId());
		LOG.info("**********************************************************************************************************");
		workItemList= Arrays.asList(properties.getProperty("octaneworkitemlist").split(","));

		LOG.info("In getAllWorkItems ::: workItemList ===> "+workItemList);
		octaneBuilder.workSpace(Long.valueOf(projectKey));
		octane = octaneBuilder.build();
		for (String workItemstr : workItemList) {
			entityList = octane.entityList(workItemstr+"");
			get = entityList.get();
			try {
				//to get release and sprint from query params
				String releaseSprint[] = queryParams.getSprintId().split("-");
				JSONArray dataArr = new JSONArray();
				LOG.info("getAllWorkItems ::: release_sprint size ===> "+releaseSprint.length);
				if(workItemstr.equalsIgnoreCase("features") && releaseSprint.length == 2) {
					statement = Query.statement("release", QueryMethod.EqualTo,
							Query.statement("id", QueryMethod.EqualTo, Long.valueOf(releaseSprint[0].trim())));

					dataArr =ModelParser.getInstance().getEntitiesJSONObject(get.query(statement.build()).execute()).getJSONArray("data");
				}else if(workItemstr.equalsIgnoreCase("epics")){
					dataArr =ModelParser.getInstance().getEntitiesJSONObject(get.execute()).getJSONArray("data");
				}else {
					if(releaseSprint.length == 2) {
						statement = Query.statement("release", QueryMethod.EqualTo,
								Query.statement("id", QueryMethod.EqualTo, Long.valueOf(releaseSprint[0].trim())))
								.and(Query.statement("sprint", QueryMethod.EqualTo,
										Query.statement("id", QueryMethod.EqualTo, Long.valueOf(releaseSprint[1].trim()))));

						dataArr =ModelParser.getInstance().getEntitiesJSONObject(get.query(statement.build()).execute()).getJSONArray("data");
					}else {
						throw new RabitServicesException(ExceptionCode.HPOCTANEPROCESSFAILED.getCode(), ExceptionCode.HPOCTANEPROCESSFAILED.getDescription());
					}
				}
				//setting values for each workitem 
				for(int i=0;i<dataArr.length();i++){
					JSONObject wrkitemObj = dataArr.getJSONObject(i);
					workItem = new WorkItem();
					if(wrkitemObj.has("id")) {
						workItem.setId(wrkitemObj.getString("id"));
					}
					if(wrkitemObj.has("name")) {
						workItem.setName(wrkitemObj.getString("name"));
					}
					if(wrkitemObj.has("description") && !"null".equalsIgnoreCase(wrkitemObj.getString("description")) ) {
						workItem.setDescription(wrkitemObj.getString("description"));
					}
					if(wrkitemObj.has("type")) {
						workItem.setType(wrkitemObj.getString("type"));
					}
					if(wrkitemObj.has("phase")) {
						EntityList entityList1 = octane.entityList("phases");
						JSONArray dataArr1 =ModelParser.getInstance().getEntitiesJSONObject(entityList1.get().execute()).getJSONArray("data");
						for(int k=0;k<dataArr1.length();k++) {
							JSONObject crntobj = dataArr1.getJSONObject(k);
							if(crntobj.has("id") && crntobj.getString("id")!=null && crntobj.getString("id").equalsIgnoreCase(wrkitemObj.getJSONObject("phase").getString("id")))						
								workItem.setStatus(crntobj.getString("name"));
						}
					}
					if(wrkitemObj.has("sprint")&& !"null".equalsIgnoreCase(wrkitemObj.getString("sprint"))) {
						workItem.setSprint(wrkitemObj.getJSONObject("sprint").getString("id"));
					}
					if(wrkitemObj.has("owner") &&  wrkitemObj.get("owner")!=null && !"null".equalsIgnoreCase(wrkitemObj.getString("owner"))) {
						EntityList entityList2 = octane.entityList("workspace_users");
						EntityList.Entities entity = entityList2.at(wrkitemObj.getJSONObject("owner").getString("id"));
						String assigne = ModelParser.getInstance().getEntityJSONObject(entity.get().execute()).getString("name");
						workItem.setOwner(assigne);
					}
					//to get the next possible status transitions
					workItem.setActions(getnextStatuses(Long.valueOf(projectKey), wrkitemObj.getString("type"),wrkitemObj.getJSONObject("phase").getString("id")));

					workItemsList.add(workItem);
				}
				workItems.setWorkitems(workItemsList);
				rootEle = JAXBUtils.getXMLObject(workItems, WorkItems.class);
			}catch (JSONException jsonexc) {
				LOG.error(jsonexc.getMessage(), jsonexc);
				throw new RabitServicesException("JSONException is "+jsonexc.getMessage());
			} catch (ParserConfigurationException parseExc) {
				LOG.error(parseExc.getMessage(), parseExc);
				throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
			}catch (JAXBException jaxbe) {
				LOG.error(jaxbe.getMessage(), jaxbe);
				throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
			}catch (Exception e) {
				LOG.error(e.getMessage(), e);
				throw new RabitServicesException(ExceptionCode.HPOCTANEPROCESSFAILED.getCode(), e.getMessage());
			} 
		}
		LOG.info("At end of  getAllWorkItems ");
		return rootEle;
	}

	public ArrayList<WorkItemStatus> getnextStatuses(long  projectKey, String workItemType,String crntStatus) throws RabitServicesException {
		LOG.info("**************************************** getnextStatuses input parms ***************************************");
		LOG.info("getnextStatuses ::: projectKey ====>"+projectKey);
		LOG.info("getnextStatuses ::: workItemType ====>"+workItemType);
		LOG.info("getnextStatuses ::: crntStatus ====>"+crntStatus);
		LOG.info("************************************************************************************************************");
		WorkItemStatuses statuses = new WorkItemStatuses();
		WorkItemStatus status = null;
		octaneBuilder.workSpace(projectKey);
		octane = octaneBuilder.build();
		entityList = octane.entityList("transitions");
		statement = (Query.statement("entity", QueryMethod.EqualTo,workItemType));
		JSONArray transitionArr = new JSONArray();
		try {
			//all transition status
			transitionArr = ModelParser.getInstance().getEntitiesJSONObject(entityList.get().query(statement.build()).execute()).getJSONArray("data");
			ArrayList<WorkItemStatus> statusesList =  new ArrayList<>();
			for (int i=0;i<transitionArr.length();i++) {
				JSONObject transitionObj = transitionArr.getJSONObject(i);
				//to get possible target_phase transition status
				if(transitionObj.getString("type").equalsIgnoreCase("transition")&&transitionObj.getJSONObject("source_phase").getString("id").equalsIgnoreCase(crntStatus)) {
					status = new WorkItemStatus();
					String[] targetName = transitionObj.getString("id").split("2");
					status.setName(targetName[targetName.length-1]);
					status.setId(transitionObj.getJSONObject("target_phase").getString("id"));
					statusesList.add(status);
				}
			}
			statuses.setStatuses(statusesList);
			return statusesList;

		} catch (Exception e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.HPOCTANEPROCESSFAILED.getCode(), e.getMessage());
		}
	}

	@Override
	public String updateWorkItemStatus(String orgName,String labelName, String projectKey, String workItemId, String status,
			String comment, Logger LOG) throws RabitServicesException {
		if(LOG == null) {
			LOG = HPOctaneAlmConnector.LOG;
		}
		String result = Messages.FAILED;
		try {
			String[] wrkItmIDEntity = workItemId.split(",");
			JSONObject updatemappingobj = new JSONObject(properties.getProperty("octaneupdateworkitemObj"));

			LOG.info("**************************************** updateWorkItemStatus input parms *************************************");
			LOG.info("updateWorkItemStatus ::: wrkItmID_entity ====>"+wrkItmIDEntity[0]+" , "+wrkItmIDEntity[1]);
			LOG.info("updateWorkItemStatus ::: projectKey ====>"+projectKey);
			LOG.info("updateWorkItemStatus ::: status ====>"+status);
			LOG.info("updateWorkItemStatus ::: updatemappingobj ====>"+updatemappingobj);
			LOG.info("***************************************************************************************************************");

			if(wrkItmIDEntity!=null && wrkItmIDEntity.length == 2 && updatemappingobj!=null) {
				octaneBuilder.workSpace(Long.valueOf(projectKey.trim()));
				octane = octaneBuilder.build(); 
				EntityList entityList1 = octane.entityList(updatemappingobj.getString(wrkItmIDEntity[0].trim()));
				statement = Query.statement("id", QueryMethod.EqualTo, Integer.valueOf(wrkItmIDEntity[1].trim()));
				FieldModel<EntityModel> phaseField =
						new ReferenceFieldModel("phase",
								new EntityModel(new HashSet<>(Arrays.asList(
										new StringFieldModel("type", "phase"),
										new StringFieldModel("id", status)
										))));
				final Set<FieldModel> entityFields = new HashSet<>(Arrays.asList(phaseField));
				final EntityModel entityModel1 = new EntityModel(entityFields);
				entityList1.update().query(statement.build()).entities(new ArrayList<>(Collections.singletonList(entityModel1))).execute();
				result = Messages.SUCCESS;
			}else {
				LOG.info("wrkItmID_entity.length ====> "+wrkItmIDEntity.length);
				LOG.info(Messages.OCTANE_STATUS_UPDATE_UNSUCCESS);
			}
		}catch (JSONException jsonexc) {
			LOG.error(jsonexc.getMessage(), jsonexc);
			return Messages.OCTANE_STATUS_UPDATE_UNSUCCESS;
		} catch (Exception e) {
			LOG.error(e.getMessage(), e);
			return Messages.OCTANE_STATUS_UPDATE_UNSUCCESS;
		} 
		return result; 
	}

	@Override
	public Object getAllStatuses(String projId) throws RabitServicesException {
		ArrayList<WorkItemStatus> phaselist= new ArrayList<>();
		WorkItemStatus workItemStatus = null;
		WorkItemStatuses workItemStatuses = new WorkItemStatuses();
		Element rootEle = null;
		try {
			octaneBuilder.workSpace(Long.valueOf(projId));
			octane = octaneBuilder.build();
			entityList = octane.entityList("phases");
			JSONArray transitionArr = new JSONArray();
			transitionArr = ModelParser.getInstance().getEntitiesJSONObject(entityList.get().execute()).getJSONArray("data");

			for (int i = 0; i < transitionArr.length(); i++) {
				workItemStatus = new WorkItemStatus();
				JSONObject transobj = transitionArr.getJSONObject(i);
				workItemStatus.setId(transobj.getString("id"));
				workItemStatus.setName(transobj.getString("name"));
				workItemStatus.setType(transobj.getString("entity"));
				phaselist.add(workItemStatus);
			}
			if(phaselist != null && !phaselist.isEmpty()){
				workItemStatuses.setStatuses(phaselist);
			}
			rootEle = JAXBUtils.getXMLObject(workItemStatuses, WorkItemStatuses.class);
		} catch (JSONException jsonexc) {
			LOG.error(jsonexc.getMessage(), jsonexc);
			throw new RabitServicesException("JSONException is "+jsonexc.getMessage());
		} catch (ParserConfigurationException parseExc) {
			LOG.error(parseExc.getMessage(), parseExc);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		}catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}catch (Exception e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.HPOCTANEPROCESSFAILED.getCode(), e.getMessage());
		} 
		return rootEle;
	}

	@Override
	public Object getStatuses(String projectKey, String workItemType) throws RabitServicesException {

		LOG.info("**************************************** getStatuses input parms ***************************************");
		LOG.info("getStatuses ::: projectKey ====>"+projectKey);
		LOG.info("getStatuses ::: workItemType ====>"+workItemType);
		LOG.info("************************************************************************************************************");

		ArrayList<WorkItemStatus> phaselist= new ArrayList<>();
		WorkItemStatus workItemStatus = null;
		try {
			octaneBuilder.workSpace(Long.valueOf(projectKey));
			octane = octaneBuilder.build();
			entityList = octane.entityList("phases");
			statement = (Query.statement("entity", QueryMethod.EqualTo, workItemType));
			JSONArray transitionArr = new JSONArray();
			transitionArr = ModelParser.getInstance().getEntitiesJSONObject(entityList.get().query(statement.build()).execute()).getJSONArray("data");

			for (int i = 0; i < transitionArr.length(); i++) {
				workItemStatus = new WorkItemStatus();
				JSONObject transobj = transitionArr.getJSONObject(i);
				workItemStatus.setId(transobj.getString("id"));
				workItemStatus.setName(transobj.getString("name"));
				workItemStatus.setType(transobj.getString("entity"));
				phaselist.add(workItemStatus);
			}
		} catch (JSONException jsonexc) {
			LOG.error(jsonexc.getMessage(), jsonexc);
			throw new RabitServicesException("JSONException is "+jsonexc.getMessage());
		} catch (Exception e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.HPOCTANEPROCESSFAILED.getCode(), e.getMessage());
		} 
		return phaselist;
	}

	@Override
	public Object getWorkItemTypes(String projectKey) throws RabitServicesException {
		List<String> workItemList= Arrays.asList(properties.getProperty("octaneEntiylist").split(","));
		WorkItemTypes itemTypes = new WorkItemTypes();
		ArrayList<WorkItemType> itemTypeList = new ArrayList<>();
		Element rootEle = null;
		WorkItemType itemType = new WorkItemType();
		ArrayList<WorkItemStatus> statusesList = new ArrayList<>();
		WorkItemStatuses statuses = new WorkItemStatuses();
		try {
			for (int i=0;i<workItemList.size();i++) {
				itemType = new WorkItemType();
				statuses = new WorkItemStatuses();
				
				statusesList=(ArrayList<WorkItemStatus>) getStatuses(projectKey, workItemList.get(i)+"");
				if( statusesList == null || statusesList.isEmpty()) {
					LOG.error("statuses has failed for work item type "+workItemList.get(i)+" statusesList.size() is null or empty");
					continue;
				}
				itemType.setName(workItemList.get(i)+"");
				itemType.setDisplayname(workItemList.get(i)+"");
				statuses.setStatuses(statusesList);
				itemType.setStatuses(statuses);
				itemTypeList.add(itemType);
			}
			itemTypes.setWorkitemtypes(itemTypeList);
			rootEle = JAXBUtils.getXMLObject(itemTypes, WorkItemTypes.class);
		} catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		} catch (ParserConfigurationException pce) {
			LOG.error (pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			LOG.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		}catch(Exception e) {
			LOG.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.HPOCTANEPROCESSFAILED.getCode(), e.getMessage());
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
	public Object getworkItem(String orgName,String labelName,String workItemId,String projectId) throws RabitServicesException {
		// TODO Auto-generated method stub
		return null;
	}







}
