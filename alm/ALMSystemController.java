package com.rabit.alm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

import org.apache.log4j.Logger;
import org.xml.sax.SAXException;

import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper.FailedBatch;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBQueryExpression;
import com.amazonaws.services.dynamodbv2.datamodeling.PaginatedQueryList;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.ComparisonOperator;
import com.amazonaws.services.dynamodbv2.model.Condition;
import com.rabit.admin.CredentialsController;
import com.rabit.admin.UserALM;
import com.rabit.aws.util.AWSConnectionUtil;
import com.rabit.controllers.UserPermissionController;
import com.rabit.errorcodes.ErrorCodeMessages;
import com.rabit.errorcodes.ErrorMessages;
import com.rabit.errorcodes.ExceptionCode;
import com.rabit.main.Messages;
import com.rabit.project.alms.ALMNames;
import com.rabit.service.ws.exception.RabitServicesException;
import com.rabit.util.PasswordUtil;
import com.rabit.util.Validator;
import com.rabit.util.jaxb.JAXBUtils;
import com.rabit.util.xml.DOMUtil;
/**
 * 
 * @author Ramesh.M
 *
 */
public class ALMSystemController {
	private String orgName;
	private String userId;
	private Logger logger;
	public ALMSystemController(String orgName,String userId,Logger logger) {
		this.orgName = orgName;
		this.userId = userId;
		this.logger = logger != null ? logger:Logger.getLogger(ALMSystemController.class);
	}
	/**
	 * 
	 * @param labelName
	 * @return
	 */
	public String getalmTypewithLabelName(String labelName){
		String almType = null;
		ALMSystem almSystem = getALMSystemofLabel(labelName);
		if(almSystem != null){
			almType  = almSystem.getType();
		}
		return almType;
	}
	
	
	/***
	 * 
	 * @param almSystems
	 * @return
	 */
	public String saveALMSystem(ALMSystem almSystem) {
		String message = "";
		if(almSystem != null){
			almSystem.setOrgName(orgName);
			DynamoDBMapper dbMapper = AWSConnectionUtil.getDynamoDBMapper();
			if(Validator.isNotNullorEmpty(almSystem.getLabelName())){
				almSystem.setLabelkey(almSystem.getLabelName().toLowerCase());
			}
			dbMapper.save(almSystem);
			message = Messages.ALMSYSTEM_SAVE_SUCCESS;
			logger.info("ALM system saved successfully.");
			saveALMinMyProfile(almSystem);
		}
		return message;
	}
	/**
	 * 
	 * @param almSystems
	 */
	public void saveALMinMyProfile(ALMSystem almSystem){
		CredentialsController credentialsController = new CredentialsController(orgName, userId, logger);
			List<UserALM> userALMList = new ArrayList<>();
			UserALM userALM = null;
			if(almSystem != null) {
				if(ALMNames.autorabit.getAlmName().equalsIgnoreCase(almSystem.getType()) || credentialsController.getDecrytedCredential(almSystem.getAccessKey()) != null){
					userALM = new UserALM();
					userALM.setAccessKey(almSystem.getAccessKey());
					userALM.setOrgName(orgName);
					userALM.setUserId(userId);
					userALM.setLabelName(almSystem.getLabelName());
					userALM.setKey(userId+"_"+almSystem.getLabelName());
					userALM.setAlmNames(ALMNames.valueOf(almSystem.getType()));
					userALMList.add(userALM);
				}else{
					logger.error("credentialkey not exist in credential table:"+almSystem.getAccessKey());
				}
			}
			if(!userALMList.isEmpty()) {
				UserPermissionController userPermissionController = new UserPermissionController(orgName, userId, logger);
				userPermissionController.saveUserALMList(userALMList);
			}
	}
	
	/**
	 * 
	 * @return
	 */
	public List<ALMSystem> getALMSystems(){
		DynamoDBMapper dbMapper = AWSConnectionUtil.getDynamoDBMapper();
		DynamoDBQueryExpression<ALMSystem> queryExpression = new DynamoDBQueryExpression<>();
		queryExpression.setHashKeyValues(new ALMSystem().setOrgName(orgName));
		return dbMapper.query(ALMSystem.class, queryExpression);
	}
	/**
	 * 
	 * @return
	 * @throws RabitServicesException
	 */
	public Object getALMSystemsEle() throws RabitServicesException {
		try {
			ALMSystems almSystems = null;
			String returnString = null;
			List<ALMSystem> almSystemList = getALMSystems();
			if(almSystemList != null && !almSystemList.isEmpty()) {
				almSystems = new ALMSystems();
				ArrayList<ALMSystem> list = new ArrayList<>();
				list.addAll(almSystemList);
				almSystems.setAlmSystemList(almSystemList);
			}
			returnString = almSystems != null ? DOMUtil.getXMLString(JAXBUtils.getXMLObject(almSystems, ALMSystems.class).getFirstChild()):ErrorMessages.ALMSYSTEM_NOT_EXIST;
			return PasswordUtil.getBase64EncodeWithSalt(returnString);
		} catch (JAXBException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		} catch (ParserConfigurationException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (TransformerException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.TRANSFORMEXCEPTION.getCode(), ExceptionCode.TRANSFORMEXCEPTION.getDescription());
		}
	}
	/**
	 * 
	 * @param labelName
	 * @return
	 */
	public UserALM getUserALM(String labelName){
		DynamoDBMapper dbMapper = AWSConnectionUtil.getDynamoDBMapper();
		return dbMapper.load(UserALM.class,orgName,userId+"_"+labelName);
	}
	/**
	 * 
	 * @param labelName
	 * @return
	 */
	public ALMSystem getALMSystemofLabel(String labelName){
		DynamoDBMapper dbMapper = AWSConnectionUtil.getDynamoDBMapper();
		return dbMapper.load(ALMSystem.class,orgName,labelName);
	}
	/**
	 * 
	 * @param almSystemList
	 * @param userALMs
	 * @return
	 */
	public List<ALMSystem> mappedalmSystemList(List<ALMSystem> almSystemList,List<UserALM> userALMs){
		if(almSystemList != null && !almSystemList.isEmpty()){
			for (ALMSystem almSystem : almSystemList) {
				almSystem.setAccessKey("");
				almSystem.setmapped(false);
				if(userALMs != null && !userALMs.isEmpty()){
					for (UserALM userALM : userALMs) {
						if(almSystem.getLabelName().equalsIgnoreCase(userALM.getLabelName()) && (ALMNames.autorabit.getAlmName().equalsIgnoreCase(almSystem.getType()) || Validator.isNotNullorEmpty(userALM.getAccessKey()))){
							almSystem.setAccessKey(userALM.getAccessKey()!=null?userALM.getAccessKey():"");
							almSystem.setmapped(true);
						}
					}
				}
			}
		}
		return almSystemList;
	}
	
	/**
	 * 
	 * @return
	 */
	public Object getUsersMappedALMsEle(){
		String almsystemEle = null;
		List<UserALM> userALMs = getUserALMs();
		List<ALMSystem> almSystemList = getALMSystems();
		ALMSystems almSystems = new ALMSystems();
		almSystemList = mappedalmSystemList(almSystemList,userALMs);
		if(almSystemList != null && !almSystemList.isEmpty()){
			almSystems.setAlmSystemList(almSystemList);
			try {
				almsystemEle = DOMUtil.getXMLString(JAXBUtils.getXMLObject(almSystems, ALMSystems.class).getFirstChild());
			} catch (TransformerException | JAXBException | ParserConfigurationException | SAXException
					| IOException e) {
				logger.error(e.getMessage());
			}
		}
		if(Validator.isNotNullorEmpty(almsystemEle)){
			almsystemEle =  PasswordUtil.getBase64EncodeWithSalt(almsystemEle);
		}
		return almsystemEle;
	}
	/**
	 * 
	 * @return
	 */
	public List<UserALM> getUserALMs(){
		DynamoDBMapper dbMapper = AWSConnectionUtil.getDynamoDBMapper();
		DynamoDBQueryExpression<UserALM> queryExpression = new DynamoDBQueryExpression<>();
		queryExpression.setHashKeyValues(new UserALM().setOrgName(orgName));
		queryExpression.withQueryFilterEntry("userId", new Condition().withComparisonOperator(ComparisonOperator.EQ).withAttributeValueList(new AttributeValue().withS(userId)));
		return dbMapper.query(UserALM.class, queryExpression);
	}
	
	public List<UserALM> getUserALMsforLabel(String labelName){
		DynamoDBMapper dbMapper = AWSConnectionUtil.getDynamoDBMapper();
		DynamoDBQueryExpression<UserALM> queryExpression = new DynamoDBQueryExpression<>();
		queryExpression.setHashKeyValues(new UserALM().setOrgName(orgName));
		queryExpression.withQueryFilterEntry("labelName", new Condition().withComparisonOperator(ComparisonOperator.EQ).withAttributeValueList(new AttributeValue().withS(labelName)));
		return dbMapper.query(UserALM.class, queryExpression);
	}
	
	/**
	 * 
	 * @param almLabel
	 * @return
	 */
	public boolean isALMLabelExists(String almLabel) {
		boolean isLabelExist = true;
		DynamoDBMapper dbMapper = AWSConnectionUtil.getDynamoDBMapper();
		DynamoDBQueryExpression<ALMSystem> queryExpression = new DynamoDBQueryExpression<>();
		queryExpression.setHashKeyValues(new ALMSystem().setOrgName(orgName));
		queryExpression.withQueryFilterEntry("labelkey", new Condition().withComparisonOperator(ComparisonOperator.EQ).withAttributeValueList(new AttributeValue().withS(almLabel.toLowerCase())));
		PaginatedQueryList<ALMSystem> almSystems = dbMapper.query(ALMSystem.class, queryExpression);
		if( almSystems == null || almSystems.isEmpty()) {
			isLabelExist = false;
		}
		return isLabelExist;			
	}
	private String batchDelete(List<?> list) {
		StringBuilder message = new StringBuilder();
		if(list != null && !list.isEmpty()){
			logger.info("Deleting batch for " + list.get(0).getClass().getSimpleName() + " with size:" + list.size());
			List<FailedBatch> failedBatches = AWSConnectionUtil.getDynamoDBMapper().batchDelete(list);
			if (!failedBatches.isEmpty()) {
				for (FailedBatch failedBatch : failedBatches) {
					message.append(failedBatch.getException());
				}
			} else {
				message.append(Messages.SUCCESS);
			}
			logger.info(message);
		}
		return message.toString();
	}
	/**
	 * 
	 * @param almLabel
	 * @return
	 */
	public String deleteALMSystem(String almLabel) {
		DynamoDBMapper dbMapper = AWSConnectionUtil.getDynamoDBMapper();
		ALMSystem almSystem = dbMapper.load(ALMSystem.class, orgName, almLabel);
		String message = null;
		if(almSystem != null) {
			ALMSystem almLabelNode = new ALMSystem();
			almLabelNode.setOrgName(orgName);
			almLabelNode.setLabelName(almLabel);
			dbMapper.delete(almLabelNode);
			List<UserALM> userALMs = getUserALMsforLabel(almLabel);
			batchDelete(userALMs);
			message = Messages.SUCCESS;
		}else{
			message = ErrorMessages.ALMSYSTEM_NOT_EXIST;	
		}
		return message;			
	}
	/**
	 * 
	 * @param almType
	 * @return
	 */
	public List<ALMSystem> getALMSystemsbyType(String almType){
		DynamoDBMapper dbMapper = AWSConnectionUtil.getDynamoDBMapper();
		DynamoDBQueryExpression<ALMSystem> almQueryExpression = new DynamoDBQueryExpression<>();
		almQueryExpression.setHashKeyValues(new ALMSystem().setOrgName(orgName));
		almQueryExpression.withQueryFilterEntry("type", new Condition().withComparisonOperator(ComparisonOperator.EQ).withAttributeValueList(new AttributeValue().withS(almType)));
		return dbMapper.query(ALMSystem.class, almQueryExpression);
	}
	
	/**
	 * 
	 * @param almType
	 * @return
	 * @throws RabitServicesException
	 */
	public Object getALMSystemsbyTypeEle(String almType) throws RabitServicesException {
		try {
			ALMSystems almSystems = null;
			String returnString = null;
			List<ALMSystem> almSystemList = getALMSystemsbyType(almType);
			if(almSystemList != null && !almSystemList.isEmpty()) {
				almSystems = new ALMSystems();
				ArrayList<ALMSystem> list = new ArrayList<>();
				list.addAll(almSystemList);
				almSystems.setAlmSystemList(almSystemList);
			}
			returnString =	almSystems!=null?DOMUtil.getXMLString(JAXBUtils.getXMLObject(almSystems, ALMSystems.class).getFirstChild()):ErrorMessages.ALMSYSTEM_NOT_EXIST;
			return PasswordUtil.getBase64EncodeWithSalt(returnString);
		} catch (JAXBException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.JAXBEXCEPTION.getCode(), ExceptionCode.JAXBEXCEPTION.getDescription());
		} catch (ParserConfigurationException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.PARSEREXCEPTION.getCode(), ExceptionCode.PARSEREXCEPTION.getDescription());
		} catch (SAXException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.SAXEXCEPTION.getCode(), ExceptionCode.SAXEXCEPTION.getDescription());
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.IOEXCEPTION.getCode(), ExceptionCode.IOEXCEPTION.getDescription());
		} catch (TransformerException e) {
			logger.error(e.getMessage(), e);
			throw new RabitServicesException(ExceptionCode.TRANSFORMEXCEPTION.getCode(), ExceptionCode.TRANSFORMEXCEPTION.getDescription());
		}
	}
}
