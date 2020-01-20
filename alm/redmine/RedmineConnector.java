/**
 * 
 */
package com.rabit.alm.redmine;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.google.gson.Gson;
import com.rabit.admin.UserController;
import com.rabit.alm.ALMLoginDetails;
import com.rabit.alm.ALMUtils;
import com.rabit.alm.QueryParams;
import com.rabit.alm.WorkItemPriorities;
import com.rabit.alm.WorkItemPriority;
import com.rabit.alm.WorkItemStatus;
import com.rabit.alm.WorkItemStatuses;
import com.rabit.alm.WorkItemType;
import com.rabit.alm.WorkItemTypes;
import com.rabit.connectors.RMConnector;
import com.rabit.errorcodes.ErrorCodeMessages;
import com.rabit.errorcodes.ExceptionCode;
import com.rabit.main.Constants;
import com.rabit.main.FilePaths;
import com.rabit.main.Messages;
import com.rabit.service.ws.exception.RabitServicesException;
import com.rabit.util.jaxb.JAXBUtils;
import com.rabit.util.xml.DOMUtil;
import com.rabit.util.xml.XPathUtil;
import com.taskadapter.redmineapi.RedmineException;
import com.taskadapter.redmineapi.RedmineManager;
import com.taskadapter.redmineapi.RedmineManagerFactory;
import com.taskadapter.redmineapi.bean.Group;
import com.taskadapter.redmineapi.bean.Issue;
import com.taskadapter.redmineapi.bean.IssuePriority;
import com.taskadapter.redmineapi.bean.IssueStatus;
import com.taskadapter.redmineapi.bean.Membership;
import com.taskadapter.redmineapi.bean.Project;
import com.taskadapter.redmineapi.bean.Role;
import com.taskadapter.redmineapi.bean.Tracker;
import com.taskadapter.redmineapi.bean.User;

/**
 * @author sreenivasrao.m
 *
 */
public final class RedmineConnector implements RMConnector{

	private static final Logger LOG = Logger.getLogger(RedmineConnector.class);
	private static RedmineConnector redmineConnector;
    private static RedmineManager redmineMgr = null;
    private static final String MODULE = "module";
    private static final String PROJECT = "project";
	
    private RedmineConnector(){}
    
    public static RedmineConnector getInstance(String orgName,String userEmail,String labelName) throws RabitServicesException{
    	if(redmineConnector == null){
    		redmineConnector = new RedmineConnector();
    	}
    	createInstance(orgName,userEmail,labelName);
    	return redmineConnector;
    }
    
	public static void createInstance(String orgName,String userEmail,String labelName) throws RabitServicesException{
		ALMLoginDetails almLoginDetails = null;
		almLoginDetails = new ALMUtils(orgName,userEmail,labelName).getLoginDetails();
		if(almLoginDetails != null){
			if(almLoginDetails.getAccessToken() != null && !"".equalsIgnoreCase(almLoginDetails.getAccessToken())){
				redmineMgr = RedmineManagerFactory.createWithApiKey(almLoginDetails.getUrl(), almLoginDetails.getAccessToken());
			} else if(!almLoginDetails.getUserName().equalsIgnoreCase("") && !almLoginDetails.getPassWord().equalsIgnoreCase("")){
				redmineMgr = RedmineManagerFactory.createWithUserAuth(almLoginDetails.getUrl(), almLoginDetails.getUserName(), almLoginDetails.getPassWord());
			}
		}else{
			LOG.error(ErrorCodeMessages.ALMLOGIN_DETAILS);
			throw new RabitServicesException(ExceptionCode.ALMLOGINDETAILSEXCEPTION.getCode(),ExceptionCode.ALMLOGINDETAILSEXCEPTION.getDescription());
		}
	}
    
    /* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getProjects()
	 */
	@Override
	public Object getProjects(String orgName) throws RabitServicesException {
		Document projectsDoc;
		Element projectsRoot = null;
		ArrayList<Integer> projectIds = new ArrayList<>();
		try {
			projectsDoc = DOMUtil.getDocument("<projects/>");
			projectsRoot = projectsDoc.getDocumentElement();
			Element projectEle = null;
			if(redmineMgr != null){
				List<Project> projectList = redmineMgr.getProjects();
				Integer oldPID = 0;
				File almProjFile = new File(FilePaths.getALMProjectsFilePath(orgName));
				if(almProjFile.exists()){
					Document almDoc = DOMUtil.getDocument(almProjFile);
					Element[] projectElements = XPathUtil.selectElements(almDoc.getDocumentElement(), "./project[@almtype='Redmine']");
					for (Element ele : projectElements) {
						projectIds.add(Integer.valueOf(ele.getAttribute("id")));
					}
				}
				for (Project project : projectList) {
					Integer parentId = project.getParentId();
					if(parentId == null){
						if(projectIds.contains(project.getId())){
							projectEle = DOMUtil.createElement(PROJECT, projectsRoot);
							getProjectEle(project, projectEle);
						}
		    		} else {
		    			if(oldPID.intValue() != parentId.intValue() && projectEle != null){
		    				oldPID = parentId;
			    			List<Project> modules = getSubProjects(parentId);
			    			if(oldPID.intValue() != parentId.intValue()){
			    				projectEle = DOMUtil.createElement(PROJECT, projectsRoot);
			    			}
			    			for (Project module : modules) {
								Element moduleElement = DOMUtil.createElement(MODULE, projectEle);
								getProjectEle(module, moduleElement);
							}
		    			}
		    		}
					if(projectIds.contains(project.getId())){
						DOMUtil.appendToChildren(projectEle, projectsRoot);
					}
				}
			}
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException saxe) {
			LOG.error(saxe.getMessage(), saxe);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REDMINEATHENTICATIONFAILED.getCode(), ExceptionCode.REDMINEATHENTICATIONFAILED.getDescription());
		} catch (XPathExpressionException xee) {
			LOG.error(xee.getMessage(), xee);
			throw new RabitServicesException(ExceptionCode.XPATHEXCEPTION.getCode(), ExceptionCode.XPATHEXCEPTION.getDescription());
		}
		DOMUtil.writeToFile(projectsRoot, "redmineProjects.xml", "yes");
		if(LOG.isDebugEnabled()){
			DOMUtil.writeToFile(projectsRoot, Constants.RABIT_HOME + File.separator + orgName + File.separator + "redmineProjects.xml", "yes");
		}
		return projectsRoot;
	}
	
	private Element getProjectTrackers(Project project, Element parentEle){
		List<Tracker> issueTypes = project.getTrackers();
		Element issueTypesEle = null;
		if(issueTypes != null){
			issueTypesEle = DOMUtil.createElement("issuetypes", parentEle);
			for (Tracker tracker : issueTypes) {
				Element issueTypeEle = DOMUtil.createElement("issuetype", issueTypesEle);
				DOMUtil.setAttribute(issueTypeEle, "name", tracker.getName());
				DOMUtil.setAttribute(issueTypeEle, "id", tracker.getId()+"");
			}
		}
		return issueTypesEle;
	}
	
	private Element getProjectEle(Project project, Element projEle){
		DOMUtil.setAttribute(projEle, "id", project.getId()+"");
		DOMUtil.setAttribute(projEle, "key", project.getIdentifier()+"");
		DOMUtil.setAttribute(projEle, "name", project.getName()+"");
		DOMUtil.setAttribute(projEle, "parentid", project.getParentId()+"");
		return projEle;
	}
	
	private static List<Project> getSubProjects(int projectId) throws RabitServicesException{
		List<Project> subProjList = null;
		try {
			List<Project> projects = redmineMgr.getProjects();
			subProjList = new ArrayList<>();
			for (Project project : projects) {
				Integer parentId = project.getParentId();
				if(parentId != null && parentId == projectId){
					subProjList.add(project);
				}
			}
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REDMINEATHENTICATIONFAILED.getCode(), ExceptionCode.REDMINEATHENTICATIONFAILED.getDescription());
		}
		return subProjList;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getRequirementsByProject(java.lang.String, java.lang.String)
	 */
	@Override
	public Object getRequirementsByProject(String orgName, String projectKey) throws RabitServicesException {
		Document projReqDoc = null;
		Element rootEle = null;
		try {
			projReqDoc = DOMUtil.getDocument("<root/>");
			rootEle = projReqDoc.getDocumentElement();
			Element projectEle = DOMUtil.createElement(PROJECT, rootEle);
			Project project = redmineMgr.getProjectByKey(projectKey);
			int projectID = project.getId();
			String projectName = project.getName();
			List<Project> modules = getSubProjects(projectID);
			List<Issue> issueList = null;
			for (Project module : modules) {
				Element moduleNode = DOMUtil.createElement(MODULE, projectEle);
				String subProjName = module.getName();
	        	moduleNode.setAttribute("name", module.getName());
	        	moduleNode.setAttribute("id", module.getId()+"");
	        	issueList = redmineMgr.getIssues(module.getIdentifier(), null);
	        	getRequirementsElement(issueList, moduleNode, subProjName);
			}
			issueList = redmineMgr.getIssues(projectKey, null);
			getRequirementsElement(issueList, projectEle, projectName);
		}catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException saxe) {
			LOG.error(saxe.getMessage(), saxe);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REDMINEATHENTICATIONFAILED.getCode(), ExceptionCode.REDMINEATHENTICATIONFAILED.getDescription());
		}
		DOMUtil.writeToFile(rootEle, "redminereq.xml", "yes");
		if(LOG.isDebugEnabled()){
			DOMUtil.writeToFile(rootEle, Constants.RABIT_HOME + File.separator + orgName + File.separator + "redminereq.xml", "yes");
		}
		return rootEle;
	}
	
	private Element getRequirementsElement(List<Issue> issueList, Element projectEle, String projectName){
		Element reqEle = DOMUtil.createElement("requirements", projectEle);
		for (Issue issue : issueList) {
    		String issueType = issue.getTracker().getName();
    		if(issueType.equalsIgnoreCase("Feature") && issue.getProject().getName().equalsIgnoreCase(projectName)){
    			Element requirement = DOMUtil.createElement("requirement", reqEle);
    			requirement.setAttribute("id", issue.getId()+"");
				requirement.setAttribute("name", issue.getSubject());
    		}
		}
		return reqEle;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getIssuesByProject(java.lang.String, java.lang.String)
	 */
	@Override
	public Object getIssuesByProject(String orgName, String projectKey) throws RabitServicesException {
		Document projReqDoc = null;
		Element rootEle = null;
		try {
			projReqDoc = DOMUtil.getDocument("<root/>");
			rootEle = projReqDoc.getDocumentElement();
			Element projectEle = DOMUtil.createElement(PROJECT, rootEle);
			Project project = redmineMgr.getProjectByKey(projectKey);
			int projectID = project.getId();
			String projectName = project.getName();
			List<Project> modules = getSubProjects(projectID);
			List<Issue> issueList = null;
			for (Project module : modules) {
				Element moduleNode = DOMUtil.createElement(MODULE, projectEle);
				String subProjName = module.getName();
	        	moduleNode.setAttribute("name", subProjName);
	        	moduleNode.setAttribute("id", module.getId()+"");
	        	issueList = redmineMgr.getIssues(module.getIdentifier(), null);
	        	getIssuesElement(issueList, moduleNode, subProjName);
			}
			issueList = redmineMgr.getIssues(projectKey, null);
			getIssuesElement(issueList, projectEle, projectName);
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException saxe) {
			LOG.error(saxe.getMessage(), saxe);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REDMINEATHENTICATIONFAILED.getCode(), ExceptionCode.REDMINEATHENTICATIONFAILED.getDescription());
		}
		DOMUtil.writeToFile(rootEle, "redmineissues.xml", "yes");
		if(LOG.isDebugEnabled()){
			DOMUtil.writeToFile(rootEle, Constants.RABIT_HOME + File.separator + orgName + File.separator + "redmineissues.xml", "yes");
		}
		return rootEle;
	}
	
	private Element getIssuesElement(List<Issue> issueList, Element projectEle, String projectName){
		Element issuesEle = DOMUtil.createElement("issues", projectEle);
		for (Issue issue : issueList) {
    		String issueType = issue.getTracker().getName();
    		if((issueType.equalsIgnoreCase("Bug") || issueType.equalsIgnoreCase("Defect")) && issue.getProject().getName().equalsIgnoreCase(projectName)){
    			Element issueEle = DOMUtil.createElement("issue", issuesEle);
    			issueEle.setAttribute("id", issue.getId()+"");
    			issueEle.setAttribute("subject", issue.getSubject());
    			issueEle.setAttribute("type", issue.getTracker().getName());
    			issueEle.setAttribute("priority", issue.getPriorityText());
    			issueEle.setAttribute("createdby", issue.getAuthor().getFullName());
    			issueEle.setAttribute("status", issue.getStatusName());
    		}
		}
		return issuesEle;
	}
	
	private Element getAllIssuesElement(List<Issue> issueList, Element projectEle, String projectName){
		Element issuesEle = DOMUtil.createElement("issues", projectEle);
		for (Issue issue : issueList) {
    		if(issue.getProject().getName().equalsIgnoreCase(projectName)){
    			Element issueEle = DOMUtil.createElement("issue", issuesEle);
    			issueEle.setAttribute("id", issue.getId()+"");
    			issueEle.setAttribute("subject", issue.getSubject());
    			issueEle.setAttribute("type", issue.getTracker().getName());
    			issueEle.setAttribute("priority", issue.getPriorityText());
    			issueEle.setAttribute("createdby", issue.getAuthor().getFullName());
    			issueEle.setAttribute("status", issue.getStatusName());
    		}
		}
		return issuesEle;
	}
	
	public Element getAllIssuesByProject(String orgName, String projectKey) throws RabitServicesException{
		Document projectDoc = null;
		Element projectEle = null;
		try {
			projectDoc = DOMUtil.getDocument("<project/>");
			projectEle = projectDoc.getDocumentElement();
			List<Issue> issueList = redmineMgr.getIssues(projectKey, null);
			getAllIssuesElement(issueList, projectEle, redmineMgr.getProjectByKey(projectKey).getName());
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException saxe) {
			LOG.error(saxe.getMessage(), saxe);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REDMINEATHENTICATIONFAILED.getCode(), ExceptionCode.REDMINEATHENTICATIONFAILED.getDescription());
		} 
		return projectEle;
	}
	
	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#createIssues(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public String createIssues(String orgName, String projectKey, String issueType, String subject, String description, String status, String priority) throws RabitServicesException {
		Issue newIssue = new Issue();
		newIssue.setSubject(subject);
		newIssue.setDescription(description);
		newIssue.setTracker(new Tracker(1, issueType));
		newIssue.setStatusName(status);
		newIssue.setPriorityId(Integer.parseInt(priority)); // Need to verify priority is integer.
		try {
			return redmineMgr.createIssue(projectKey, newIssue).getId()+"";
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(re.getMessage(), re);
		}
	}
	
	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getTaskManagementSummary(java.lang.String, java.lang.String)
	 */
	@Override
	public Object getTaskManagementSummary(String orgName) throws RabitServicesException {
		Document document = null;
		Element rootEle = null;
		try {
			document = DOMUtil.getDocument("<taskmanagement/>");
			rootEle = document.getDocumentElement();
			Element project = null;
			if(redmineMgr != null){
				List<Project> projectList = redmineMgr.getProjects();
				List<Issue> issueList = null;
				Integer oldPID = 0;
				for (Project redmineProject : projectList) {
					Integer parentId = redmineProject.getParentId();
					if(parentId == null){
						project = DOMUtil.createElement(PROJECT, rootEle);
						getProjectEle(redmineProject, project);
						getProjectTrackers(redmineMgr.getProjectByKey(redmineProject.getIdentifier()), project);
						issueList = redmineMgr.getIssues(redmineProject.getIdentifier(), null);
						getAllIssuesElement(issueList, project, redmineProject.getName());
		    		} else {
		    			if(oldPID.intValue() != parentId.intValue() && project != null){
		    				oldPID = parentId;
			    			List<Project> modules = getSubProjects(parentId);
			    			if(oldPID.intValue() != parentId.intValue()){
			    				project = DOMUtil.createElement(PROJECT, rootEle);
			    			}
			    			for (Project module : modules) {
								Element moduleElement = DOMUtil.createElement(MODULE, project);
								getProjectEle(module, moduleElement);
								getProjectTrackers(redmineMgr.getProjectByKey(module.getIdentifier()), moduleElement);
								issueList = redmineMgr.getIssues(module.getIdentifier(), null);
								getAllIssuesElement(issueList, moduleElement, module.getName());
							}
		    			}
		    		}
		    		DOMUtil.appendToChildren(project, rootEle);
				}
			}
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException saxe) {
			LOG.error(saxe.getMessage(), saxe);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REDMINEATHENTICATIONFAILED.getCode(), ExceptionCode.REDMINEATHENTICATIONFAILED.getDescription());
		} 
		DOMUtil.writeToFile(rootEle, "redminesummary.xml", "yes");
		if(LOG.isDebugEnabled()){
			DOMUtil.writeToFile(rootEle, Constants.RABIT_HOME + File.separator + orgName + File.separator + "redminesummary.xml", "yes");
		}
    	return rootEle;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#createUsers()
	 */
	@Override
	public String createUsers(String orgName, Element sysEle) throws RabitServicesException {
		try {
			String projectKey = (sysEle.hasAttribute("projectkey")) ? sysEle.getAttribute("projectkey") : "";
			if(projectKey.equalsIgnoreCase("")){
				return Messages.ALM_PROJECT_KEY;
			}
			Element [] usersEle = XPathUtil.selectElements(sysEle, "./user");
			for (Element userElement : usersEle) {
				com.rabit.admin.User user = new UserController().getUser(orgName, userElement.getAttribute("email"));
				if(user != null){
					String userEmail = user.getEmail();
					String loginName = userEmail.split("@")[0];
					User newUser = new User();
					newUser.setLogin(loginName);
					newUser.setFirstName(user.getFirstName());
					newUser.setLastName(user.getLastName());
					newUser.setMail(userEmail);
					newUser.setPassword("rabit@123");
					redmineMgr.createUser(newUser);
					Membership memberShip = new Membership();
					memberShip.setProject(redmineMgr.getProjectByKey(projectKey));
					memberShip.setUser(newUser);
					redmineMgr.addMembership(memberShip);
				}
				
			}
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REDMINEATHENTICATIONFAILED.getCode(), ExceptionCode.REDMINEATHENTICATIONFAILED.getDescription());
		} catch (XPathExpressionException xee) {
			LOG.error(xee.getMessage(), xee);
			throw new RabitServicesException(ExceptionCode.XPATHEXCEPTION.getCode(), ExceptionCode.XPATHEXCEPTION.getDescription());
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#createProjects(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public Object createProjects(String orgName, String projectName, String projDesc) throws RabitServicesException {
		Document projectDoc = null;
		Element rootEle = null;
		Element projectEle = null;
		Project project = new Project();
		project.setName(projectName);
		String identifier = projectName.replace(".", "-").toLowerCase();
		identifier = identifier.replace(" ", "-");
		project.setIdentifier(identifier);
		if(projDesc != null && !projDesc.trim().equalsIgnoreCase("")){
			project.setDescription(projDesc);
		} else {
			project.setDescription(projectName);
		}
		Project newProject;
		try {
			newProject = redmineMgr.createProject(project);
			if(newProject != null){
				projectDoc = DOMUtil.getDocument("<almprojects/>");
				rootEle = projectDoc.getDocumentElement();
				projectEle = DOMUtil.createElement(PROJECT, rootEle);
				projectEle.setAttribute("id", String.valueOf(newProject.getId()));
				projectEle.setAttribute("key", String.valueOf(newProject.getIdentifier()));
				projectEle.setAttribute("name", newProject.getName());
				projectEle.setAttribute("almtype", "Redmine");
			}
			File almProjFile = new File(FilePaths.getALMProjectsFilePath(orgName));
			if(almProjFile.exists()){
				Document almDoc = DOMUtil.getDocument(almProjFile);
				Element rootElement = almDoc.getDocumentElement();
				DOMUtil.importAndAppend(projectEle, rootElement);
				DOMUtil.writeToFile(rootElement, almProjFile.getAbsolutePath(), "yes");
			}else{
				DOMUtil.writeToFile(rootEle, almProjFile.getAbsolutePath(), "yes");
			}
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException saxe) {
			LOG.error(saxe.getMessage(), saxe);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(ExceptionCode.REDMINEATHENTICATIONFAILED.getCode(), ExceptionCode.REDMINEATHENTICATIONFAILED.getDescription());
		} 
		return rootEle;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getGroups(java.lang.String)
	 */
	@Override
	public Object getGroups() {
		Gson gson = new Gson();
		try {
			List<Group> groups = redmineMgr.getGroups();
			gson.toJson(groups);
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
		}
		return gson;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getRoles(java.lang.String)
	 */
	@Override
	public Object getRoles() throws RabitServicesException {
		Document rolesDoc = null;
		Element rolesRoot = null;
		try {
			List<Role> roles = redmineMgr.getRoles();
			LOG.info("Roles Invoked.");
			if(!roles.isEmpty()){
				rolesDoc = DOMUtil.getDocument("<roles/>");
				rolesRoot = rolesDoc.getDocumentElement();
			}
			for (Role role : roles) {
				Element roleEle = DOMUtil.createElement("role", rolesRoot);
				DOMUtil.setAttribute(roleEle, "name", role.getName());
				DOMUtil.setAttribute(roleEle, "id", role.getId()+"");
			}
		}catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(pce.getMessage(), pce);
		} catch (SAXException saxe) {
			LOG.error(saxe.getMessage(), saxe);
			throw new RabitServicesException(saxe.getMessage(), saxe);
		} catch (IOException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ie.getMessage(), ie);
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(re.getMessage(), re);
		}
		return rolesRoot;
	}

	@Override
	public Object getPriorities(String projectKey) throws RabitServicesException {
		Element rootEle = null;
		try {
			WorkItemPriorities priorities = new WorkItemPriorities();
			WorkItemPriority priority = null;
			ArrayList<WorkItemPriority> prioritiesList = new ArrayList<>();
			List<IssuePriority> redminePriorities = redmineMgr.getIssuePriorities();
			for (IssuePriority itemPriority : redminePriorities) {
				priority = new WorkItemPriority();
				priority.setId(String.valueOf(itemPriority.getId()));
				priority.setName(itemPriority.getName());
				prioritiesList.add(priority);
			}
			priorities.setPriorities(prioritiesList);
			rootEle = JAXBUtils.getXMLObject(priorities, WorkItemPriorities.class);
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(re.getMessage(), re);
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
		return rootEle;
	}

	@Override
	public Object getStatuses(String projectKey, String workItemType) throws RabitServicesException {
		Element rootEle = null;
		try {
			List<IssueStatus> redmineStatus = redmineMgr.getStatuses();
			WorkItemStatuses statuses = new WorkItemStatuses();
			WorkItemStatus status = null;
			ArrayList<WorkItemStatus> statusesList = new ArrayList<>();
			for (IssueStatus itemStatus : redmineStatus) {
				status = new WorkItemStatus();
				String statusName = itemStatus.getName();
				status.setId(String.valueOf(itemStatus.getId()));
				status.setName(statusName);
				if(statusName.equalsIgnoreCase("Defined")){
					status.setType("Default");
				}
				statusesList.add(status);
			}
			statuses.setStatuses(statusesList);
			rootEle = JAXBUtils.getXMLObject(statuses, WorkItemStatuses.class);
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(re.getMessage(), re);
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
		return rootEle;
	}	
	
	@Override
	public Object getWorkItemTypes(String projectKey) throws RabitServicesException {
		Element rootEle = null;
		try {
			WorkItemTypes itemTypes = new WorkItemTypes();
			WorkItemType itemType = null;
			ArrayList<WorkItemType> itemTypeList = new ArrayList<>();
			List<Tracker> redmineIssueTypes = redmineMgr.getProjectByKey(projectKey).getTrackers();
			for (Tracker trankerType : redmineIssueTypes) {
				itemType = new WorkItemType();
				itemType.setId(String.valueOf(trankerType.getId()));
				itemType.setName(trankerType.getName());
				itemTypeList.add(itemType);
			}
			itemTypes.setWorkitemtypes(itemTypeList);
			rootEle = JAXBUtils.getXMLObject(itemTypes, WorkItemTypes.class);
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException sae) {
			LOG.error(sae.getMessage(), sae);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException ioe) {
			LOG.error(ioe.getMessage(), ioe);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(re.getMessage(), re);
		} catch (JAXBException jaxbe) {
			LOG.error(jaxbe.getMessage(), jaxbe);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		}
		return rootEle;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.IConnectors#getAllWorkItems(java.lang.String)
	 */
	@Override
	public Object getAllWorkItems(String projectKey, QueryParams queryParams) throws RabitServicesException {
		Document projectDoc = null;
		Element projectEle = null;
		try {
			projectDoc = DOMUtil.getDocument("<project/>");
			projectEle = projectDoc.getDocumentElement();
			List<Issue> issueList = redmineMgr.getIssues(projectKey, null);
			getAllIssuesElement(issueList, projectEle, redmineMgr.getProjectByKey(projectKey).getName());
		} catch (ParserConfigurationException pce) {
			LOG.error(pce.getMessage(), pce);
			throw new RabitServicesException(pce.getMessage(), pce);
		} catch (SAXException saxe) {
			LOG.error(saxe.getMessage(), saxe);
			throw new RabitServicesException(saxe.getMessage(), saxe);
		} catch (IOException ie) {
			LOG.error(ie.getMessage(), ie);
			throw new RabitServicesException(ie.getMessage(), ie);
		} catch (RedmineException re) {
			LOG.error(re.getMessage(), re);
			throw new RabitServicesException(re.getMessage(), re);
		}
		return projectEle;
	}

	/* (non-Javadoc)
	 * @see com.rabit.connectors.RMConnector#updateWorkItemStatus(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public String updateWorkItemStatus(String orgName,String labelName, String projectKey, String workItemId, String status,String comment, Logger LOG) {
		return null;
	}

	@Override
	public Object getPlannedForList(String projectKey, QueryParams queryParams)
			throws RabitServicesException {
		return null;
	}

	@Override
	public String testConnection(String url,String userName,String password, Logger LOG) throws RabitServicesException {
		return null;
	}

	@Override
	public Object getAllStatuses(String projId) throws RabitServicesException {
		return null;
	}

	@Override
	public Object getworkItem(String orgName,String labelName,String workItemId,String projectId) throws RabitServicesException {
		// TODO Auto-generated method stub
		return null;
	}	
	
}
