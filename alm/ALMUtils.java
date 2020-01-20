package com.rabit.alm;

import org.apache.log4j.Logger;
import org.w3c.dom.Element;

import com.rabit.admin.Credential;
import com.rabit.admin.CredentialsController;
import com.rabit.admin.CredentialsType;
import com.rabit.admin.SalesforceVCALMMapping;
import com.rabit.admin.UserALM;
import com.rabit.connectors.ConnectorManager;
import com.rabit.connectors.ConnectorTypes;
import com.rabit.connectors.RMConnector;
import com.rabit.main.Constants;
import com.rabit.main.Messages;
import com.rabit.scm.SCMTypes;
import com.rabit.service.ws.exception.RabitServicesException;
import com.rabit.util.CommonClass;
import com.rabit.util.Validator;
import com.rabit.util.xml.DOMUtil;
/**
 * 
 * @author ramesh.m
 *
 */

public class ALMUtils {
	private static final Logger LOG = Logger.getLogger(ALMUtils.class);
	private String orgName;
	private String userEmail;
	private String almlabelName;
	private String revisonNum;
	private Element ezcommitlabelEle= null;
	private Element prevalidationEle= null;
	private String commitMsg;
	private SalesforceVCALMMapping salesforceVCALMMapping;
	
	public ALMUtils(String orgName,String userEmail,String almlabelName){
		this.orgName = orgName;
		this.userEmail = userEmail;
		this.almlabelName = almlabelName;
	}
	
	public ALMUtils(String orgName,String userEmail,String revisionNum,String comment,SalesforceVCALMMapping salesforceVCALMMapping,Element ezcommitlabelEle,Element prevalidationEle){
		this.orgName = orgName;
		this.userEmail = userEmail;
		this.revisonNum = revisionNum;
		this.commitMsg = comment;
		this.salesforceVCALMMapping = salesforceVCALMMapping;
		this.ezcommitlabelEle = ezcommitlabelEle;
		this.prevalidationEle = prevalidationEle;
	}
	public String getAccesskey(ALMSystem almSystem,String userId){
		String accessKey = null;
		ALMSystemController almSystemController = new ALMSystemController(orgName,userId,LOG);
		UserALM userAlm =almSystemController.getUserALM(almlabelName);
		if(userAlm != null  && Validator.isNotNullorEmpty(userAlm.getAccessKey())){
			accessKey = userAlm.getAccessKey();
			LOG.info("Credential key taken from UserALM:"+userEmail);
		}else if(almSystem != null && Validator.isNotNullorEmpty(almSystem.getAccessKey())){
			accessKey = almSystem.getAccessKey();
			LOG.info("Credential key taken from ALMSystem:"+userEmail);
		}	
		return accessKey;
	}
	
	public ALMLoginDetails getLoginDetails() throws RabitServicesException{
		ALMLoginDetails almLoginDetails = null;
		Credential credential = null;
		String userId = CommonClass.getUserId(orgName, userEmail);
		ALMSystemController almSystemController = new ALMSystemController(orgName,userId,LOG);
		ALMSystem almSystem = almSystemController.getALMSystemofLabel(almlabelName); 
		String accessKey = getAccesskey(almSystem ,userId);
		if(accessKey != null){
			CredentialsController credentialsController = new CredentialsController(orgName, userId, null);
			credential = credentialsController.getDecrytedCredential(accessKey);
			if(credential != null){
				if(credential.getType().equals(CredentialsType.UWP)) {
					almLoginDetails = new ALMLoginDetails();
					almLoginDetails.setUrl(almSystem.getUrl());
					almLoginDetails.setUserName(credential.getUserName());
					almLoginDetails.setPassWord(credential.getPassword());
					if(ConnectorTypes.HPOCTANE.getConnectorType().equalsIgnoreCase(almSystem.getType()))
						almLoginDetails.setsharedSpaceId(almSystem.getSharedspaceid());
				} else {
					LOG.error("CredentialsType is not UWP");
				}
			}else{
				LOG.error("credential is not found for accessKey:"+accessKey);
			}
		}else {
			LOG.error("accesskey is null. not found in useralm and almsystem table for alm LabelName:"+almlabelName);
		}
		return almLoginDetails;
	}
	public String updateWorkitemStatusinALM(String committedMembers) throws RabitServicesException{
		String status = null;
		String prevalidationResult = null;
		Element prevalidationResultEle = null;
		final String tRue = "true";
		final String na = "NA";
		final String rUNAPEXTESTS = "runapextests";
		final String sTATICANALYSIS = "staticanalysis";
		final String vALIDATEDEPLOY = "validatedeploy";
		final String tYPE = "type";
		final String iSSUETYPE = "issuetype";
		final String id = "id";
		if(ezcommitlabelEle != null && salesforceVCALMMapping != null && salesforceVCALMMapping.isALM() && committedMembers != null){
			Element almEle = DOMUtil.getElement(ezcommitlabelEle, "alm");
			String selectedCommitStatus = almEle.getAttribute("commitstatus");
			String commitStatus = selectedCommitStatus != null ? selectedCommitStatus:null;
			StringBuilder commentsb = new StringBuilder();
			//Preparing Comment
			if(ConnectorTypes.JIRA.getConnectorType().equalsIgnoreCase(almEle.getAttribute(tYPE))){
				if(prevalidationEle != null){
					prevalidationResultEle = DOMUtil.getElement(prevalidationEle, "label");
					if(prevalidationResultEle != null){
						prevalidationResult = "Label Name ="+(prevalidationResultEle.hasAttribute("name")?prevalidationResultEle.getAttribute("name"):na);
						prevalidationResult = prevalidationResult+ "\\n Apex Test Results ="+(prevalidationResultEle.hasAttribute(rUNAPEXTESTS) && tRue.equalsIgnoreCase(prevalidationResultEle.getAttribute(rUNAPEXTESTS))?prevalidationResultEle.getAttribute("runapextestsstatus"):na);
						prevalidationResult = prevalidationResult+ "\\n Static Analysis ="+(prevalidationResultEle.hasAttribute(sTATICANALYSIS) && tRue.equalsIgnoreCase(prevalidationResultEle.getAttribute(sTATICANALYSIS))?prevalidationResultEle.getAttribute("staticanalysisstatus"):na);
						prevalidationResult = prevalidationResult+ "\\n Deployment Org ="+(prevalidationResultEle.hasAttribute(vALIDATEDEPLOY) && tRue.equalsIgnoreCase(prevalidationResultEle.getAttribute(vALIDATEDEPLOY))?prevalidationResultEle.getAttribute("destsforgname"):na);
						prevalidationResult = prevalidationResult+ "\\n Validate Deployment ="+(prevalidationResultEle.hasAttribute(vALIDATEDEPLOY) && tRue.equalsIgnoreCase(prevalidationResultEle.getAttribute(vALIDATEDEPLOY))?prevalidationResultEle.getAttribute("validatedeploymentstatus"):na);
						prevalidationResult = prevalidationResult+ "\\n Approved By ="+((prevalidationResultEle.getAttribute(Constants.REVIEWED_BY) != null && !prevalidationResultEle.getAttribute(Constants.REVIEWED_BY).isEmpty())?prevalidationResultEle.getAttribute(Constants.REVIEWED_BY):na);
					}
				}
				commentsb.append("||Message||Committed by||Revision||Committed metadata members||Prevalidation Results");
				commentsb.append("\\n");
				commentsb.append("|"+commitMsg.replace("\"", "")+"|"+userEmail+"|"+revisonNum+"|"+committedMembers+"|"+(prevalidationResult != null?prevalidationResult:na)+"|");
				commentsb.append("\\n");
				commentsb.append(Messages.NA_ABBREVIATION);
			}
			else{
				if(prevalidationEle != null){
					prevalidationResultEle = DOMUtil.getElement(prevalidationEle, "label");
					if(prevalidationResultEle != null){
						prevalidationResult = "Label Name ="+(prevalidationResultEle.hasAttribute("name")?prevalidationResultEle.getAttribute("name"):na);
						prevalidationResult = prevalidationResult+ " Apex Test Results ="+(prevalidationResultEle.hasAttribute(rUNAPEXTESTS) && tRue.equalsIgnoreCase(prevalidationResultEle.getAttribute(rUNAPEXTESTS))?prevalidationResultEle.getAttribute("runapextestsstatus"):na);
						prevalidationResult = prevalidationResult+ " Static Analysis ="+(prevalidationResultEle.hasAttribute(sTATICANALYSIS) && tRue.equalsIgnoreCase(prevalidationResultEle.getAttribute(sTATICANALYSIS))?prevalidationResultEle.getAttribute("staticanalysisstatus"):na);
						prevalidationResult = prevalidationResult+ " Deployment Org ="+(prevalidationResultEle.hasAttribute(vALIDATEDEPLOY) && tRue.equalsIgnoreCase(prevalidationResultEle.getAttribute(vALIDATEDEPLOY))?prevalidationResultEle.getAttribute("destsforgname"):na);
						prevalidationResult = prevalidationResult+ " Validate Deployment ="+(prevalidationResultEle.hasAttribute(vALIDATEDEPLOY) && tRue.equalsIgnoreCase(prevalidationResultEle.getAttribute(vALIDATEDEPLOY))?prevalidationResultEle.getAttribute("validatedeploymentstatus"):na);
						prevalidationResult = prevalidationResult+ " Approved By ="+((prevalidationResultEle.getAttribute(Constants.REVIEWED_BY) != null && !prevalidationResultEle.getAttribute(Constants.REVIEWED_BY).isEmpty())?prevalidationResultEle.getAttribute(Constants.REVIEWED_BY):na);
					}
				}
				commentsb.append("[Message] "+commitMsg);
				commentsb=checkLineSeparatorConnectorType(commentsb,almEle.getAttribute(tYPE));
				commentsb.append("[Revision] "+revisonNum);
				commentsb=checkLineSeparatorConnectorType(commentsb,almEle.getAttribute(tYPE));
				commentsb.append("[Committed by] "+userEmail);
				commentsb=checkLineSeparatorConnectorType(commentsb,almEle.getAttribute(tYPE));
				if(ConnectorTypes.IBMRTC.getConnectorType().equalsIgnoreCase(almEle.getAttribute(tYPE))&&
						SCMTypes.GIT.getSCMType().equalsIgnoreCase(salesforceVCALMMapping.getScmType().getSCMType())){
					commentsb.append("[Url] "+salesforceVCALMMapping.getScmUrl().replace(".git", "/commit/")+revisonNum);
					commentsb.append(System.lineSeparator());
				}
				commentsb.append("[Committed metadata members] "+committedMembers);
				commentsb=checkLineSeparatorConnectorType(commentsb,almEle.getAttribute(tYPE));
				commentsb.append("[Prevalidation Results] "+(prevalidationResult != null?prevalidationResult:na));
				commentsb=checkLineSeparatorConnectorType(commentsb,almEle.getAttribute(tYPE));
				commentsb.append(Messages.NA_ABBREVIATION);
			}
			String workitemID = null;
			if(ConnectorTypes.HPOCTANE.getConnectorType().equalsIgnoreCase(almEle.getAttribute(tYPE))) {
				workitemID = almEle.getAttribute(iSSUETYPE)+","+almEle.getAttribute(id);															
				commitStatus = ("phase."+almEle.getAttribute(iSSUETYPE)+"."+commitStatus.toLowerCase()).toString();
			} else if(ConnectorTypes.RALLY.getConnectorType().equalsIgnoreCase(almEle.getAttribute(tYPE))){
				workitemID = almEle.getAttribute(iSSUETYPE)+","+almEle.getAttribute(id);															
			}else{
				workitemID = almEle.getAttribute(id);
			}
			LOG.info("In updateworkitem status almsystem:"+salesforceVCALMMapping.getAlmName().getAlmName()+" :workitemID::"+workitemID+" commitStatus::"+commitStatus+" and prepared Comment:"+commentsb.toString());
			RMConnector connectors = ConnectorManager.getInstance().getRMConnector(orgName, almEle.getAttribute("almlabel"),userEmail);
			status = connectors.updateWorkItemStatus(orgName, almEle.getAttribute("almlabel"),salesforceVCALMMapping.getProjectKey(), workitemID, commitStatus,commentsb.toString(), LOG);
		}else{
			LOG.info(Constants.AR_DEBUG + "mandatory elements received as null.unable to proceed to update status in ALM");
		}
		return status;
	}
	public StringBuilder checkLineSeparatorConnectorType(StringBuilder sb, String type) {
		if (!ConnectorTypes.PIVOTAL.getConnectorType().equalsIgnoreCase(type))
			sb.append(System.lineSeparator());
		return sb;
	}

}
