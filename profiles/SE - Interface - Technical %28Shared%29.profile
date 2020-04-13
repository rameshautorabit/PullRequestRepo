<?xml version="1.0" encoding="UTF-8"?>
<Profile xmlns="http://soap.sforce.com/2006/04/metadata">
<applicationVisibilities><application>CIS</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>S1_Feedback</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>SE_Sales</application><default>true</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>SE_Sales_Lightning</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>WM4SF3__WalkMe_Setup</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>smagicinteract__SMSMagicInteract</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__AllTabSet</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__AppLauncher</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__Chatter</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__Content</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__Insights</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__LightningInstrumentation</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__LightningSales</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__LightningSalesConsole</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__LightningService</application><default>false</default><visible>true</visible></applicationVisibilities>
<applicationVisibilities><application>standard__Service</application><default>false</default><visible>true</visible></applicationVisibilities>
<classAccesses><apexClass>AvayaConnector__SalesforceDirectory</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>AvayaConnector__SalesforceDirectoryUnitTest</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__APMCreateServiceRequest_UT</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__COMM_FileHandlerUtilities</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__COMM_FileHandlerUtilities_UT</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__COMM_RecordTypeUtilities</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__CONF_ManageIntegration</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__CONF_ManageIntegration_Test</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__CONF_MobFilesConfig</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__CONF_MobFilesConfig_UT</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__INTF_IG_Reconcile</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__INTF_IG_ReconcileMapping</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__INTF_IG_ReconcileMappingObject</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__INTF_IG_Reconcile_Batch</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__INTF_IG_Reconcile_UT</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__INTF_IG_ServiceInterface</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__INTF_IG_Validation_Util</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__INTF_SFDCFilesUtilityServices</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__INTF_SFDCFilesUtilityServices_UT</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__SB_IntegrationExtension</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__SB_IntegrationExtension_UT</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__SB_IntegrationService</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__SB_IntegrationService_UT</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__SLA_Clock_WO_Controller</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__SLA_Clock_WO_Controller_UT</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>SVMXC__WSCH_Plugin_RealTimeOptimizer_UT</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>XactlyCorp__XactlyIncentSettingsController</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>XactlyCorp__XactlyIncentSettingsControllerTest</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>XactlyCorp__XactlyPostInstallClass</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>XactlyCorp__XactlyTabUtilityTest</apexClass><enabled>true</enabled></classAccesses>
<classAccesses><apexClass>XactlyCorp__XactlyTabXMLParserTest</apexClass><enabled>true</enabled></classAccesses>
<custom>true</custom>
<description>Shared profile to be used for any technical integration (API Only).</description>
<fieldPermissions><editable>true</editable><field>Account.SVMXC__SM_External_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ContentVersion.SVMXC__SM_Process_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.BirthDate</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.CanStorePiiElsewhere</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.ChildrenCount</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.ConsumerCreditScore</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.ConsumerCreditScoreProviderName</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.ConvictionsCount</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.DeathDate</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.HasOptedOutGeoTracking</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.HasOptedOutProcessing</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.HasOptedOutProfiling</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.HasOptedOutSolicit</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.HasOptedOutTracking</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.IndividualsAge</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.InfluencerRating</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.IsHomeOwner</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.MasterRecordId</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.MilitaryService</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.Occupation</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.SendIndividualData</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.ShouldForget</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Individual.Website</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Product2.SVMXC__SM_External_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.AbilityUnderstandBusNeeds__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.AreasDev__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.AssociatedCoachingVisit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.AssociatedCustomerVisit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CapacityUseSPINDISCMethods__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.ChangePrevCoaching__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentPrep1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentPrep2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentPrep3__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentPrep4__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentVisit1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentVisit2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentVisit3__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentVisit4__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentVisit5__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentVisit6__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentVisit7__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentVisit8__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CommentVisit9__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.CrossSelling__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.DisCustNeeds__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.GetSolidCommitfromCust__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.GoalSetSMART__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.KnowledgeCust__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.MeetingObjSetVisit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.Negotiation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.ObjectionHandling__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.PrepQuestionObj__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.PresTrueTechCompet__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_CoachingVisitForm__c.REP_CVDateCVFDateDiff__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.SFE_AssociatedCoachingVisit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.SalesRep__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.Strengths__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_CoachingVisitForm__c.VisitwithPlatformIAP__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.AccountLocalName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.AccountOwner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.AssignedTo__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.ClassificationLvl1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Commercial_Plan_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.CustomerProfile__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.DirectSalesPlatforming__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.EndDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.IndirectSalesPlatforming__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.IndivCAP__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.MarketSegment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.MktShare__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.PAMPlaforming__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.PriceSensitivity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Q1CriteriaWeight__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q1OpeSize__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q1Rating__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Q2CriteriaWeight__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q2PowerPrescription__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q2Rating__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Q3CriteriaWeight__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q3PotentialGrowth__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q3Rating__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Q4CriteriaWeight__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q4Rating__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Q5CriteriaWeight__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q5OpenCommRelationshipSE__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q5Rating__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q6CompetitionIntensity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Q6CriteriaWeight__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q6Rating__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Q7CriteriaWeight__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q7ProcessAppKnowledge__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q7Rating__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Q8CriteriaWeight__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q8OfferFit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_PlatformingScoring__c.Q8Rating__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Score__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Stateprovince__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.Street__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_PlatformingScoring__c.ViewAs__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_Potential__c.BusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_Potential__c.PAM__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_Potential__c.PerDirect__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_Potential__c.PerIndirect__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SFE_Potential__c.PerShareWallet__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SFE_Potential__c.SESales__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Code_Snippet__c.SVMXC__SM_Snippet_Version__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Config_Change_Detail__c.SVMXC__Action_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Config_Change_Detail__c.SVMXC__Action__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Config_Change_Detail__c.SVMXC__Additional_information__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Config_Change_Detail__c.SVMXC__Application__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Config_Change_Detail__c.SVMXC__Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Config_Change_Detail__c.SVMXC__Entity_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Config_Change_Detail__c.SVMXC__ServiceMax_Job__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Config_Change_Detail__c.SVMXC__User__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Installed_Product__c.SVMXC__SM_External_Company__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Installed_Product__c.SVMXC__SM_External_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Installed_Product__c.SVMXC__SM_External_Parent__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Installed_Product__c.SVMXC__SM_External_Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Installed_Product__c.SVMXC__SM_External_Site__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Installed_Product__c.SVMXC__SM_External_Top_Level__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.BackOfficeReference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.BackOfficeSystem__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.CountryofBackOffice__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__RMA_Shipment_Order__c.NumberOfLinesNOTSynchedWithBO__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Address_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Bill_To__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Billing_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Canceled_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Canceled_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Case__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Closed_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Closed_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Company__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Delivery_Option__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Destination_City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Destination_Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Destination_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Destination_State__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Destination_Street__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Destination_Zip__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__EndpointURL__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Expected_Delivery_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Expected_Receive_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Fulfillment_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__IsPartnerRecord__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__IsPartner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Master_Order__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Number_of_units_returned__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__On_Hold__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Order_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Order_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Partner_Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Partner_Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Parts_Request__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Priority__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__RMA_Age_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__RMA_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Receiving_Courier__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__SESSION_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Sales_Order_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Service_Engineer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Service_Order__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Shipment_Age_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Shipment_Reference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Shipping_Courier__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Shipping_Receiving_Notes__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Shipping_Terms__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Source_City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Source_Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Source_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Source_State__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Source_Street__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Source_Zip__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Supplier__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Total_Price2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Tracking_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.SVMXC__Warehouse__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.TECH_IsBoundToBackOffice__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__RMA_Shipment_Order__c.Tech_WO_Owner_Email__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Appointment_Status__c.SVMXC__SM_EventId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Appointment_Status__c.SVMXC__SM_Event_Object__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Appointment_Status__c.SVMXC__SM_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Appointment_Status__c.SVMXC__SM_Transition_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Appointment_Status__c.SVMXC__SM_Transition__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Checklist_Attachment__c.SVMXC__SM_ContentDocumentLink_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Crew_Resource__c.SVMXC__SM_Crew_Leader__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Crew_Resource__c.SVMXC__SM_Crew_Resource_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Crew_Resource__c.SVMXC__SM_Crew__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Crew_Resource__c.SVMXC__SM_End_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Crew_Resource__c.SVMXC__SM_Resource__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Crew_Resource__c.SVMXC__SM_Start_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Crew__c.SVMXC__SM_Service_Team__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Crew__c.SVMXC__SM_isActive__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_IG_Job_Child__c.SVMXC__Batch_Id__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_IG_Job_Child__c.SVMXC__Execution_Info__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_IG_Job_Child__c.SVMXC__Object_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_IG_Job_Child__c.SVMXC__Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_IG_Job_Request__c.SVMXC__Reconcile_From_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_IG_Job_Request__c.SVMXC__Request__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_IG_Job_Request__c.SVMXC__Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Overnight_Stay_Policy__c.SVMXC__SM_Minimum_Recovery_Days__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Inbound__c.SVMXC__SM_Error_Log__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Inbound__c.SVMXC__SM_Event_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Inbound__c.SVMXC__SM_External_UUID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Inbound__c.SVMXC__SM_Record_to_Dispatch__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Inbound__c.SVMXC__SM_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Outbound__c.SVMXC__SM_Error_Log__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Outbound__c.SVMXC__SM_Event_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Outbound__c.SVMXC__SM_Network_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Outbound__c.SVMXC__SM_Record_to_Dispatch__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Outbound__c.SVMXC__SM_Request_Sent_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Outbound__c.SVMXC__SM_Response_Received_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_SB_Queue_Outbound__c.SVMXC__SM_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Service_Board__e.SVMXC__SM_Callback__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Service_Board__e.SVMXC__SM_Event_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Service_Board__e.SVMXC__SM_Object_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SM_Service_Board__e.SVMXC__SM_Payload__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SVMX_Event__c.SVMXC__SM_Appointment_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SVMX_Event__c.SVMXC__SM_Integration_Source__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__SVMX_Event__c.SVMXC__SM_Version_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__ServiceMax_Config_Data__c.SVMXC__SM_Files_Config__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__ServiceMax_Processes__c.SVMXC__SM_Enable_Version_Control__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.ExpenseQuantity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.Overtime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.ProductLocation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.Productive_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.Quantity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.RMANumber__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.ReturnedQuantity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Activity_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Actual_Price2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Actual_Quantity2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Applied_Rate_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Billable_Line_Price__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Billable_Quantity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Billing_Information__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Canceled_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Canceled_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Closed_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Closed_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Consumed_From_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Cost_Category__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Date_Received__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Date_Requested__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Dead_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Discount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__End_Date_and_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Entitlement_Notes__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Estimated_Price2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Estimated_Quantity2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Expense_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__From_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Group_Member__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Include_in_Quote__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Is_Billable__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Is_Entitlement_Performed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Line_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Line_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Log_Against__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Posted_To_Inventory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Product_Warranty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Quantity_Shipment_Initiated2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Quantity_Shipped2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Received_City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Received_Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Received_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Received_Quantity2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Received_State__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Received_Street__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Received_Zip__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Reference_Information__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Requested_City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Requested_Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Requested_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Requested_Quantity2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Requested_State__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Requested_Street__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Requested_Zip__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Select__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Serial_Number_List__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Serial_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Service_Group__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Service_Maintenance_Contract__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Start_Date_and_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Total_Estimated_Price__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Total_Line_Price__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Transaction_Results__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Use_Price_From_Pricebook__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Work_Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXC__Work_Detail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXPartDescription__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order_Line__c.SVMXShiptoAddress__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXTotalExpense__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.SVMXTotalTimeHours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.ShippedQuantity_del__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.StockOriginForPartUsed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.TECH_SentToBackOffice__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.TechEmailOfTechnician__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order_Line__c.TotalDuration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order_Line__c.TotalExpense__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order_Line__c.TotalTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order_Line__c.Warranty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.AccountNameTruncated__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.AccountNotification__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.AccountType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.ActualServiceDurationHrs__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.AdditionalCommercialReferences__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.AddressLine2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.AgeAtCustomerConfirmed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.AgeAtNew__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.AgeAtScheduled__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.AgeAtServiceDelivered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.AgeAtUnscheduled__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.AgeAtWIP__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.ApplyPredefinedDateTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.ApprovalManager__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Approved__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.BackOfficeReference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.BackOfficeSystem__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.BillToAccount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.BusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.CaseCreationDateTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.CaseOwner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.CheckedIn__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.CheckedbyGMR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Comments_to_Planner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Commercial_Reference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.CompliedWithSafetyRequirements__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.Contact_Phone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.CountryOfBackOffice__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.Custmor_Requested_DateTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.CustomerApproval__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.CustomerConfirmed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.CustomerLocationAccount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.CustomerRequestedDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.CustomerRequestedTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.CustomerTimeZone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Customer_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Customer_Reference_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Customer_Service_Request_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.Default_WO_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.DrivingTimeHrs__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Est_Svc_time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.EstimatedExpenseCost__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.EstimatedMaterialCost__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Estimated_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Failed_Assembly_Cust_New__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.FailureMode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Family__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.FirstSynchronizationDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.FrequencyUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Frequency__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Habilitation_Requirements_certs__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Howfixed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.I2P_Symptom__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.IncludedService__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.InitialAgeCustomerConfirmed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.InitialAgeScheduled__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.InitialAgeServiceDelivered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.InitialAgeUnscheduled__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.InitialAgeWIP__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.InitialAge__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.InternalComments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Invoiced__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.IsBillable__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.IsSLAOverdue__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Is_Billable__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.LastSynchronizationDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.Logged_in_is_Primary__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.NotifyAccountOwner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.OfflineRulesReminder__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.OperationId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.OpportunityDetected__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.ParentWorkOrderGroup__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Parent_Work_Order__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.PendingReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.Planned_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.PlannerContact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.ProductDescription__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.ProductFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.ProductLine__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Project__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Qualifications__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.QuickRescheduling__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.QuotationLink__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Reason_for_Rejection__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.RecurrenceEndDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.RejectedTechnicians__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.RemainingValue__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Report_Types__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Reports_Required__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.RescheduleReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Rescheduled__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.RootCause__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SR_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Acknowledged_By_Technician_Date_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Actual_Initial_Response__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Actual_Onsite_Response__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Actual_Resolution__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Actual_Restoration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Age_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Age__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Apply_Business_Hours_For_OptiMax__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Appointment_Promised_Time_Slot__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Auto_Entitlement_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__BatchUpdate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Billing_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Booked_Appointment_Slot__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Canceled_Date_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Case__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Clock_Paused_Forever__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Closed_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Closed_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Company__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Completed_Date_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Component__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Configuration_After__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Configuration_Before__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Corrective_Action__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Customer_Down_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Customer_Down__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Customer_Failure_Feedback__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Dependency_Group__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Dispatch_Now__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Dispatch_Priority__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Dispatch_Process__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Dispatch_Response__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Dispatch_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Drip__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Driving_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__EndpointURL__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Entitlement_Notes__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Entitlement_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Failed_Assembly__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Failure_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Finished_Onsite_Date_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__FirstScheduledDateTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__First_Assigned_DateTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__First_Queued_DateTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Group_Email__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Group_Member__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__How_Fixed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Idle_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Initial_Response_Customer_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Initial_Response_Internal_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Invoice_Created__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Invoice_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__IsPartnerRecord__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__IsPartner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Is_Entitlement_Performed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Is_Exported__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Is_PM_Work_Order__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Is_SLA_Calculated__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Is_Service_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Last_Dispatch_Event__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Latitude__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Locked_By_DC__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Longitude__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Master_Order_Line__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Member_Email__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__NoOfTimesAssigned__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__NoOfTimesQueued__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__NoOfTimesScheduled__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Number_Of_Times_Assigned_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Number_Of_Times_Queued_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Number_Of_Times_Scheduled_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Onsite_Response_Customer_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Onsite_Response_Internal_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__OptiMax_Error_Email1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__OptiMax_Error_Email2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__OptiMax_Error_Occurred__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__OptiMax_Error_Text__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__OptiMax_Last_Run_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__OptiMax_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Optimizer_Connection_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Order_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Order_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__PM_Plan__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__PM_SC__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__PM_Tasks_Created__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Partner_Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Partner_Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Perform_Auto_Entitlement__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Preferred_Business_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Preferred_End_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Preferred_Resource_Priority__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Preferred_Start_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Preferred_Technician__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Previous_Scheduled_Date_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Primary_Territory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Priority__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Problem_Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Proforma_Invoice_Amount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Proforma_Invoice__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Purpose_of_Visit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__QTL_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Qualified_Technicians__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Rate_Pricing_Rule__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Rate_Type_Pricing_Rule__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Related_Work_Order__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Resolution_Customer_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Resolution_Internal_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Restoration_Customer_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Restoration_Internal_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Root_Cause__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SESSION_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SLA_Clock_Extension_Minutes__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SLA_Clock_Pause_Days__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SLA_Clock_Pause_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SLA_Clock_Pause_Minutes__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SLA_Clock_Pause_Reason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SLA_Clock_Pause_Restart_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SLA_Clock_Pause_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SLA_Clock_Paused__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SLA_Terms__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Appointment_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Crew_Assignment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Crew_Id__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Crew_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Estimated_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_In_Jeopardy__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Integration_Source__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_LJS_Minimum_Schedule_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Life_Cycle_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Multi_resource__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Ok_To_Arrive_Early__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Optimizer_Message_Creation_Date_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_PM_Activity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Revised_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_SLA_Initial_Response__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_SLA_Onsite_Response__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_SLA_Resolution__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_SLA_Restoration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Schedule_Violation_Penalty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Scheduled_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Scheduling_Options__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Scope_Change__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Service_Request__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Unscheduled_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Variance__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__SM_Version_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Schedule_As_A_Dependent_Work_Order__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Scheduled_Date_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Scheduled_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Scheduling_Change_Token__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Scheduling_Retry_Count__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Service_Contract__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Service_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Service_Group__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Service_Zone_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Site__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Skill_Set__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Skill__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Special_Instructions__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Started_Driving_To_Location_Date_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__State__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Street__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Sub_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Symptom__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__TimeBetweenAssignAndSchedule__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__TimeBetweenQueueAndAssign__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__TimeBetweenScheduleAndClose__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__TimeToAssign__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__TimeToQueue__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__TimeToSchedule__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_Between_Assign_And_Schedule_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_Between_Queue_And_Assign_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_Between_Schedule_And_Close_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_To_Close_c__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_to_Assign_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_to_Initial_Response__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_to_Onsite_Response__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_to_Queue_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_to_Resolve__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_to_Restore__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Time_to_Schedule_Bucket__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Top_Level__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Total_Billable_Amount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Total_Estimate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Total_Work_Order_Cost__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Travel_Rate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Travel_Unit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Turnaround_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Violation_Message__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Violation_Status2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Warranty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Work_Order_Scheduling_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Work_Performed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SVMXC__Zip__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.SVMXEligibleforTerritoryRouting__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.SVMXIsOwnerQueue__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SendAlertNotification__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SendBulkSMS__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SendConfirmationEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SendEmailToCustomer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SendEmailToThirdParty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Serial_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.ServiceDurationHrs__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.ServiceDurationMinutes__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.ServiceItem__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.ServiceOrderId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.ServiceOrderTechClosed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Service_Business_Unit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Service_Duration_Calc_Method__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Shipped_Serial_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SiteSpecificComments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SkipWeekends__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SpecialInstruction__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.StandardDurationHrs__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Standard_Duration_mins__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.StatusAge__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.StatusHistory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.SubStatusAge__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SubStatusHistory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.SubStatus__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.SynchronizationLog__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TECHAccountDetail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.TECHIdFormula__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TECHPMsesaId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TECH_AccountOwnerNotified__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TECH_CreatedfromSFM__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TECH_CustomerScheduledDateTimeECH__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.TECH_FSEPreferredRole__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TECH_FSRScheduledDateTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TECH_IsBoundToBackOffice__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TECH_LaunchGMR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TechOwnerEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TechToBeRescheduled__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Tech_AccountOwnerEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Technical_Approval__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TechnicianType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Tools_Required__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.TrackedRescheduleReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.UpdateOwnership__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.WOStatusLastUpdateDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.WOSubStatusLastUpdateDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Order__c.Warranty2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.WorkOrderGroup__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.WorkOrderName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.WorkOrderSource__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.WorkOrderSubType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Work_Order_Category__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Work_Order_Notification__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Order__c.Work_Order_Skills__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Default_Parts_Price_Book__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Default_Travel_Price__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Default_Travel_Unit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Labor_Rounding_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__List_Price__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Minimum_Labor__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Minimum_Travel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Round_Labor_To_Nearest__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Round_Travel_To_Nearest__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__SLA_Terms__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Service_Pricebook__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Plan__c.SVMXC__Travel_Rounding_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook_Entry__c.SVMXC__Activity_Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook_Entry__c.SVMXC__Activity_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook_Entry__c.SVMXC__Activity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook_Entry__c.SVMXC__Entry_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook_Entry__c.SVMXC__Product_Family__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook_Entry__c.SVMXC__Product_Line__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook_Entry__c.SVMXC__Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook_Entry__c.SVMXC__Regular_Rate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook_Entry__c.SVMXC__Unit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook__c.SVMXC__Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Pricebook__c.SVMXC__Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Actual_Initial_Response__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Appointment_Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Closed_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Closed_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__ERP_External_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Preferred_Start_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Priority__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Problem_Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Serial_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Service_Request_Source__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Subject__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Request__c.SVMXC__Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template_Products__c.SVMXC__Product_Family__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template_Products__c.SVMXC__Product_Line__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template_Products__c.SVMXC__Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Service_Template_Products__c.TECH_IsEnriched__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__All_Products_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__All_Services_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Coverage_Effective_From2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Coverage_Effective_From__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Duration_of_Expenses__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Duration_of_Material_Coverage__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Duration_of_Time_Coverage__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Exchange_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Exclusions__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Expenses_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Invoice_Required__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Loaner_Provided__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Material_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Onsite_Repair__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__RMA_Required__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Shipment_Allowed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Template_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Time_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Transferable__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Unit_of_Time_Expenses__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Unit_of_Time_Material__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Unit_of_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Template__c.SVMXC__Walk_in_Allowed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Zone__c.SVMXC__Zone_Definition__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Zone__c.SVMXC__Zone_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service_Zone__c.SVMXC__Zone_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service__c.ExternalId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service__c.SVMXC__Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service__c.SVMXC__Data_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service__c.SVMXC__Effective_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service__c.SVMXC__Qualifying_Criteria__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service__c.SVMXC__Select__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service__c.SVMXC__Service_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Service__c.SVMXC__Tracked_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.AccountName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.AdditionalInfoAddressForFSE__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.AdditionalRequirements__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.AddressLine2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.AirConditionning__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.AirDryerInTheSubstation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.AutoAssignmentEnabled__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.CableTypeForNetwork__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Certification_Business_Unit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Site__c.Country_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.CustomerLocationNamingConvention__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.EnvironmentStressLevel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.FifthPreferredTechnician__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.FourthPreferredTechnician__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.GoldenLocationId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.HabilitationSubType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.HabilitationType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Habilitation_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.HealthAndSafety__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Heating__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.HumidityValue__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Inactive__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.IpAddressForNetwork__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Language__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.LocalisationInformation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.LocationAccessibiltyInformation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.LocationCountry__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.LocationFunction__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.LocationNotes__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.LocationTechnicalCaracteristics__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Location_Typology__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.NetworkSpeedUoM__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.NetworkSpeed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.OverheadCabling__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.PUE__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Parent_Hierarchy__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.PreferredFSE__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.PrimaryLocation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.ProtocolOfNetwork__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.RaisedFloor__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SAP_Instance__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SAP_Plant_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SAP_Storage_Location_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Costed_at_value__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Email__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Inventory_Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__IsDefault_Delivery__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__IsDelivery_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__IsGood_Stock__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__IsPartnerRecord__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__IsPartner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__IsReceiving_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__IsRepair_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__IsStaging_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Latitude__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Location_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Longitude__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Parent__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Partner_Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Partner_Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Preferred_Business_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__SM_External_Company__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__SM_External_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__SM_External_Parent__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Service_Engineer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Site_Fax__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Site_Phone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__State__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Stocking_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Street__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Web_site__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SVMXC__Zip__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SecondPreferredFSE__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SiteSpecificComments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SixthPreferredTechnician__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.StateProvince__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Stock_Location_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.SubType_Of_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.TECH_CreateFromWS_IP__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Site__c.TECH_CurrentUserSesa__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.TECH_Customer_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Site__c.TECH_IsCoveredByHRequirement__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.TECH_IsLocationReadOnly__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.TECH_LocDeletionDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.TECH_LocSendToBatch__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.TECH_SDHGoldenVersion__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.TECH_SDHPublisherMaster__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Site__c.TECH_isAddressSynchedWithAccount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.TemperatureUnitOfMessure__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Temperature__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.ThirdPreferredFSE__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.TimeZone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.ToDelete__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Site__c.Top_Level_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Site__c.Top_Level_Parent__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Site__c.Top_Parent__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.ValidTimeZone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Valid__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.ValidationError__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Site__c.Ventilation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.Business_Unit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Skill__c.Country_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.Manufacturer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.SVMXC__Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.SVMXC__Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.SVMXC__Select__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.SVMXC__Skill_Area__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.SVMXC__Skill_Category__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.SVMXC__Skill_Level_High__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.SVMXC__Skill_Level_Low__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.SVMXC__Skill_Level_Medium__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.SkillLevel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.Skillsextn__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Skill__c.ValidityPeriod__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Additional_Information__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Adjustment_Account_Number__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Adjustment_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Change_Quantity2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Change_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__IsPartnerRecord__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__IsPartner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__New_Quantity2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Old_Quantity2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Partner_Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Partner_Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Posted_To_Inventory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Serial_Number_List__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Adjustment__c.SVMXC__Transaction_Results__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Change_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Changed_By__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Cost__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Currency__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Date_Changed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__From_Product_Stock__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Inventory_Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Inventory_Process__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__IsPartnerRecord__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__IsPartner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Negative_Stock__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Notified_User__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Partner_Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Partner_Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Parts_Request_Line__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Parts_Request__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Product_Serial__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Product_Stock__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Quantity_after_change2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Quantity_before_change2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__RMA_Line__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__RMA__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Service_Order_Line__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Service_Order__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Shipment_Line__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Shipment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Stock_Adjustment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Stock_Transfer_Line__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Stock_Transfer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Stock_Value__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__To_Product_Stock__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Transaction_Quantity2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_History__c.SVMXC__Transaction_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer_Line__c.SVMXC__Additional_Information__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer_Line__c.SVMXC__Posted_To_Inventory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer_Line__c.SVMXC__Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer_Line__c.SVMXC__Quantity_Transferred2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer_Line__c.SVMXC__Select__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer_Line__c.SVMXC__Serial_Number_List__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer_Line__c.SVMXC__Transaction_Results__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer_Line__c.SVMXC__Unit_Price2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer_Line__c.SVMXC__Use_Price_From_Pricebook__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer__c.SVMXC__Additional_Information__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer__c.SVMXC__Destination_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer__c.SVMXC__IsPartnerRecord__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer__c.SVMXC__IsPartner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer__c.SVMXC__Not_Posted_Item_Count__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer__c.SVMXC__Partner_Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer__c.SVMXC__Partner_Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Stock_Transfer__c.SVMXC__Source_Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Email__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Fax__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Latitude__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Longitude__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Parent__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Phone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__State__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Street__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Web_site__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sub_Location__c.SVMXC__Zip__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request_Records__c.SVMXC__Client_Record_Id__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request_Records__c.SVMXC__Iteration_Index__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request_Records__c.SVMXC__Object_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request_Records__c.SVMXC__Operation_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request_Records__c.SVMXC__Record_Id__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request_Records__c.SVMXC__SFDC_Record_Id__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request_Records__c.SVMXC__SOQL_Query__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request_Records__c.SVMXC__Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request__c.SVMXC__Client_Info__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request__c.SVMXC__Error_Message__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request__c.SVMXC__Error_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request__c.SVMXC__Profile_Id__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request__c.SVMXC__Request_Sequence__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request__c.SVMXC__Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request__c.SVMXC__Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Sync_Request__c.SVMXC__User_Id__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Task_Template__c.EstimatedTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Task_Template__c.SVMXC__Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Task_Template__c.SVMXC__Priority__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Task_Template__c.SVMXC__Sequence__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Task_Template__c.SVMXC__Task_Template__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Task_Template__c.SVMXC__Task_Title__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Task_Template__c.SVMXC__Template_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Task_Template__c.SVMXC__Template_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory_Coverage__c.SVMXC__Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory_Coverage__c.SVMXC__Adjacent_Territory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory_Coverage__c.SVMXC__Record_Type_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory_Coverage__c.SVMXC__Territory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory_Coverage__c.SVMXC__Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory_Coverage__c.SVMXC__Value__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Territory_Coverage__c.ServiceBusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SVMXC__Territory__c.Depth__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.ExternalId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Average_Driving_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Average_Speed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Break_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Fixed_Cost__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Max_Daily_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Max_Distance__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Max_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Mode_Of_Travel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Optimizer_Connection_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Optimizer_External_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Optimizer_Last_Timestamp__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Parent_Territory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Per_Hour_Cost__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Per_Mile_Cost__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__SM_Overnight_Stay_Policy__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Select__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Territory_Code__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.SVMXC__Territory_s_Business_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.ServiceBusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.TEMP_EXT_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Territory__c.TEMP_EXT_PARENT_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Activity_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Applied_Rate_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Billable_Line_Price__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Billable_Qty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Billing_Information__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Calculate_Price__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Case__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__End_Date_and_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Is_Billable__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Line_Price__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Line_Qty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Start_Date_and_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Time_Tracker__c.SVMXC__Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Day_Entry__c.SVMXC__Day_of_the_Week__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Day_Entry__c.SVMXC__IsHoliday__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Day_Entry__c.SVMXC__SM_Working_Minutes__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Day_Entry__c.SVMXC__Timsheet_Day__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Day_Entry__c.SVMXC__Total_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__Activity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__End_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__SM_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__Salesforce_Event__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__ServiceMax_Event__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__Start_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__Task__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet_Entry__c.SVMXC__Work_Detail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__End_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__Notes__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__Period__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__SM_Business_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__Start_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__Submitted_On__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__Title__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__Total_Hours__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Timesheet__c.SVMXC__User__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Travel_Policy__c.SVMXC__Named_Expression__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Travel_Policy__c.SVMXC__Rate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Travel_Policy__c.SVMXC__Service_Contract__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Travel_Policy__c.SVMXC__Service_Plan__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Travel_Policy__c.SVMXC__Service__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Travel_Policy__c.SVMXC__Unit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__User_GPS_Log__c.SVMXC__Additional_Info__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__User_GPS_Log__c.SVMXC__Device_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__User_GPS_Log__c.SVMXC__Latitude__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__User_GPS_Log__c.SVMXC__Longitude__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__User_GPS_Log__c.SVMXC__Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__User_GPS_Log__c.SVMXC__Time_Recorded__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__User_GPS_Log__c.SVMXC__User__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__All_Products_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__All_Services_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__End_Date_Expenses_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__End_Date_Material_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__End_Date_Time_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__End_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Exchange_type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Exclusions__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Expenses_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Invoice_Required__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Loaner_Provided__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Material_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Onsite_Repair__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__RMA_Required__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Select__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Service_Template__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Shipment_Allowed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Start_Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Time_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Transferable__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Travel_Covered__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Walk_in_Allowed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Warranty__c.SVMXC__Weeks_to_End__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Work_Order_Resource__c.SVMXC__Preference_Type__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Zone_Pricing__c.SVMXC__Rate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Zone_Pricing__c.SVMXC__Service_Contract__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Zone_Pricing__c.SVMXC__Service_Plan__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SVMXC__Zone_Pricing__c.SVMXC__Zone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SalesEntity__c.Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SalesEntity__c.Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SalesEntity__c.LegacyID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceContractValueChainPlayer__c.AccountRole__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceContractValueChainPlayer__c.Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceContractValueChainPlayer__c.ContactRole__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceContractValueChainPlayer__c.Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>ServiceItem__c.Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.BackOfficeReference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.BackOfficeSystem__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>ServiceItem__c.ContractName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.CountryofBackOffice__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.EndDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.InstalledAt__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.ItemCategory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.ItemNumber__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.NetValue__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.Quantity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.ReasonForRejection__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceItem__c.StartDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.AccountServiceContractType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.AccountSupportLevel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.AdvancedFirstAssignmentSLA__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.CCCCountry__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>ServiceLevelAgreement__c.CaseCategory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.CaseClassification__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.CaseOrigin__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.CasePriority__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>ServiceLevelAgreement__c.CaseReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.ContactSupportLevel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.CustomerClasslevel1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.DebitPointReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.ExpertFirstAssignmentSLA__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>ServiceLevelAgreement__c.PrimaryFirstAssignmentSLA__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Solution.IsPublished</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Solution.IsPublishedInPublicKb</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Solution.SolutionNote</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SolutionApproach__c.AdditionalComments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SolutionApproach__c.ProposedTechnicalSolution__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SolutionApproach__c.SolutionApproachTitle__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SolutionApproach__c.TechnicalSolutionComponents__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SolutionCenter__c.BusinessesServed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SolutionCenter__c.CountryOfLocation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SolutionCenter__c.Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SolutionCenter__c.EmailAddress__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SolutionCenter__c.IsASolutionCenter__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpecializationCatalog__c.Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpecializationCatalog__c.Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpecializationCatalog__c.ExpirationPeriod__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpecializationCatalog__c.SEID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpecializationRequirement__c.Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.ApplicableTo__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.Category__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.Certification__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.ExpirationPeriod__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpecializationRequirement__c.GlobalSpecializationRequirement__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.Mandatory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.Manual__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.SEID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.SpecializationRecordType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SpecializationRequirement__c.TargetGuidelines__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpecializationRequirement__c.Tech_UniqueSpecializationReqID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.Classifications__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.DomainsOfExpertise__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.ExpirationPeriod__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.GlobalProgramOwner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.GlobalSpecialization__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.Level__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.ProgramAdministrator__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.ProgramApprover__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.ProgramManager__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Specialization__c.SEID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.SpecializationCatalog__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Specialization__c.TECH_ClassificationLevel1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.TECH_CountriesId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Specialization__c.TECH_DoaminsOfExpertiseLvl1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Specialization__c.TECH_MarketSegmentCount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Specialization__c.TECH_MarketSegment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Specialization__c.TECH_TargetCountries__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Specialization__c.TargetCountriesTxt__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Specialization__c.Tech_ClassificationCount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpiceGroupData__c.CommentsAllowedInChatter__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpiceGroupData__c.PostsAllowedinChatter__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpiceObjectData__c.CommentsAllowedInChatter__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SpiceObjectData__c.PostsAllowedinChatter__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>StateProvince__c.Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>StateProvince__c.StateProvinceExternalId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SubObjective__c.AxisValue__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.CustomerClassificationLevel1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.CustomerClassificationLevel2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.GenericDemand__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.GenericUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SubObjective__c.IndirectExport__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.MarketSegment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.MarketSubSegment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SubObjective__c.OptionalAxis__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SubObjective__c.SubAxis_Value__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.SubObjectiveName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.TECH_CustomerClassificationLevel1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.TECH_CustomerClassificationLevel2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.TECH_MarketSegment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.TECH_MarketSubSegment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SubObjective__c.TECH_RecordTypeName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.AScorePRIOR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SuccessScorecard__c.Adoption_Score_average__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.BMScorePRIOR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SuccessScorecard__c.Business_Measures_Score_average__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Business_Strategy_Objectives_Comment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Business_and_Strategy_Objectives__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Business_and_Technology_Issues_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Business_and_Technology_Issues__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Capabilities_Value_Map_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Capabilities_Value_Map__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Center_of_Excellence_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Center_of_Excellence__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Communication_Plan_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Communication_Plan__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Continuous_Improvement_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Continuous_Improvement__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Customer_Experience_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Customer_Experience__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Data_Management_Strategy_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Data_Management_Strategy__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Deployment_Roadmap_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Deployment_Roadmap__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SuccessScorecard__c.Domain_Scores_Radar__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SuccessScorecard__c.Domain_Scores__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Executive_Sponsorship_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Executive_Sponsorship__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Global_Deployment_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Global_Deployment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Implementation_Framework_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Implementation_Framework__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_1_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_1_Target__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_1__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_2_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_2_Target__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_3_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_3_Target__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_3__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_4_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_4_Target__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_4__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_5_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_5_Target__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_5__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.KPI_Link__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Key_Performance_Indicators_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Key_Performance_Indicators__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Measurements_Rewards_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Measurements_Rewards__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Methodology_Guidelines__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Objectives_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Objectives__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Operationalize_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Operationalize__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Organizational_Readiness_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Organizational_Readiness__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Other_KPI_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.PDScorePRIOR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Platform_Integration_Strategy_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Platform_and_Integration_Strategy__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Process_Definition_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SuccessScorecard__c.Process_Definition_Score_avg__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Process_Definition__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Process_Effectiveness_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Process_Effectiveness__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Process_Ownership_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Process_Ownership__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Process_Review_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Process_Review__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Product_Roadmap_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Product_Roadmap__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.RScorePRIOR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Real_Time_Dashboard__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Release_Management_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Release_Management__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SuccessScorecard__c.Roadmap_Score__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.SGScoresPrior__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Security_Infrastructure_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Security_Infrastructure__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SuccessScorecard__c.Sponsorship_and_Governance_Score_avg__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Stakeholder_Involvement_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Stakeholder_Involvement__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Support_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Support__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.TDScorePRIOR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SuccessScorecard__c.Technology_and_Data_Score_avg__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Training_Strategy_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Training_Strategy__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.VSScorePRIOR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Validation_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Validation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Vision_Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SuccessScorecard__c.Vision__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SuccessScorecard__c.Vision_and_Strategy_Score__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SupplySustainablityRole__c.Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SupplySustainablityRole__c.Role__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SupplySustainablityRole__c.Scope__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>SupplyingPlant__c.ProductLine__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>SupplyingPlant__c.Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Swap_Asset__c.CommissioningDateInstallDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Swap_Asset__c.ConfirmSwap__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Swap_Asset__c.CopyChildAssetLinks__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Swap_Asset__c.DecommissionedDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Swap_Asset__c.DeinstalledInstalledProduct__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Swap_Asset__c.DeinstalledStatus__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Swap_Asset__c.InstalledAtAccount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Swap_Asset__c.InstalledProduct__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Swap_Asset__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Symptom__c.CaseClassification__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Symptom__c.Family__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Symptom__c.GMRCode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Symptom__c.IsActive__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Symptom__c.ProductLine__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Symptom__c.Product__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Symptom__c.Reason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Symptom__c.SubSymptom__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Symptom__c.Symptom__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_CommRefAllLevel__c.BusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_CommRefAllLevel__c.Family__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_CommRefAllLevel__c.ProductFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_CommRefAllLevel__c.ProductGroup__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_CommRefAllLevel__c.ProductLine__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_CommRefAllLevel__c.ProductSuccession__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_CommRefAllLevel__c.SubFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_GMRMapping__c.NewBusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_GMRMapping__c.NewFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_GMRMapping__c.NewProductFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_GMRMapping__c.NewProductLine__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_GMRMapping__c.OldBusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_GMRMapping__c.OldFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_GMRMapping__c.OldProductFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_GMRMapping__c.OldProductID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TECH_GMRMapping__c.OldProductLine__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.AffectedOffer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.AssessmentType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Case_Subject__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Case__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ClosedDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Communicationfrequency__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Confirm__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ContactEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ContactName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ContactPhone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.CustomerPreferredLanguage__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.CustomerPreferredchannel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.CustomerWait__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.DateofReportofDelivery__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.DaysSpentOnAssessment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ExpertAssessmentCompleted__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ExpertAssessmentReviewed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ExpertAssessmentStarted__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertAssessmentTemplates__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterAdditionalInformation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterCity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterContactEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterContactName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterCountry__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterCounty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterFax__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterLocalAdditionalInfo__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterLocalCity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterLocalCounty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterLocalStreet__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterPOBoxZipCode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterPOBox__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterPhone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterStateProvince__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterStreet__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ExpertCenterZipCode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ExpertCenter__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.FailingComponent__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.FailureMode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ForceManualSelection__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.FrontOfficeOrganization__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.FrontOfficeTEXManager__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.FrontOfficeTEXReviewer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ManualExpertCenterOverride__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Material_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.OfferExpert__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.OpenDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.PotentialSafetyIssue__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.PriorityReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Prioritylevel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.Product_BU__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.Product_Line__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.PromiseDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Reasonfornotdeliverreportontime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.ReceiveAutomaticEmailToCustomer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Receive_Automatic_Email__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.ReminderContactEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.Reminder__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.SendAutomaticEmailToCustomerinEng__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.StatusReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.SubFailureMode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.TECH_CSIFlag__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_CaseAccount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_CaseContactName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_CaseCreationToTEXCreation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_CaseEmailNotificationContent__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.TECH_CaseOwner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_CommercialReference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.TECH_ContactEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_ContactName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_EAInProgressToFOReview__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_EAReportFinalizedToEASentToCust__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_EASentToCustToClosed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_EAStartedToEAInProgress__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.TECH_ExpertCenterContactEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_FOReviewToEAReportFinalized__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_ProductFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_TEXCreationToTEXClosed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TEX__c.TECH_TEXManagerEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.TEXReportDeliveredtoCustomer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TEX__c.UpdatedPromiseDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Curriculum__c.Objectives__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Location__c.Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Location__c.StateProvince__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Location__c.ZipCode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.AddInfo__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.Address__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Registration__c.Comment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.Curriculum__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.Duration_del__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.End__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.Start__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Registration__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Registration__c.Trainee__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Registration__c.ZipCode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Session__c.AddInfo__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.Adress__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.Availability__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.Available__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.City__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Session__c.Curriculum__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.Date__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.Duration__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Session__c.End__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Session__c.Entity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Session__c.Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.NoR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Session__c.Notify__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.RegiNumber__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Session__c.Region__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.SeatsLeft__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.StateProvince__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Session__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.SubStatus__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TMT_Session__c.ZipCode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TMT_Teaching__c.Trainer__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Task.ActivityDate</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamAgentMapping__c.CCAgent__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamAgentMapping__c.DefaultTeam__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamAgentMapping__c.Note__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamAgentMapping__c.TECH_AgentTeamUniqueKey__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamAgentMapping__c.TECH_DefaultTeamUniqueKey__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TeamCaseJunction__c.CaseCategory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TeamCaseJunction__c.CaseReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TeamCaseJunction__c.CaseSubReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamCaseJunction__c.Default__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamCaseJunction__c.TECH_ClassTeamUniqueKey__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamMember__c.AccessLevel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamMember__c.PartnerProgram__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamMember__c.User__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TeamProductJunction__c.Business__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamProductJunction__c.DefaultSupportedProductFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TeamProductJunction__c.PM0_ProductFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamProductJunction__c.ProductFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>TeamProductJunction__c.ProductLine__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>TeamProductJunction__c.TECH_PFTeamUniqueKey__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Team_Member__c.Action__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Team_Member__c.Deployment__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Team_Member__c.EndDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Team_Member__c.Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Team_Member__c.Phone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Team_Member__c.Release__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Team_Member__c.Role__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Team_Member__c.StartDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>Technical_Return__c.Barcode__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Technical_Return__c.CustomerCountry__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Technical_Return__c.DCReceivingDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Technical_Return__c.FrontOfficeCountryOrg__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Action__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Business_Requirement__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>User_Acceptance_Test__c.Category__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Data_Inputs__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Data_Outputs__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Key_Testing_Points__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>User_Acceptance_Test__c.Target_Release__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Test_Cycle_Steps__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.Test_Scenario_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>User_Acceptance_Test__c.Tests_Failed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>User_Acceptance_Test__c.Tests_Passed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Acceptance_Test__c.User_Role__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Story_Scenarios__c.Action__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Story_Scenarios__c.Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Story_Scenarios__c.Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Story_Scenarios__c.ExpectedBehaviour__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Story_Scenarios__c.Scenario_Nb__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Story_Scenarios__c.StepNb__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>User_Story_Scenarios__c.User__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>VCPOpportunityLineLink__c.Opportunity__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>VCPOpportunityLineLink__c.TECH_UniqueVCPOpportunityLineLink__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Validated_Learning__c.Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Validated_Learning__c.Criteria_to_validate_the_learning__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Validated_Learning__c.Description__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Validated_Learning__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Validated_Learning__c.Type_of_Learning__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WONInstalledProductLine__c.InstalledProduct__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WONInstalledProductLine__c.ProblemSummary__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WONInstalledProductLine__c.SerialLotNumber__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WONInstalledProductLine__c.Warranty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WO_ValueChainPlayer__c.AccountDetails__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WO_ValueChainPlayer__c.AccountRole__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WO_ValueChainPlayer__c.Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WO_ValueChainPlayer__c.ContactRole__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WO_ValueChainPlayer__c.Contact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WO_ValueChainPlayer__c.TECH_AccountDetails__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WO_ValueChainPlayer__c.TECH_ProjectManager__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WO_ValueChainPlayer__c.User__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderAssignmentRule__c.BusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderAssignmentRule__c.Country__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderAssignmentRule__c.OnlyEnabledLocations__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderAssignmentRule__c.WorkOrderCategory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderAssignmentRule__c.WorkOrderSource__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderAssignmentRule__c.WorkOrderType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.BackOfficeReference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.BackOfficeSystem__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.CountryofBackOffice__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.ServiceMaintenanceContract__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.ServiceOrderProcessedInBO__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.ServiceOrderTechnicallyClosed__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.SoldTo__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.WOGName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderGroup__c.WO_PM_Plan__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.AccountType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.Account__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.AssetNumber__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.Billable__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.BusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CaseContactName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CaseCreationDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CaseOtherSymptom__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CaseOwner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CasePriority__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CaseSubSymptom__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CaseSubject__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CaseSymptom__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.Case__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CheckedbyGMR__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.CommentstoDispatcher__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.CommercialReference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.ContactEmail__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.ContactFirstName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.ContactLastName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.ContactPhoneNumber__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.ContractReference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.Contract__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.CustomerLocation__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.CustomerRequestedDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.CustomerRequestedTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.Family__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.FieldServiceComments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.GlobalAccount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.InstalledAtAccount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.InstalledProduct__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.IntouchAssetNumber__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.IsBillable__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.Location__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.NonBillableReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.OnSiteContactSameasCaseContact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.OnSiteContact__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.Priority__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.ProductFamily__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.ProductLine__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.ReferenceLink__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.SLATerms__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.Scheduled_Date_Time__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.SerialNumber__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.ServiceMaintenanceContract__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.ServiceRequestReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.ServicesBusinessUnit__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.SoldToAccount__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.TECH_SRRefrenceLinkID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.TimeZone__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WarrantyReference__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>false</editable><field>WorkOrderNotification__c.Warranty__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WorkOrderCategory__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WorkOrderGroup__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WorkOrderName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WorkOrderNotificationManager__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WorkOrderOwner__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WorkOrderReason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WorkOrderStatus__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WorkOrderSubType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.WorkOrderType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>WorkOrderNotification__c.Work_Order_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Work_Order_Skills__c.Comments__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Work_Order_Skills__c.SkillLevel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Work_Order_Skills__c.Skill__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Work_Order_Task__c.AssociatedParts__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Work_Order_Task__c.TaskCompleted__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Work_Order_Task__c.TaskDescription__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Work_Order_Task__c.TaskOrder__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Work_Order_Task__c.TechDescription__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>XactlyCorp__XCIncentBusiness__c.XactlyCorp__url2__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>XactlyCorp__XCIncentBusiness__c.XactlyCorp__url__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>Zuora__CustomerAccount__c.ReferenceName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__BOSS_Action__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__Box_User__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__CollaborationID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__Folder_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__Folder_Share_Link__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__Latest_Err_Reason__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__Lead_Dest_Folder_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__New_Permission__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__Object_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__Record_Id__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__BOSS_Exception__c.box__Retry_Count__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__BOSS_Action__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__BOSS_Status__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__Box_user__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__CollaborationID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__Folder_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__Lead_Dest_Folder_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__New_Permission__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__Object_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__Permission__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__Record_ID__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__Retry_Count__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__FRUP__c.box__Salesforce_User__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__Folder_Meta__c.box__Folder_Append__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__Folder_Meta__c.box__Folder_Id__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__Folder_Meta__c.box__Folder_Name__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__Folder_Meta__c.box__Folder_Share_Link__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__ItemMoveQueue__c.box__FileOrFolder__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__ItemMoveQueue__c.box__ItemId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__ItemMoveQueue__c.box__NewParentId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>box__LeadConvertQueue__c.box__LeadId__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowBatchJobsQueue__c.chttrunfollow__delayJob__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowBatchJobsQueue__c.chttrunfollow__delayRulesIncluded__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowBatchJobsQueue__c.chttrunfollow__evalateEachRecordForDaysDelay__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowBatchJobsQueue__c.chttrunfollow__numRulesUsedInThisObject__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowBatchJobsQueue__c.chttrunfollow__sObjectQuery__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowQueue__c.chttrunfollow__ScheduledUnfollowDate__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRuleJob__c.chttrunfollow__DelayRuleJob__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRuleJob__c.chttrunfollow__NumFollows__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRuleJob__c.chttrunfollow__NumRecords__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRuleJob__c.chttrunfollow__NumRules__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRuleJob__c.chttrunfollow__ObjectName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRule__c.chttrunfollow__Active__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRule__c.chttrunfollow__DaysDelay__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRule__c.chttrunfollow__FieldLabel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRule__c.chttrunfollow__FieldName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRule__c.chttrunfollow__FieldType__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRule__c.chttrunfollow__ObjectLabel__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRule__c.chttrunfollow__ObjectName__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRule__c.chttrunfollow__Operator__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowRule__c.chttrunfollow__Value__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowTest__c.chttrunfollow__Checkbox__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowTest__c.chttrunfollow__DateTime__c</field><readable>true</readable></fieldPermissions>
<fieldPermissions><editable>true</editable><field>chttrunfollow__UnfollowTest__c.chttrunfollow__Date__c</field><readable>true</readable></fieldPermissions>
<layoutAssignments><layout>ACC_Channel__c-CNL - Channel Layout</layout></layoutAssignments>
<layoutAssignments><layout>ACC_LocalAttribute__c-LAL - Local Attribute Layout</layout></layoutAssignments>
<layoutAssignments><layout>ACC_PartnerProgram__c-Account Partner Program Layout</layout></layoutAssignments>
<layoutAssignments><layout>ANI__c-ANI Layout</layout></layoutAssignments>
<layoutAssignments><layout>APApexTestClass__c-Apex Test Class Layout</layout></layoutAssignments>
<layoutAssignments><layout>ARApprovalQueueMapping__mdt-AR Approval Queue Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>AS_ActiveUsers__c-AS-Active User Layout</layout></layoutAssignments>
<layoutAssignments><layout>AS_LastLoginsFilter__c-AS-Last Login w%2F connexion type filter Layout</layout></layoutAssignments>
<layoutAssignments><layout>AS_LastLoginsNoFilter__c-AS-Last Login w%2Fo connexion type filter Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccDirectAccountEmailMapping__mdt-Acc Direct Account Email Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>Account-ACC - Standard Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountAssessment__c-Account Assessment Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountAssignedFeature__c-AAF - Account Partner Program Feature Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountAssignedRequirement__c-ARQ - Activity Requirement Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountBrand-Account BrandLayout</layout></layoutAssignments>
<layoutAssignments><layout>AccountChallenge__c-Account Challenge Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountContactRelation-Account Contact Relationship Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountElectricianInfo__c-Electrician-specific Info Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountEnergyUsage__c-Account Energy Usage Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountGrowthInitiative__c-Account Growth Initiative Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountGrowthPlan__c-Account Growth Plan Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountMasterProfilePAM__c-Account Master Profile PAM Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountMasterProfile__c-Account Master Profile Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountOwnerChangeTracking__c-Account Owner Change Tracking Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountOwnershipRule__c-Account Ownership Rule Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountPlanConfidential__c-Account Plan Confidential Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountSpecializationRequirement__c-Account Specialization Requirement Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountSpecialization__c-Account Specialization Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountTeamMember-Account Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>AccountUpdateRequest__c-Country AUR Layout</layout></layoutAssignments>
<layoutAssignments><layout>AcknowledgmentTemplate__c-Acknowledgment Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>Action__c-Action Layout</layout></layoutAssignments>
<layoutAssignments><layout>AlertTranslations__c-User System Alert Layout</layout></layoutAssignments>
<layoutAssignments><layout>Analysis_Conclusion__c-Analysis Conclusion Layout</layout></layoutAssignments>
<layoutAssignments><layout>Answertostack__c-Answer-to stack Layout</layout></layoutAssignments>
<layoutAssignments><layout>ApexDebugLog__c-Apex Debug Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>App__c-App Layout</layout></layoutAssignments>
<layoutAssignments><layout>Application_Level_Support_Link__mdt-IDMS Support Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>AssessementProgram__c-Assessement Program Layout</layout></layoutAssignments>
<layoutAssignments><layout>AssessmentCountry__c-Assessment Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>Assessment__c-Assessment Layout</layout></layoutAssignments>
<layoutAssignments><layout>Asset-Asset Layout</layout></layoutAssignments>
<layoutAssignments><layout>AssetLocationEvent__c-Asset %2F Location Event Layout</layout></layoutAssignments>
<layoutAssignments><layout>AssetRelationship-Asset Relationship Layout</layout></layoutAssignments>
<layoutAssignments><layout>AssignedToolsTechnicians__c-Assigned Tools and Technicians Layout</layout></layoutAssignments>
<layoutAssignments><layout>AssociateWorkOrderNotification__c-Associate Work Order Notification Layout</layout></layoutAssignments>
<layoutAssignments><layout>AssociatedInstalledProduct__c-Associated Installed Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>Average_selling_price__c-Average selling price Layout</layout></layoutAssignments>
<layoutAssignments><layout>BFOEAMulticurrency__c-BFOEAMulticurrency Layout</layout></layoutAssignments>
<layoutAssignments><layout>BackOfficesystem__c-Back Office system Layout</layout></layoutAssignments>
<layoutAssignments><layout>Badge_Certificate__c-Badge Certificate Layout</layout></layoutAssignments>
<layoutAssignments><layout>BatchImport__c-Batch Import Info Layout</layout></layoutAssignments>
<layoutAssignments><layout>BeneficiaryPackage__c-BPK - General Layout</layout></layoutAssignments>
<layoutAssignments><layout>BfoWSEndPoint__mdt-Org Type Layout</layout></layoutAssignments>
<layoutAssignments><layout>BigMachines__Configuration_Record__c-BigMachines__Configuration Record Layout</layout></layoutAssignments>
<layoutAssignments><layout>BigMachines__Field_Mapping__c-BigMachines__Field Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>BigMachines__Oracle_User__c-BigMachines__Oracle User Layout</layout></layoutAssignments>
<layoutAssignments><layout>BigMachines__Quote_Product__c-BigMachines__Quote Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>BigMachines__Quote__c-BigMachines__Quote Layout</layout></layoutAssignments>
<layoutAssignments><layout>Brand__c-Brand Layout</layout></layoutAssignments>
<layoutAssignments><layout>BudgetaryOfferForm__c-Budgetary Offer Form Layout</layout></layoutAssignments>
<layoutAssignments><layout>BusinessRiskEscalationCaseLink__c-BRCL - Business Risk - Case link Layout</layout></layoutAssignments>
<layoutAssignments><layout>BusinessRiskEscalationEntity__c-BREE - Business Risk Entity Layout</layout></layoutAssignments>
<layoutAssignments><layout>BusinessRiskEscalationStakeholder__c-BRS - Business Risk Stakeholder Layout</layout></layoutAssignments>
<layoutAssignments><layout>BusinessRiskEscalations__c-BRE - Business Risk Layout</layout></layoutAssignments>
<layoutAssignments><layout>BusinessSpecificInformation__c-Buildings - Energy Solutions Layout</layout></layoutAssignments>
<layoutAssignments><layout>Business_Requirement__c-Business Requirement Layout</layout></layoutAssignments>
<layoutAssignments><layout>Business_Risk_Escalation_Alert__c-Business Risk Escalation Alert Layout</layout></layoutAssignments>
<layoutAssignments><layout>ByPassProcess__mdt-ByPassProcess Layout</layout></layoutAssignments>
<layoutAssignments><layout>CAPCountryWeight__c-CAP Country Weight Layout</layout></layoutAssignments>
<layoutAssignments><layout>CAPGlobalMasterData__c-CAP Global Master Data Layout</layout></layoutAssignments>
<layoutAssignments><layout>CBATeam__c-Contributing Business Approver Layout</layout></layoutAssignments>
<layoutAssignments><layout>CCCAction__c-CCA - CCC Action Layout</layout></layoutAssignments>
<layoutAssignments><layout>CCCLocation__c-CCC Location Layout</layout></layoutAssignments>
<layoutAssignments><layout>CCC_ChatButton__c-CCC ChatButton Layout</layout></layoutAssignments>
<layoutAssignments><layout>CIS_Competency__c-CIS Competency Layout</layout></layoutAssignments>
<layoutAssignments><layout>CIS_CorrespondentsTeam__c-CIS Correspondents Team Layout</layout></layoutAssignments>
<layoutAssignments><layout>CIS_CountryListPrice__c-Country Local Cost Layout</layout></layoutAssignments>
<layoutAssignments><layout>CIS_FieldServiceRepresentative__c-Field Service Representative Layout</layout></layoutAssignments>
<layoutAssignments><layout>CIS_ISRComment__c-ISR Comment Layout</layout></layoutAssignments>
<layoutAssignments><layout>CIS_ISR__c-ISR Layout</layout></layoutAssignments>
<layoutAssignments><layout>CIS_InterventionCosts__c-Intervention costs Layout</layout></layoutAssignments>
<layoutAssignments><layout>CIS_ServiceCenter__c-Service Center Layout</layout></layoutAssignments>
<layoutAssignments><layout>CMCCCMySE__mdt-CM CCC mySE Layout</layout></layoutAssignments>
<layoutAssignments><layout>CON_LocalAttribute__c-Contact Local Attribute Layout</layout></layoutAssignments>
<layoutAssignments><layout>CR_Comments__c-C%5CR Comments Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSE_ExternalReferences__c-ERF - External References Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSE_L2L3InternalComments__c-LIC - L2L3 Internal Comments Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSE_RelatedProduct__c-Case Related Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSQ_CertificationStatus__c-CSQ Certification status Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSQ_CertificationType__c-CSQ Certification type Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSQ_CounterMeasure__c-Counter Measure Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSQ_ImprovementProject__c-Opportunity for Improvement Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSQ_Measure__c-Measure Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSQ_Profile__c-CSQ Profile Layout</layout></layoutAssignments>
<layoutAssignments><layout>CSQ_ProjectTeamMember__c-Project Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>CTR_ValueChainPlayers__c-Contract Value Chain Player Layout</layout></layoutAssignments>
<layoutAssignments><layout>CTSK_INSP__Field_Statistic__c-CTSK_INSP__Field Statistic Layout</layout></layoutAssignments>
<layoutAssignments><layout>CTSK_INSP__Object_Statistic__c-CTSK_INSP__Object Statistic Layout</layout></layoutAssignments>
<layoutAssignments><layout>CWTMember__c-CWT Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>Campaign-CAM - Campaign Layout</layout></layoutAssignments>
<layoutAssignments><layout>CampaignCountry__c-Campaign Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>CampaignMember-Campaign Member Page Layout</layout></layoutAssignments>
<layoutAssignments><layout>Capability__c-Capability Layout</layout></layoutAssignments>
<layoutAssignments><layout>CareAgent__c-Care Agent Layout</layout></layoutAssignments>
<layoutAssignments><layout>Case-CSE - General Layout</layout></layoutAssignments>
<layoutAssignments><layout>CaseClassification__c-CCL - Layout</layout></layoutAssignments>
<layoutAssignments><layout>CaseClose-CSE - Close Case Layout</layout></layoutAssignments>
<layoutAssignments><layout>CaseRoutingRule__c-Case Routing Rule Layout</layout></layoutAssignments>
<layoutAssignments><layout>CaseStage__c-Case Stage Layout</layout></layoutAssignments>
<layoutAssignments><layout>CaseStakeholders__c-Case Stakeholders Layout</layout></layoutAssignments>
<layoutAssignments><layout>CaseSync__c-Case Sync Layout</layout></layoutAssignments>
<layoutAssignments><layout>Category__c-Category Layout</layout></layoutAssignments>
<layoutAssignments><layout>CertificationCatalog__c-Certification Layout</layout></layoutAssignments>
<layoutAssignments><layout>ChannelProgram-Channel Program Layout</layout></layoutAssignments>
<layoutAssignments><layout>ChannelProgramLevel-Channel Program Level Layout</layout></layoutAssignments>
<layoutAssignments><layout>ChannelProgramMember-Channel Program Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>ChannelSystemAlert__c-Channel System Alert Layout</layout></layoutAssignments>
<layoutAssignments><layout>ClassificationLevelCatalog__c-Classification Level Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>CoachingVisit__c-Coaching Visit Layout</layout></layoutAssignments>
<layoutAssignments><layout>CollaborationGroup-Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>CollaborationWorkingTeam__c-Collaboration Working Team Layout</layout></layoutAssignments>
<layoutAssignments><layout>CommercialReference__c-CMR - Commercial Reference Layout</layout></layoutAssignments>
<layoutAssignments><layout>CommunityMemberLayout-Community Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>CompetitorCountry__c-CCO - Competitor Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>Competitor__c-CMP - Competitor Layout</layout></layoutAssignments>
<layoutAssignments><layout>ComplaintRequestRoutingRule__c-Complaint Request Routing Rule Layout</layout></layoutAssignments>
<layoutAssignments><layout>ComplaintRequest__c-Complaint Request External</layout></layoutAssignments>
<layoutAssignments><layout>ComplaintsRequestsEscalationHistory__c-Complaints Requests Escalation History Layout</layout></layoutAssignments>
<layoutAssignments><layout>ComponentParameter__c-Component Parameters Segements Layout</layout></layoutAssignments>
<layoutAssignments><layout>ComponentProfileMap__c-Component Profile Map Layout</layout></layoutAssignments>
<layoutAssignments><layout>Component__c-Component Layout</layout></layoutAssignments>
<layoutAssignments><layout>ConfigureORFField__mdt-Configure ORF Field Layout</layout></layoutAssignments>
<layoutAssignments><layout>ConnectedSystem__c-Connected Environment Layout</layout></layoutAssignments>
<layoutAssignments><layout>Connector_Contact__c-Connector Contact Layout</layout></layoutAssignments>
<layoutAssignments><layout>Connector__c-Connector Layout</layout></layoutAssignments>
<layoutAssignments><layout>Contact-CTC - Standard Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContactAssignedFeature__c-CAF - Standard Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContactAssignedProgram__c-CAP - Standard Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContactAssignedRequirement__c-CAR - Activity Requirement Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContactElectricianSpecificInfo__c-Contact Electrician Specific Info Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContactEmailHistory__c-Contact Email History Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContainmentAction__c-CNA - Internal Containment Action Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContentAsset-Asset File Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContentVersion-General</layout></layoutAssignments>
<layoutAssignments><layout>Contract-Contract Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContractCustomerLocation__c-Contract Customer Location Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContractExternalReference__c-Contract External Reference Layout</layout></layoutAssignments>
<layoutAssignments><layout>ContractProductInformation__c-CPI - General Layout</layout></layoutAssignments>
<layoutAssignments><layout>Convert_Attachments_to_Files_Log__c-Convert Attachments to Files Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>Convert_Notes_to_ContentNotes_Log__c-Convert Notes to Enhanced Notes Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>CorrectiveAction__c-CRA - Schneider Corrective Action Layout</layout></layoutAssignments>
<layoutAssignments><layout>CountryCISCorrespondentsTeamLink__c-Country CIS Correspondents Team Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>CountryCategoryMapping__c-Country Category Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>CountryChannelUserRegistration__c-Country Channel User Registration Fields Layout</layout></layoutAssignments>
<layoutAssignments><layout>CountryChannels__c-Country Channels Layout</layout></layoutAssignments>
<layoutAssignments><layout>CountryMapping__mdt-CountryMapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>CountryStateLanguageTranslation__c-Country%2FState Language Translation Layout</layout></layoutAssignments>
<layoutAssignments><layout>Country__c-CTR - Layout</layout></layoutAssignments>
<layoutAssignments><layout>CoveredOrganization__c-Covered BU%2FGeography Layout</layout></layoutAssignments>
<layoutAssignments><layout>Covered_Country__c-Covered Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>CreditRequestPriceList__c-Credit Request Price List Layout</layout></layoutAssignments>
<layoutAssignments><layout>CreditRequest__c-Credit Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>CustomCategoryTreeLevel__c-Custom Category Tree Level Layout</layout></layoutAssignments>
<layoutAssignments><layout>CustomCategoryTree__c-OCM Custom Tree Layout</layout></layoutAssignments>
<layoutAssignments><layout>CustomRecentlyViewed__c-Recently Viewed Layout</layout></layoutAssignments>
<layoutAssignments><layout>CustomerCareTeam__c-CCT - Page Layout</layout></layoutAssignments>
<layoutAssignments><layout>CustomerLocation__c-Customer Location Layout</layout></layoutAssignments>
<layoutAssignments><layout>CustomerQuickQuestion__c-Customer Quick Question Layout</layout></layoutAssignments>
<layoutAssignments><layout>CustomerSafetyIssue__c-Customer Satisfaction Issue Layout</layout></layoutAssignments>
<layoutAssignments><layout>CustomerSatisfactionSurvey__c-CustomerSatisfactionSurvey Layout</layout></layoutAssignments>
<layoutAssignments><layout>CustomerVisitKPI__c-Customer Visit KPI Layout</layout></layoutAssignments>
<layoutAssignments><layout>Customer_Email_Domain__c-Customer Email Domain Layout</layout></layoutAssignments>
<layoutAssignments><layout>Customer_Satisfaction_Survey_Roles__c-Customer Satisfaction Survey Roles Layout</layout></layoutAssignments>
<layoutAssignments><layout>Customer_Voice__c-CNPS 2%2E0 Layout</layout></layoutAssignments>
<layoutAssignments><layout>DA_MergeAccountField__mdt-DA Merge Account Field Layout</layout></layoutAssignments>
<layoutAssignments><layout>DA_SelfScheduledBatch__mdt-Self-Scheduled Batch Info Layout</layout></layoutAssignments>
<layoutAssignments><layout>DBAdditionalInformation__c-D%26B Additional Information Layout</layout></layoutAssignments>
<layoutAssignments><layout>DOF_OpptyOwnerAssgnmntNonPlatformed__c-DOF Oppty Owner Assgnmnt Non Platformed Layout</layout></layoutAssignments>
<layoutAssignments><layout>DOF_potential_opportunity__c-Potential Opportunity Layout</layout></layoutAssignments>
<layoutAssignments><layout>DaUserInfo__c-Delegated Admin User Information Layout</layout></layoutAssignments>
<layoutAssignments><layout>DataTemplate__c-Data Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>Datapoint__c-Datapoint Layout</layout></layoutAssignments>
<layoutAssignments><layout>DebugLog__c-Debug Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>Decision__c-Decision Layout</layout></layoutAssignments>
<layoutAssignments><layout>Defect_OLD_DO_NOT_USE__c-Defect Layout</layout></layoutAssignments>
<layoutAssignments><layout>Defect__c-Defect Layout</layout></layoutAssignments>
<layoutAssignments><layout>DeploymentPlaybook__c-Deployment Playbook Layout</layout></layoutAssignments>
<layoutAssignments><layout>Deployment__c-Deployment Layout</layout></layoutAssignments>
<layoutAssignments><layout>DeviceType__c-Device Type Layout</layout></layoutAssignments>
<layoutAssignments><layout>DeviceTypesPerBrand__c-Device Types Per Brand Layout</layout></layoutAssignments>
<layoutAssignments><layout>DigitalToolsUserInformation__c-MySE User Information Layout</layout></layoutAssignments>
<layoutAssignments><layout>DirectAccountApprovalQueueMapping__c-Direct Account Approval Queue Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>Discount__c-Discount Layout</layout></layoutAssignments>
<layoutAssignments><layout>DiscussionTopic__c-Discussion Topic Layout</layout></layoutAssignments>
<layoutAssignments><layout>DistributorRetailerSKU__c-Distributor Retailer SKU Layout</layout></layoutAssignments>
<layoutAssignments><layout>DomainsOfExpertiseCatalog__c-DOE - Domains Of Expertise Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>DuplicateRecordItem-Duplicate Record Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>DuplicateRecordSet-Duplicate Record Set Layout</layout></layoutAssignments>
<layoutAssignments><layout>EA_ASP__c-EA ASP Layout</layout></layoutAssignments>
<layoutAssignments><layout>EA_Country_Security__c-EA Country Security Layout</layout></layoutAssignments>
<layoutAssignments><layout>EA_Geography_Mapping__c-EA Geography Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>EA_Mapping__c-EA Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>EA_Picklist_Mapping__c-EA Picklist Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>EA_RowLevelSecurity__c-EA RowLevelSecurity Layout</layout></layoutAssignments>
<layoutAssignments><layout>EUS_EndUserSupport__c-EUS - Layout</layout></layoutAssignments>
<layoutAssignments><layout>Eligible_Entity__c-Eligible Entity Layout</layout></layoutAssignments>
<layoutAssignments><layout>EmailMessage-Email Message Layout - Email-to-Case</layout></layoutAssignments>
<layoutAssignments><layout>EmailToCaseKeyword__c-KWD - Page Layout</layout></layoutAssignments>
<layoutAssignments><layout>EndUserSupportEscalationHistory__c-End User Support Escalation History Layout</layout></layoutAssignments>
<layoutAssignments><layout>EnergySupplySustainability__c-Energy Supply %26 Sustainability Layout</layout></layoutAssignments>
<layoutAssignments><layout>Entities__c-Entity Layout</layout></layoutAssignments>
<layoutAssignments><layout>EntityStakeholder__c-ESH - Entity Stakeholder Layout</layout></layoutAssignments>
<layoutAssignments><layout>Environment__c-Environment Layout</layout></layoutAssignments>
<layoutAssignments><layout>Event-EVT - Standard Layout</layout></layoutAssignments>
<layoutAssignments><layout>Exception__c-Exception Layout</layout></layoutAssignments>
<layoutAssignments><layout>ExpertInternalComment__c-Expert Internal Comment Layout</layout></layoutAssignments>
<layoutAssignments><layout>ExternalPropertiesCatalogType__c-External Systems Type Layout</layout></layoutAssignments>
<layoutAssignments><layout>ExternalPropertiesCatalog__c-External Properties Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>ExternalSECertification__c-External %26 SE Certification Layout</layout></layoutAssignments>
<layoutAssignments><layout>FPF_TechnicalReturn__c-FPF - Technical Return Layout</layout></layoutAssignments>
<layoutAssignments><layout>FSBAffectedProduct__c-FSB Affected Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>FSBTeam__c-FSB Team Layout</layout></layoutAssignments>
<layoutAssignments><layout>FSM_Rel_Cont_to_L__c-Related Contact to Location Layout</layout></layoutAssignments>
<layoutAssignments><layout>FSM_Rel_cont_to_CL__c-Related contact to Customer Location Layout</layout></layoutAssignments>
<layoutAssignments><layout>FailedCase__c-Failed Case Layout</layout></layoutAssignments>
<layoutAssignments><layout>FailedEmailMessage__c-Failed Email Message Layout</layout></layoutAssignments>
<layoutAssignments><layout>FeatureCatalog__c-FEC - Standard Layout</layout></layoutAssignments>
<layoutAssignments><layout>FeatureRequirement__c-FER - Standard Layout</layout></layoutAssignments>
<layoutAssignments><layout>FeedItem-Feed Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>Feedback__c-Feedback Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieldServiceBulletin__c-Field Service Bulletin - Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieldValue__c-Field Value Layout</layout></layoutAssignments>
<layoutAssignments><layout>Field__c-Text Field Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__ChallengeMember__c-Challenge Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__ChallengeMissionMember__c-Challenge Mission Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__ChallengeMission__c-Challenge Mission Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__ChallengeReward__c-FieloCH__Challenge Reward Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__ChallengeTag__c-FieloCH__Challenge Tag Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__Challenge__c-Challenge Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__MissionChallenge__c-FieloCH__Mission Challenge Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__MissionCriteria__c-FieloCH__Mission Criteria Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__Mission__c-FieloCH__Mission Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__TeamChallenge__c-Team Challenge Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__TeamMember__c-Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCH__Team__c-Team Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCRUD__ListViewAction__c-FieloCRUD__Record Row Action</layout></layoutAssignments>
<layoutAssignments><layout>FieloCRUD__ListView__c-List View</layout></layoutAssignments>
<layoutAssignments><layout>FieloCRUD__ObjectSettings__c-Object Settings</layout></layoutAssignments>
<layoutAssignments><layout>FieloCRUD__PageComponent__c-Field</layout></layoutAssignments>
<layoutAssignments><layout>FieloCRUD__PageCustomButton__c-FieloCRUD__Page Custom Button</layout></layoutAssignments>
<layoutAssignments><layout>FieloCRUD__PageLayout__c-Page Layout Standard</layout></layoutAssignments>
<layoutAssignments><layout>FieloCRUD__PageSection__c-Page Section</layout></layoutAssignments>
<layoutAssignments><layout>FieloCRUD__RelatedDetailsFields__c-FieloCRUD__Standard Related Details Field Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloCRUD__RelatedView__c-FieloCRUD__CRUD Related View Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloDRE__RuleApplied__c-Fielo Rule Applied Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Agreement__c-FieloEE__Agreement Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__BadgeMember__c-BadgeMember Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Badge__c-FieloEE__Badge Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Banner__c-Banner</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Branch__c-FieloEE__Branch Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Category__c-Category Group</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Code__c-FieloEE__Code Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Comment__c-FieloEE__Comments Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Component__c-Banner</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__EmailCampaign__c-FieloEE__Email Campaign Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Email__c-FieloEE__Email Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__ErrorLog__c-Custom Error Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Event__c-Event Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__LevelCriteria__c-FieloEE__Level Criteria Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Level__c-FieloEE__Level Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Like__c-FieloEE__Like Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__MemberSegment__c-Custom Member Segment Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Member__c-Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Menu__c-menu2</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__News__c-News Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__PointAudit__c-FieloEE__Point Audit Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Point__c-FieloEE__Formato de Point</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__PreviewSettings__c-FieloEE__Preview Settings Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__ProgramLayout__c-FieloEE__Program Layout Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Program__c-Program Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__PromotionRule__c-FieloEE__Formato de Fielo PromotionRule</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Promotion__c-Standard Promotion</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__RedemptionItem__c-Formato de Order Item</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__RedemptionRuleCriteria__c-FieloEE__Redemption Criteria Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__RedemptionRule__c-Dynamic</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Redemption__c-Formato de Redemption</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__RewardItem__c-FieloEE__Formato de Item</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__RewardLike__c-FieloEE__PrizeReview Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__RewardTag__c-FieloEE__Prize_PrizeTag Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__RewardWish__c-FieloEE__Participant Prize Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Reward__c-Reward Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__RuleAction__c-FieloEE__Formato de Action</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__RuleCriteria__c-FieloEE__Formato de RuleEntry</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Rule__c-Standard Rule</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Section__c-Fielo - Section - Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__SegmentDomain__c-FieloEE__Segment Domain Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__TagItem__c-FieloEE__Tag Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Tag__c-Standard Tag</layout></layoutAssignments>
<layoutAssignments><layout>FieloEE__Transaction__c-Formato de Transaction</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_BadgeAccount__c-Badge Account Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_BadgeFeature__c-Badge Feature Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_BadgeMemberHistory__c-Badge Member History Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_BatchManagementConfiguration__c-Batch Management Configuration Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_BatchManagementView__c-Batch Management View Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_EventCatalog__c-Event Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_Feature__c-Feature Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_InvoiceDetail__c-PRM Invoice Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_Invoice__c-PRM Invoice Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_LoyaltyEligibleProduct__c-PRM Loyalty Eligible Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_MemberFeatureDetail__c-Level</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_MemberFeature__c-Member Feature Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_MemberUpdateHistory__c-Member Update History Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_PartnerLocatorConfiguration__c-Partner Locator Configuration Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_ProductPointList__c-Point List Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloPRM_ProductPointValue__c-PRM Product Point Value Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloSVY__SurveyQuestion__c-FieloSVY__Survey Question Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloSVY__SurveyResponseQuestion__c-FieloSVY__Survey Response Question Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloSVY__SurveyResponse__c-FieloSVY__Survey Response Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloSVY__SurveyTag__c-FieloSVY__Survey Tag Layout</layout></layoutAssignments>
<layoutAssignments><layout>FieloSVY__Survey__c-FieloSVY__Survey Layout</layout></layoutAssignments>
<layoutAssignments><layout>Fielo_CRUDObjectSettings__c-CRUD Object Settings Layout</layout></layoutAssignments>
<layoutAssignments><layout>Fielo_InvoiceDetails__c-Fielo - Invoice Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>Fielo_Invoice__c-Fielo - Invoice Layout</layout></layoutAssignments>
<layoutAssignments><layout>Fielo_ListView__c-List</layout></layoutAssignments>
<layoutAssignments><layout>Fielo_LoyaltyEligibleProduct__c-Fielo - Loyalty Eligible Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>Fielo_PageComponent__c-Blank Space</layout></layoutAssignments>
<layoutAssignments><layout>Fielo_PageLayout__c-Page Layout Layout</layout></layoutAssignments>
<layoutAssignments><layout>Fielo_PageSection__c-Page Section Layout</layout></layoutAssignments>
<layoutAssignments><layout>Floorwalking__c-Support Request %2F Floorwalking Layout</layout></layoutAssignments>
<layoutAssignments><layout>FlowInterview-Flow Interview Layout</layout></layoutAssignments>
<layoutAssignments><layout>GCSSite__c-Administrator - Site Layout</layout></layoutAssignments>
<layoutAssignments><layout>Global-Global Layout</layout></layoutAssignments>
<layoutAssignments><layout>GroupAccountTeamMember__c-Group Account Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>GroupAccountTeam__c-Group Account Team Layout</layout></layoutAssignments>
<layoutAssignments><layout>HabilitationRequirement__c-Account Layout</layout></layoutAssignments>
<layoutAssignments><layout>Hotfix_With_Component__c-Hotfix With Component Layout</layout></layoutAssignments>
<layoutAssignments><layout>Hotfix__c-Hotfix Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSApplicationsMapping__c-IDMSApplicationsMapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSCompanyReconciliationBatchHandler__c-IDMSCompanyReconciliationBatchHandler Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSErrorLog__mdt-IDMSErrorLog Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSGenerateUser__c-IDMSGenerateUser Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSPRMTrustMapping__mdt-IDMS PRM Trust Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSReconciliationBatchLog__c-IDMSReconciliationBatchLog Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSSupportLog__c-IDMSSupportLog Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSUIMSResponse__c-IDMSUIMSResponse Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSUserAIL__c-IDMS User AIL Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSUserCompanyReLinkBatchHandler__c-IDMSUserCompanyReLinkBatchHandler Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSUserInvitation__c-IDMSUserInvitation Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSUserJourney__c-IDMS User Journey</layout></layoutAssignments>
<layoutAssignments><layout>IDMSUserMaping__mdt-IDMS User Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMSUserReconciliationBatchHandler__c-IDMSUserReconciliationBatchHandler Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_ApplicationBrandingMatrix__mdt-IDMS Application Baranding Matrix Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_ApplicationMapping__mdt-IDMSApplicationMapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_EmailMapping__mdt-IDMS_EmailMapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_Email_Log__c-IDMS Email Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_ErrorLog__c-IDMS_ErrorLog Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_GDPRImplementation__mdt-IDMS_GDPRImplementation Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_Language_Matrix__mdt-IDMS Language Matrix Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_Locale_Matrix__mdt-IDMS Locale Matrix Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_SML__c-IDMS SML Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_Send_Invitation__c-IDMS Send Invitation Layout</layout></layoutAssignments>
<layoutAssignments><layout>IDMS_Social_Access__c-IDMS Social Access Layout</layout></layoutAssignments>
<layoutAssignments><layout>IPOLightRITE__c-IPO Light RITE Layout</layout></layoutAssignments>
<layoutAssignments><layout>IP_Hazard__c-IP Hazard Layout</layout></layoutAssignments>
<layoutAssignments><layout>ITB_Activity__c-ITB Activity Layout</layout></layoutAssignments>
<layoutAssignments><layout>ITB_Asset__c-AST - ITB Asset Layout</layout></layoutAssignments>
<layoutAssignments><layout>ITB_Entitlement__c-ENT - ITB Entitlement Layout</layout></layoutAssignments>
<layoutAssignments><layout>ITB_Warranty__c-WAR - ITB Warranty Layout</layout></layoutAssignments>
<layoutAssignments><layout>Idea-Idea Layout</layout></layoutAssignments>
<layoutAssignments><layout>Idms_Application_Hash__c-Idms Application Hash Layout</layout></layoutAssignments>
<layoutAssignments><layout>ImpactedInstalledProductFollowup__c-Impacted Installed Product Follow-up Layout</layout></layoutAssignments>
<layoutAssignments><layout>Impacted_Installed_Product__c-Impacted Installed Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>Individual-Individual Layout</layout></layoutAssignments>
<layoutAssignments><layout>IndustryMembership__c-IM - Industry Membership Layout</layout></layoutAssignments>
<layoutAssignments><layout>InfoQualifContact__c-Info France %28Contact%29 Layout</layout></layoutAssignments>
<layoutAssignments><layout>InfoQualif__c-Info France %28Account%29 Layout</layout></layoutAssignments>
<layoutAssignments><layout>InquiraFAQ__c-Inquira FAQ Layout</layout></layoutAssignments>
<layoutAssignments><layout>InstalledProductOnOpportunityNotif__c-Installed Product On Opportunity Notif Layout</layout></layoutAssignments>
<layoutAssignments><layout>InstalledProductOnOpportunity__c-Installed Product on Opportunity Layout</layout></layoutAssignments>
<layoutAssignments><layout>Installed_product_on_Opportunity_Line__c-Associated Installed Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>IntegrationCalloutEvent__c-IntegrationCalloutEvent Layout</layout></layoutAssignments>
<layoutAssignments><layout>IntegrationSimpleEvent__c-Integration Simple Event Layout</layout></layoutAssignments>
<layoutAssignments><layout>InterestAmountOnOpportunityNotif__c-Interest Amount Layout</layout></layoutAssignments>
<layoutAssignments><layout>InterestOnOpportunityNotif__c-Interest Layout</layout></layoutAssignments>
<layoutAssignments><layout>InvolvedOrganizationStakeholder__c-Involved Organization Stakeholder Layout</layout></layoutAssignments>
<layoutAssignments><layout>InvolvedOrganization__c-Involved Organization Layout</layout></layoutAssignments>
<layoutAssignments><layout>Issues_Risks__c-Issue</layout></layoutAssignments>
<layoutAssignments><layout>JctAssetLink__c-Asset Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>KnowledgeApprovalMatrix__c-KB Approval Matrix Layout</layout></layoutAssignments>
<layoutAssignments><layout>KnowledgeProduct__c-Related Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>KnowledgeSupportingInformation__c-Supporting Information Layout</layout></layoutAssignments>
<layoutAssignments><layout>KnowledgeTemplates__c-Knowledge Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>Knowledge__kav-Knowledge Layout</layout></layoutAssignments>
<layoutAssignments><layout>Lead-LED - Lead Layout</layout></layoutAssignments>
<layoutAssignments><layout>LeadValueChainPlayer__c-Value Chain Player Layout</layout></layoutAssignments>
<layoutAssignments><layout>LegacyAccount__c-Legacy Account Layout</layout></layoutAssignments>
<layoutAssignments><layout>LinkedArticle-Linked Article Layout</layout></layoutAssignments>
<layoutAssignments><layout>ListEmail-List Email Layout</layout></layoutAssignments>
<layoutAssignments><layout>LiteratureRequestLineItem__c-LiteratureRequest Line Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>LiteratureRequest__c-LTR - Literature Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>LiveAgentSession-Live Agent Session Layout</layout></layoutAssignments>
<layoutAssignments><layout>LiveAgent_ExtRoutingRule__c-External Chat Routing Rules Layout</layout></layoutAssignments>
<layoutAssignments><layout>LiveChatTranscript-Live Chat Transcript Layout</layout></layoutAssignments>
<layoutAssignments><layout>LiveChatTranscriptActive-Live Chat Transcript %28In Progress%29 Layout</layout></layoutAssignments>
<layoutAssignments><layout>LiveChatTranscriptEvent-Live Chat Transcript Event Layout</layout></layoutAssignments>
<layoutAssignments><layout>LiveChatTranscriptWaiting-Live Chat Transcript %28Waiting%29 Layout</layout></layoutAssignments>
<layoutAssignments><layout>LiveChatVisitor-Live Chat Visitor Layout</layout></layoutAssignments>
<layoutAssignments><layout>LocalAttributeCountry__c-Local Attribute Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>LocalAttribute__c-Local Attribute Layout</layout></layoutAssignments>
<layoutAssignments><layout>LocalizedFSB__c-Localized FSB Layout</layout></layoutAssignments>
<layoutAssignments><layout>Location_Hazard__c-Location Hazard Layout</layout></layoutAssignments>
<layoutAssignments><layout>MKT_LeadManagement__mdt-MKT_LeadManagement Layout</layout></layoutAssignments>
<layoutAssignments><layout>Macro-Macro Layout</layout></layoutAssignments>
<layoutAssignments><layout>MarketSegmentCatalog__c-Market Segment Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>MarketingCallbackLimit__c-MCL - Marketing Callback Limit Layout</layout></layoutAssignments>
<layoutAssignments><layout>MemberExternalProperties__c-MemberExternalProperties Layout</layout></layoutAssignments>
<layoutAssignments><layout>MemberHistoryTracking__c-Member History Tracking Layout</layout></layoutAssignments>
<layoutAssignments><layout>Member_History_Field__mdt-Member History Field Layout</layout></layoutAssignments>
<layoutAssignments><layout>MembershipCatalog__c-MC - Membership Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>MergeRequest__c-Merge Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>Merge_Installed_Product__c-Merge Installed Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>Milestone__c-Milestone Layout</layout></layoutAssignments>
<layoutAssignments><layout>Multi_Platforms__c-Multi-Platform Layout</layout></layoutAssignments>
<layoutAssignments><layout>MyFSFilter__c-MyFSFilter Layout</layout></layoutAssignments>
<layoutAssignments><layout>MySEChampionMapping__c-MySE Admin Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>MySEUserActivityTrack__c-mySE User Activity Track Layout</layout></layoutAssignments>
<layoutAssignments><layout>OFMFPF__c-OFM FPF Layout</layout></layoutAssignments>
<layoutAssignments><layout>OIC_Quadruplet__c-OIC Quadruplet Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_ContractLink__c-Contract Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_DeliveryDetails__c-Delivery Details Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_OpportunityCompetitor__c-OCR - Opportunity Competitor Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_OpportunityLineCompetitor__c-Opportunity Line Competitor Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_OrderLink__c-ORL - Order Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_ProductLine__c-PRL - Parent Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_Product__c-PRD - Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_ProjectSpecificInformation__c-Master Project Specific Information Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_ProjectTeam__c-Master Project Team Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_Project__c-Master Project Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_QuoteLink__c-QLK - Quote Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_SalesContributor__c-SCO - Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_SellingCenter__c-SLC - Selling Center Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_SupportRequest__c-SRQ - Selling Center Support Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPP_ValueChainPlayers__c-VCP - Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPQ_AssessmentQuestion__c-ASQ - Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPQ_AssessmentSection__c-ASC - Layout</layout></layoutAssignments>
<layoutAssignments><layout>OPQ_OpportunityQuestion__c-OPQ - Opportunity Question Layout</layout></layoutAssignments>
<layoutAssignments><layout>ORFFieldsConfiguration__c-ORF Field Configuration Layout</layout></layoutAssignments>
<layoutAssignments><layout>ORFwithOpportunities__c-ORF with Opportunities Layout</layout></layoutAssignments>
<layoutAssignments><layout>OSACMeeting__c-OSAC Meeting Layout</layout></layoutAssignments>
<layoutAssignments><layout>OSAProblemAlerts__c-OSA Problem Alerts Layout</layout></layoutAssignments>
<layoutAssignments><layout>ObjectSync__c-Object Sync Layout</layout></layoutAssignments>
<layoutAssignments><layout>ObjectivesDetail__c-OBD - Monthly Layout</layout></layoutAssignments>
<layoutAssignments><layout>ObjectivesSettings__c-OBS - Layout</layout></layoutAssignments>
<layoutAssignments><layout>OdasevaArchivingCaseHierarchy__c-OdasevaArchivingCaseHierarchy Layout</layout></layoutAssignments>
<layoutAssignments><layout>OdasevaArchivingLog__c-OdasevaArchivingLog Layout</layout></layoutAssignments>
<layoutAssignments><layout>OfmCountry__c-Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>OppAgreement__c-AGR - Frame Agreement Layout</layout></layoutAssignments>
<layoutAssignments><layout>Opportunity-OPP_SOL - Stage 3 Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityAccountChallenge__c-Opportunity Account Challenge Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityAssessmentAnswer__c-Opportunity Assessment Answer Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityAssessmentQuestion__c-Opportunity Assessment Question Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityAssessmentResponse__c-Opportunity Assessment Response Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityAssessment__c-Opportunity Assessment Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityEcoStruxureLayer__mdt-Opportunity EcoStruxure Layer Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityEcoStruxureRule__mdt-Opportunity EcoStruxure Rule Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityLineItem-Opportunity Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityNotification__c-Opportunity Notification Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityRegistrationForm__c-ORF Internal Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityRegistrationProducts__c-ORF Products - Internal Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunitySplit-Opportunity Split Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpportunityTeamMember-Opportunity Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpptyAmountThreshold__c-Oppty Amount Threshold Layout</layout></layoutAssignments>
<layoutAssignments><layout>OpptyOwnerDefaultAssignment__c-OpptyOwnerDefaultAssignment Layout</layout></layoutAssignments>
<layoutAssignments><layout>OptyComplexityAssignmentRule__c-Opty Complexity Calculation Layout</layout></layoutAssignments>
<layoutAssignments><layout>OptyOwnerRoutingRule__c-OptyOwnerRoutingRule Layout</layout></layoutAssignments>
<layoutAssignments><layout>OrganizationStakeholdersForCR__c-Organization Stakeholders for CR Layout</layout></layoutAssignments>
<layoutAssignments><layout>PAMandCompetition__c-PAC - Layout</layout></layoutAssignments>
<layoutAssignments><layout>PAN_Notes_Database__c-PAN - Notes Database Layout</layout></layoutAssignments>
<layoutAssignments><layout>PCT_Questions__c-Project Categorization Questions Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Audit_Product__c-PITCHER_Q__Audit Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Audit_Question_Translation__c-PITCHER_Q__Question Translation Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Audit_Questions__c-PITCHER_Q__Sub Question Edit</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Audit_Response_Item__c-PITCHER_Q__Audit Response Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Audit_Response__c-PITCHER_Q__Audit Response Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Audit_Template_Question__c-PITCHER_Q__Audit Template Question Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Audit_Template__c-PITCHER_Q__Audit Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Pitcher_Campaign_Member__c-PITCHER_Q__Pitcher Campaign Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Pitcher_Campaign__c-PITCHER_Q__Pitcher Campaign Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER_Q__Product_Category__c-PITCHER_Q__Product Category Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER__Discussion_Item_Discussed__c-PITCHER__Discussion Item Discussed Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER__Discussion_Item__c-PITCHER__Discussion Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER__Pitcher_Activity__c-PITCHER__Pitcher Activity Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER__Pitcher_Content__c-PITCHER__Pitcher Content Layout</layout></layoutAssignments>
<layoutAssignments><layout>PITCHER__Pitcher_Presentation__c-PITCHER__Pitcher Presentation Layout</layout></layoutAssignments>
<layoutAssignments><layout>PIT_SCH__Account_Extension__c-PIT_SCH__Pitcher Account Extension Layout</layout></layoutAssignments>
<layoutAssignments><layout>PIT_SCH__Affiliation__c-PIT_SCH__Affiliation Layout</layout></layoutAssignments>
<layoutAssignments><layout>PIT_SCH__Audit_Response_Item__c-PIT_SCH__Audit Response Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>PIT_SCH__Audit_Response__c-PIT_SCH__Audit Response Layout</layout></layoutAssignments>
<layoutAssignments><layout>PIT_SCH__Company__c-PIT_SCH__Company Layout</layout></layoutAssignments>
<layoutAssignments><layout>PIT_SCH__Line_of_Equipment__c-PIT_SCH__Line of Equipment Layout</layout></layoutAssignments>
<layoutAssignments><layout>PIT_SCH__Reference_Attribute__c-PIT_SCH__Reference Attribute Layout</layout></layoutAssignments>
<layoutAssignments><layout>PIT_SCH__SKU__c-PIT_SCH__Reference Layout</layout></layoutAssignments>
<layoutAssignments><layout>PIT_SCH__Supplier__c-PIT_SCH__Pitcher Supplier Layout</layout></layoutAssignments>
<layoutAssignments><layout>PLOperationHours__c-PLOperationHours Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMAccountBoxFolder__c-PRM Account Box Folder Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMAccountChannelChangeHistory__c-PRM Account Channel Change History Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMAccountOwnerAssignment__c-PRM Account Owner Assignment Rule Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMActivityTracking__c-PRM Activity Tracking Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMAttachments__c-PRM Attachments Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMBadgeBFOProperties__c-PRMBadgeBFOProperties Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMBoxFolder__c-PRM Box Folder Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMCertificationCatalog__c-Certification Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMChannelAccount__c-PRM Channel Account Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMChatComponentConfiguration__c-Chat Configuration Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMCockpitComponentConfiguration__c-PRMCockpitComponent Configuration Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMCockpitElementConfiguration__c-PRM CockpitElementConfiguration Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMConfigureEmailNotifications__c-PRM Configure Email Notification Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMCountryLanguageCodeMap__mdt-PRMCountryLanguageCodeMap Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMCountry__c-PRM Country Cluster Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMDistributorCatalog__c-PRM Distributor Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMDistributor__c-PRM Distributor Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMExternalPropertyEvent__c-External Propertiy Event Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMExternalQueryInfo__c-PRM External Query Information Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMFrontEndLabels__c-PRM Partner Facing Front-end Labels Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMGroupAccProcessLog__c-PRM Group Account Process Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMLovsValues__c-PRM Lovs Value Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMLovs__c-PRM List of Values Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMMunchkinCodeConfig__mdt-PRM Munchkin Code Setting Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMPartnerMigration__c-PRM Partner Migration Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMPermissionSetTracking__c-PRM Permission Set Tracking Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMPrivacyLinks__mdt-PRM Privacy Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMProfileConfigInfo__c-PRM Profile Config Info Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMProfileConfig__c-Channel Progressive Profile Form</layout></layoutAssignments>
<layoutAssignments><layout>PRMPublishingSettings__mdt-PRM Publishing Setting Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMReactivationEmailHistory__c-PRM Reactivation Email History Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMRequestQueue__c-PRM Request Queue Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMRewardRedemptionShippedAddress__c-PRM Redemption Address Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMRewardRedemptionShippingAddress__c-Redemption Shipping Address Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMTechnicalMergeHistory__c-PRM Technical Merge History Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMTermsAndConditions__mdt-PRMOriginSource TnC Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMTnCHistory__c-Terms And Conditions History Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRMTransactionCatalog__c-Transaction Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRM_PAN_Request__c-PRM PAN Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRM_PCGroupNotificationFrequencyMap__mdt-PRM PC Group Notification Frequency Map Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRM_SST_Conf__c-BslScope Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRM_Technical_Login_History__c-PRM Technical Login History Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRM_Technical_Merge_Record__c-PRM Technical Merge Record Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRM_Technical_Partner_Record__c-PRM Technical Partner Record Layout</layout></layoutAssignments>
<layoutAssignments><layout>PRM_UploadFileExtensions__mdt-PRM Upload File Extension Layout</layout></layoutAssignments>
<layoutAssignments><layout>PS_OLH__Chat__c-PS_OLH__OLH Chat Layout</layout></layoutAssignments>
<layoutAssignments><layout>PS_OLH__Config__c-PS_OLH__OLH Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>PS_OLH__Mail__c-PS_OLH__OLH Mail Layout</layout></layoutAssignments>
<layoutAssignments><layout>PS_OLH__Mapping__c-PS_OLH__OLH Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>PackageTemplateCountry__c-PKC - General Layout</layout></layoutAssignments>
<layoutAssignments><layout>PackageTemplate__c-PKT - General Layout</layout></layoutAssignments>
<layoutAssignments><layout>Package__c-PKG %3A General Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerAccessibleListViewConfig__c-Partner Accessible List View Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerAccessibleListViewTranslation__c-Partner Accessible Listview Translation Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerAssessment__c-Account Program Assessments%2FApplication Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerFundAllocation-Partner Fund Allocation Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerFundClaim-Partner Fund Claim Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerFundRequest-Partner Fund Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerLocator__c-Partner Locator Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerMarketingBudget-Partner Marketing Budget Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerOpportunityStatusHistory__c-Partner Opportunity Status History Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerProgramClassification__c-Partner Program Classification Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerProgramCountries__c-Partner Program Countries Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerProgramMarket__c-Partner Program Market Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerProgram__c-PRG - Global Partner Program Layout</layout></layoutAssignments>
<layoutAssignments><layout>PartnerRequest__c-Partner Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>Parts_Order_Case_to_WO__c-Parts Order Case to WO Layout</layout></layoutAssignments>
<layoutAssignments><layout>PerformanceTestRequest__c-Performance Test Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>PermissionSetAssignmentRequests__c-Permission Set Assignment Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>PermissionSetGroup__c-Permission Set Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>PersonAccount-Person Account Layout</layout><recordType>PersonAccount.PersonAccount</recordType></layoutAssignments>
<layoutAssignments><layout>Plant__c-Plant Layout</layout></layoutAssignments>
<layoutAssignments><layout>PointOfContact__c-Point Of Contact Layout</layout></layoutAssignments>
<layoutAssignments><layout>PointsRegistrationHistory__c-Points Registration History Layout</layout></layoutAssignments>
<layoutAssignments><layout>Pre_study__c-Pre-study Layout</layout></layoutAssignments>
<layoutAssignments><layout>PreferredSupport__c-Preferred Support Layout</layout></layoutAssignments>
<layoutAssignments><layout>PreventiveAction__c-PRA- Schneider Preventive Action Layout</layout></layoutAssignments>
<layoutAssignments><layout>Pricebook2-Price Book Layout</layout></layoutAssignments>
<layoutAssignments><layout>PricebookEntry-Price Book Entry Layout</layout></layoutAssignments>
<layoutAssignments><layout>PrivateTestObject__c-PrivateTestObject Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProblemCaseLink__c-PCL - Problem To Case Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProblemCaseUnifiedLink__c-Problem-Case Unified Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProblemComplaintRequestLink__c-Problem-Complaint Request Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProblemStakeHolder__c-Problem Notifier Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProblemTEXlink__c-Problem-TEX link Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProblemTeamMember__c-PTM - Problem Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>Problem__c-PRB - Schneider Problem Page Layout</layout></layoutAssignments>
<layoutAssignments><layout>Process_Stream__c-Process Stream Layout</layout></layoutAssignments>
<layoutAssignments><layout>Product2-Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProductCharacteristics__c-Product Characteristics Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProductLineCatalog__c-Product Line Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProductLineCompetitor__c-PLC - Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProductLineForAgreement__c-PLA - Agreement Product Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProductLineQualityContactMapping__c-Product Line Quality Contact Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProductUserAccess__c-ProductUserAccess Layout</layout></layoutAssignments>
<layoutAssignments><layout>Product_Quality_Alert__c-Product Quality Alert Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProfessionalMembership__c-Professional Membership Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProgramChangeRequest__c-PCR - Program Change Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProgramDomainsOfExpertise__c-PDE - Program Domains Of Expertise Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProgramFeature__c-PRF - Global Feature Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProgramLevelBrand__c-Program Level Brand Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProgramLevel__c-PRL - Global Program Level Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProgramProduct__c-Program Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>ProgramRequirement__c-PRR - Activity Requirement Layout</layout></layoutAssignments>
<layoutAssignments><layout>Program__c-Program Update Layout</layout></layoutAssignments>
<layoutAssignments><layout>Project__c-Project Layout</layout></layoutAssignments>
<layoutAssignments><layout>PsGroupMember__c-Permission Set Group Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>PublishPRMContent__c-Publish PRM Content Layout</layout></layoutAssignments>
<layoutAssignments><layout>QOTW__c-Quick Question Layout</layout></layoutAssignments>
<layoutAssignments><layout>QuestionTemplate__c-Question Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>QuickText-Quick Text Layout</layout></layoutAssignments>
<layoutAssignments><layout>REF_OrganizationRecord__c-Organization Record Layout</layout></layoutAssignments>
<layoutAssignments><layout>REF_RoutingBOBS__c-Routing BO - BS Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_BankGuarantee__c-BGT - Bank Guarantee Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_BudgetLine__c-Budget Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_Budget__c-BUD - Budget Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_CommCompEnv__c-CCE - Commercial and competitive environments Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_Consortium__c-CON - Consortium Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_ContractualEnv__c-CTE - Contractual Environment Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_FinancialEnv__c-FIN - Financial Environment Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_LiquidatedDamages__c-LQD - Liquidated Damages Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_ProjectInformation__c-PRI - Project Information Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_ProjectManagement__c-PRM - Project Management Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_Risks__c-RSK - Proj Mgnt Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_SMETeam__c-RITE - SME Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_SubContractOGSupp__c-SCO - Sub Contractors - OG Suppliers Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_TechManScope__c-TMS - Technical - Manufacturing - Scope Layout</layout></layoutAssignments>
<layoutAssignments><layout>RIT_TermsAndMeansOfPayment__c-TMP - Terms And Means Of Payment Layout</layout></layoutAssignments>
<layoutAssignments><layout>RMAShippingToAdmin__c-RMA Shipping To Admin Layout</layout></layoutAssignments>
<layoutAssignments><layout>RMA_Product__c-Return Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>RMA__c-Return Management Authorization Layout</layout></layoutAssignments>
<layoutAssignments><layout>RPDR_Country__c-RPDR Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>RPDR_Product__c-RPDT Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>RangesPerDeviceAndBrand__c-Ranges Per Device and Brand Layout</layout></layoutAssignments>
<layoutAssignments><layout>ReadOnlyTestObject__c-ReadOnlyTestObject Layout</layout></layoutAssignments>
<layoutAssignments><layout>Record__c-Record Layout</layout></layoutAssignments>
<layoutAssignments><layout>ReferentialDataError__c-Referential Data Errors Layout</layout></layoutAssignments>
<layoutAssignments><layout>ReferentialDataMapping__c-Referential Data Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>RelatedOrganizationtoNotifyofXA__c-Related Organization to Notify of XA Layout</layout></layoutAssignments>
<layoutAssignments><layout>RelatedSymptom__c-Complaint Request Related Symptom Layout</layout></layoutAssignments>
<layoutAssignments><layout>Relationship_Suite__c-Relationship Suite Layout</layout></layoutAssignments>
<layoutAssignments><layout>Release__c-Master Release Layout</layout></layoutAssignments>
<layoutAssignments><layout>ReportingSDH__c-ReportingSDH Layout</layout></layoutAssignments>
<layoutAssignments><layout>Request__c-Change Request</layout></layoutAssignments>
<layoutAssignments><layout>Request_for_Analysis__c-Request for Analysis Layout</layout></layoutAssignments>
<layoutAssignments><layout>Request_work_in_progress__c-Request %28work in progress%29</layout></layoutAssignments>
<layoutAssignments><layout>Requested_Product__c-Requested Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>RequiredServiceSparePart__c-Required Service Spare Parts Layout</layout></layoutAssignments>
<layoutAssignments><layout>RequirementCatalog__c-REQ - Activity Requirement Layout</layout></layoutAssignments>
<layoutAssignments><layout>RequirementCertification__c-Requirement Certification Layout</layout></layoutAssignments>
<layoutAssignments><layout>RequirementSpecialization__c-Requirement Specialization Layout</layout></layoutAssignments>
<layoutAssignments><layout>ResolutionOptionAndCapabilities__c-Resolution Options and Capabilities Layout</layout></layoutAssignments>
<layoutAssignments><layout>ReturnItemsApprovalMatrix__c-Return Items Approval Matrix Layout</layout></layoutAssignments>
<layoutAssignments><layout>Revenue_Line__c-ITB Revenue Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>Role__c-Installed Product - Account Role Layout</layout></layoutAssignments>
<layoutAssignments><layout>RootCause__c-RTC- Schneider RootCause Layout</layout></layoutAssignments>
<layoutAssignments><layout>SBC_Mappings__mdt-SBC Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>SECCustomerExtension__c-SEC Customer Extension Layout</layout></layoutAssignments>
<layoutAssignments><layout>SECStaffExtension__c-SEC Staff Extension Layout</layout></layoutAssignments>
<layoutAssignments><layout>SEProblemSupplierProblemLink__c-SE Problem - Supplier Problem Link Layout</layout></layoutAssignments>
<layoutAssignments><layout>SE_Territory__c-TER- Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFE_AccPlan__c-APL - Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFE_CoachingVisitForm__c-CVF - Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFE_EstimatedPlannedSales__c-EPS - Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFE_IndivCAP__c-CAP - Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFE_PlatformingScoring__c-SCO - Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFE_Potential__c-APP - Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFGA__Ad_Group__c-SFGA__Ad Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFGA__Google_Campaign__c-SFGA__Google Campaign Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFGA__Keyword__c-SFGA__Keyword Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFGA__Search_Phrase__c-SFGA__Search Phrase Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFGA__Text_Ad__c-SFGA__Text Ad Layout</layout></layoutAssignments>
<layoutAssignments><layout>SFGA__Version_33_0_3__c-SFGA__Kieden Version Layout</layout></layoutAssignments>
<layoutAssignments><layout>SOC_Actions__c-SOC Actions Layout</layout></layoutAssignments>
<layoutAssignments><layout>SOC_Minutes__c-SOC Minutes Layout</layout></layoutAssignments>
<layoutAssignments><layout>SOC_Team__c-SOC Team Layout</layout></layoutAssignments>
<layoutAssignments><layout>SOSSession-SOS Session Layout</layout></layoutAssignments>
<layoutAssignments><layout>SOSSessionActivity-SOS Session Activity Layout</layout></layoutAssignments>
<layoutAssignments><layout>SPAPricingDeskMember__c-SPA Pricing Desk Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>SPAQuotaQuarter__c-SPA Quota Quarter Layout</layout></layoutAssignments>
<layoutAssignments><layout>SPAQuota__c-SPA Quota Layout</layout></layoutAssignments>
<layoutAssignments><layout>SPARequestLineItem__c-SPA Request Line Item - Commercial Reference Layout</layout></layoutAssignments>
<layoutAssignments><layout>SPARequestPricingDeskMember__c-SPA Request Pricing Desk Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>SPARequest__c-SPA Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>SPASalesGroup__c-SPA Sales Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>SPAThresholdAmount__c-SPA Threshold Amount Layout</layout></layoutAssignments>
<layoutAssignments><layout>SPAThresholdDiscount__c-SPA Threshold Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC_ApplicableProduct__c-Applicable Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC_Time_Entry_Request__c-Time Entry Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC_Time_Entry__c-Time Entry Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC_Timesheet__c-Timesheet Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Activity_Master__c-SVMXC__Activity Master Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Activity_Product__c-SVMXC__Activity Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Allocated_Stock__c-SVMXC__Allocated Stock Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Booking_Window__c-SVMXC__Booking Access</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Case_Line__c-SE Case Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Case_Tracker__c-SVMXC__Case Tracker Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Checklist__c-SVMXC__Checklist Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Code_Snippet_Manifest__c-SVMXC__Code Snippet Manifest Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Code_Snippet__c-SVMXC__Code Snippet Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Config_Change_Detail__c-SVMXC__Config Change Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Counter_Details__c-SVMXC__Counter Definition Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Counter_Rollup__c-SVMXC__Counter Rollup Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Custom_Coverage__c-SVMXC__Custom Coverage Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Dependency_Management__c-SVMXC__Dependency Management Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Dispatcher_Access__c-SVMXC__Dispatcher Access Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Doc_Template_Details__c-SVMXC__Doc Template Details Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Doc_Template__c-SVMXC__Doc Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Down_Time__c-SVMXC__Down Time Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Entitlement_History__c-SVMXC__Entitlement History Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Expense_Pricing__c-SVMXC__Expense Pricing Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Field_Cache__c-SVMXC__Field Cache Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Function_Definition__c-SVMXC__Macro Definition Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__IOTConfiguration__c-SVMXC__IOTConfiguration Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Installed_Product__c-SE - Installed Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Labor_Pricing__c-SVMXC__Labor Pricing Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Mileage_Tiers__c-SVMXC__Mileage Tier Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Object_Cache__c-SVMXC__Object Cache Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Offline_Dataset_Expression__c-SVMXC__Offline_Dataset_Expression Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Offline_Log__c-SVMXC__Offline Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Offline_Object__c-SVMXC__Offline Objects Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Offline_View__c-SVMXC__Offline View Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__PM_Applicable_Product__c-SVMXC__PM Applicable Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__PM_Coverage__c-SVMXC__Preventive Maintenance Coverage Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__PM_History__c-SVMXC__PM History Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__PM_Offering__c-SVMXC__PM Offering Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__PM_Plan_Template__c-SVMXC__PM Plan Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__PM_Plan__c-SVMXC__Preventive Maintenance Plan Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__PM_Schedule_Definition__c-SVMXC__PM Schedule Definition Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__PM_Schedule_Template__c-SVMXC__PM Schedule Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__PM_Schedule__c-SVMXC__PM Schedule Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Page_Layout_Detail__c-SVMXC__Page Layout Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Page_Layout__c-SVMXC__Page Layout Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Parts_Discount__c-SVMXC__Parts Discount Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Parts_Pricing__c-SVMXC__Parts Pricing Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Parts_Request_Line__c-SVMXC__Parts Request Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Parts_Request__c-SVMXC__Parts Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Picklist_Cache__c-SVMXC__Picklist Cache Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Pricing_Rule__c-SVMXC__Pricing Rule Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__ProductConfiguration__c-SVMXC__Product Configuration Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__ProductIQProfile__c-SVMXC__ProductIQ Profile Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__ProductIQTemplate__c-SVMXC__ProductIQ Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Product_Replacement__c-SVMXC__Product Replacement Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Product_Serial__c-SVMXC__Product Serial Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Product_Stock__c-SVMXC__Product Stock Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Proforma_Invoice_Detail__c-SVMXC__Proforma Invoice Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Proforma_Invoice_Line__c-SVMXC__Proforma Invoice Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Proforma_Invoice__c-SVMXC__Proforma Invoice Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__QB_Response_Options__c-SVMXC__QB Response Options Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__QB_Response_Set__c-SVMXC__QB Response Set Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Question_Bank__c-SVMXC__Question Bank Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Quote_Line__c-SVMXC__Quote Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Quote__c-SVMXC__Quote Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__RMA_Shipment_Line__c-SVMXC__RMA Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__RMA_Shipment_Order__c-SVMXC__RMA Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Required_Part__c-SVMXC__Required Part Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Resource_Preference__c-SVMXC__Resource Preference Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Route_Card__c-SVMXC__Route Card Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Route_Stop__c-SVMXC__Route Stop Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SFM_Event__c-SVMXC__SFM Event Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SLA_Detail__c-SVMXC__SLA Commitment</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Application_Feature__c-SVMXC__Application Feature Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Appointment_Status__c-SVMXC__Appointment Status Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Appointment_Window__c-SVMXC__Appointment Window Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Attributes_Template__c-SVMXC__Attributes Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Checklist_Attachment__c-SVMXC__Checklist Attachment Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Checklist_Result__c-SVMXC__Checklist Result Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Crew_Resource__c-SVMXC__Crew Resource Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Crew__c-SVMXC__Crew Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Default_Checklist_Response__c-SVMXC__Default Checklist Response Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Device_Mobile_Config__c-SVMXC__Device Mobile Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Feature_Permission__c-SVMXC__Feature Permission Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_IB_Attributes_History__c-SVMXC__IB Attributes History Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_IB_Attributes_Template_Instance__c-SVMXC__IB Attributes Template Instance Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_IB_Technical_Attributes__c-SVMXC__IB Technical Attribute Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_IG_Job_Child__c-SVMXC__Job Child Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_IG_Job_Request__c-SVMXC__Job Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_IOT_Event__c-SVMXC__IOT Event Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Inventory_Config__c-SVMXC__Inventory Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_IoT_Field_Mapping__c-SVMXC__IoT Field Mapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Overnight_Stay_Policy__c-SVMXC__Overnight Stay Policy Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Product_Attributes__c-SVMXC__Product Attributes Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Request_Cache__c-SVMXC__Request Cache Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_SB_Queue_Inbound__c-SVMXC__SB Queue Inbound Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_SB_Queue_Outbound__c-SVMXC__SB Queue Outbound Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_SFMTransactionSync__c-SVMXC__SFMTransactionSync Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_SNS_Detail__c-SVMXC__PN AWS SNS Model Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Scheduling_Event_Summary__c-SVMXC__Scheduling Event Summary Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Scheduling_Job_Summary__c-SVMXC__Scheduling Job Summary Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Scheduling_Violation__c-SVMXC__Scheduling Violation Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_TA_Picklist_Definition__c-SVMXC__TA Picklist Definition Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Tag_Definition__c-SVMXC__Tag Definition Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_Tag_Element__c-SVMXC__Tag Element Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SM_User_Preferences__c-SVMXC__User Preference Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Account_Summary__c-SVMXC__SPM Account Summary Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Average_Response_Time__c-SVMXC__SPM - Average Response Time Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Contract_Penetration__c-SVMXC__SPM Contract Penetration Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Contract_Up_Time__c-SVMXC__SPM Contract Up Time Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Down_Time_Detail__c-SVMXC__SPM Down Time Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_First_Time_Fix__c-SVMXC__SPM First Time Fix Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Mean_Time_Between_Failure__c-SVMXC__SPM - Mean Time Between Failure Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Mean_Time_To_Complete__c-SVMXC__SPM - Mean Time To Complete Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Mean_Time_To_Repair__c-SVMXC__SPM Mean Time To Repair Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Repeat_Visit__c-SVMXC__SPM - Repeat Visit Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Schedul_Tech_Utilization_Constraints__c-SVMXC__SPM Schedul Tech Utilization Constraints Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Scheduling_Technician_Utilization__c-SVMXC__SPM Scheduling Technician Utilization Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Top_Level_Summary__c-SVMXC__SPM - Top Level Summary Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SPM_Utilization__c-SVMXC__SPM - Utilization Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SVMX_Event__c-SVMXC__ServiceMax Event Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SVMX_Job_Logs__c-SVMXC__ServiceMax Logs Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SVMX_Job_Stats__c-SVMXC__ServiceMax Job Stats Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SVMX_Jobs__c-SVMXC__ServiceMax Jobs Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__SVMX_Optimizer__c-SVMXC__SVMX Optimizer Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__ServiceMax_Config_Data__c-SVMXC__Configuration Profile Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__ServiceMax_List__c-SVMXC__ServiceMax List Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__ServiceMax_Processes__c-SVMXC__Module Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__ServiceMax_Settings__c-SVMXC__ServiceMax Settings Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__ServiceMax_Tags__c-SVMXC__ServiceMax Tag Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Contract_Contacts__c-SVMXC__Service Contract Contact Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Contract_Products__c-SVMXC__Service Contract Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Contract_Services__c-SVMXC__Service Contract Service Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Contract_Sites__c-SVMXC__Service Contract Site Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Contract__c-SVMXC__Service Contract Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Group_Costs__c-SVMXC__Service Group Cost Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Group_Members__c-SEL-TechnicianLayout for Service Team</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Group_Product__c-SVMXC__Service Group Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Group_Site__c-SVMXC__Service Group Site Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Group_Skills__c-SVMXC__Service Group Skill Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Group__c-SVMXC__Service Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Level__c-SVMXC__Service Level Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Offerings__c-SVMXC__Service Offering Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Order_Dependency__c-SVMXC__Work Order Dependency Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Order_Line__c-SVMXC__Service Order Estimate Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Order__c-SE Work Order Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Plan__c-SVMXC__Service Plan Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Pricebook_Entry__c-SVMXC__Service Pricebook Entry Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Pricebook__c-SVMXC__Service Pricebook Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Request__c-SVMXC__Service Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Template_Products__c-SVMXC__Warranty Template Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Template__c-SE-Warranty Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service_Zone__c-SVMXC__Service Zone Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Service__c-SVMXC__Service Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Site__c-SE Site Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Skill__c-Certification Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Stock_Adjustment__c-SVMXC__Stock Adjustment Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Stock_History__c-SVMXC__Serial History Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Stock_Transfer_Line__c-SVMXC__Stock Transfer Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Stock_Transfer__c-SVMXC__Stock Transfer Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Sub_Location__c-SVMXC__Sub Location Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Sync_Request_Records__c-SVMXC__Sync Request Records Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Sync_Request__c-SVMXC__Sync Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Task_Template__c-SVMXC__Task Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Territory_Coverage__c-SVMXC__Territory Adjacency Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Territory__c-SVMXC__Territory Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Time_Tracker__c-SVMXC__Time Tracker Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Timesheet_Day_Entry__c-SVMXC__Timesheet Daily Summary Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Timesheet_Entry__c-SVMXC__Time Entry Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Timesheet__c-SVMXC__Timesheet Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Travel_Policy__c-SVMXC__Travel Policy Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__User_GPS_Log__c-SVMXC__Location History Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Warranty__c-SVMXC__Warranty Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Work_Order_Resource__c-SVMXC__Work Order Resource Layout</layout></layoutAssignments>
<layoutAssignments><layout>SVMXC__Zone_Pricing__c-SVMXC__Zone Pricing Layout</layout></layoutAssignments>
<layoutAssignments><layout>SafeDomains__c-Safe Domains Layout</layout></layoutAssignments>
<layoutAssignments><layout>SalesContractActivatorRoutingRule__c-SalesContractActivatorRoutingRule Layout</layout></layoutAssignments>
<layoutAssignments><layout>SalesContractTeam__c-Sales Contract Team Layout</layout></layoutAssignments>
<layoutAssignments><layout>SalesContractTemplate__c-Sales Contract Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>SalesContract__c-Sales Contract Layout</layout></layoutAssignments>
<layoutAssignments><layout>SalesContractrole__c-Sales Contract role Layout</layout></layoutAssignments>
<layoutAssignments><layout>SalesEntity__c-SET - Layout</layout></layoutAssignments>
<layoutAssignments><layout>Scorecard-Scorecard Layout</layout></layoutAssignments>
<layoutAssignments><layout>ScorecardAssociation-Scorecard Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>ScorecardMetric-Scorecard Metric Layout</layout></layoutAssignments>
<layoutAssignments><layout>SearchPromotionRule-Promoted Search Term Layout</layout></layoutAssignments>
<layoutAssignments><layout>SegmentSystemAlert__c-Segment System Alert Layout</layout></layoutAssignments>
<layoutAssignments><layout>ServiceContractValueChainPlayer__c-Service Contract Value Chain Player Layout</layout></layoutAssignments>
<layoutAssignments><layout>ServiceItem__c-Service Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>ServiceLevelAgreement__c-SLA - Service Level Agreement Layout</layout></layoutAssignments>
<layoutAssignments><layout>Service_Time__c-Service Time Layout</layout></layoutAssignments>
<layoutAssignments><layout>SetupAlerts__c-PRM Country Cluster Layout</layout></layoutAssignments>
<layoutAssignments><layout>ShipHoldRequest__c-Ship Hold Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>SiteIframeWhiteListUrl-Whitelisted Domains for Inline Frames Layout</layout></layoutAssignments>
<layoutAssignments><layout>Solution-Solution Layout</layout></layoutAssignments>
<layoutAssignments><layout>SolutionApproach__c-Solution Approach Layout</layout></layoutAssignments>
<layoutAssignments><layout>SolutionCenterCountry__c-Solution Center Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>SolutionCenter__c-SCR - Solution Center Layout</layout></layoutAssignments>
<layoutAssignments><layout>SpecializationCatalog__c-Specialization Catalog Layout</layout></layoutAssignments>
<layoutAssignments><layout>SpecializationClassification__c-Specialization Classification Layout</layout></layoutAssignments>
<layoutAssignments><layout>SpecializationCountry__c-Specialization Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>SpecializationDomainsOfExpertise__c-Specialization Domains Of Expertise Layout</layout></layoutAssignments>
<layoutAssignments><layout>SpecializationMarket__c-Specialization Market Layout</layout></layoutAssignments>
<layoutAssignments><layout>SpecializationRequirement__c-SPR - Activity Specialization Requirement Layout</layout></layoutAssignments>
<layoutAssignments><layout>Specialization__c-Specialization Layout</layout></layoutAssignments>
<layoutAssignments><layout>SpiceGroupData__c-SpiceGroupData Layout</layout></layoutAssignments>
<layoutAssignments><layout>SpiceObjectData__c-Spice Object Data Layout</layout></layoutAssignments>
<layoutAssignments><layout>Stakeholders__c-Stakeholders Layout</layout></layoutAssignments>
<layoutAssignments><layout>StateProvince__c-STA - Layout</layout></layoutAssignments>
<layoutAssignments><layout>StepAction__c-Lock Record</layout></layoutAssignments>
<layoutAssignments><layout>Step__c-First Step Layout</layout></layoutAssignments>
<layoutAssignments><layout>SubObjective__c-SOJ - Account</layout></layoutAssignments>
<layoutAssignments><layout>Subscriber__c-Subscriber Layout</layout></layoutAssignments>
<layoutAssignments><layout>SuccessScorecard__c-Program Update Layout</layout></layoutAssignments>
<layoutAssignments><layout>SupplySustainablityRole__c-Supply %26 Sustainablity Role Layout</layout></layoutAssignments>
<layoutAssignments><layout>SupplyingPlant__c-SPP - Layout</layout></layoutAssignments>
<layoutAssignments><layout>Swap_Asset__c-Swap Asset Layout</layout></layoutAssignments>
<layoutAssignments><layout>Symptom__c-STM - Symptom Layout</layout></layoutAssignments>
<layoutAssignments><layout>System__c-System Layout</layout></layoutAssignments>
<layoutAssignments><layout>TECH_CommRefAllLevel__c-TECH_CommRefAllLevel Layout</layout></layoutAssignments>
<layoutAssignments><layout>TECH_GMRMapping__c-TECH_GMRMapping Layout</layout></layoutAssignments>
<layoutAssignments><layout>TEXStakeholder__c-TEX Stakeholder Layout</layout></layoutAssignments>
<layoutAssignments><layout>TEXTeamMember__c-TEX Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>TEX__c-TEX Layout</layout></layoutAssignments>
<layoutAssignments><layout>TMT_Curriculum__c-CUR - Trainer Layout</layout></layoutAssignments>
<layoutAssignments><layout>TMT_Location__c-LOC - Layout</layout></layoutAssignments>
<layoutAssignments><layout>TMT_Registration__c-REG - Trainer Layout</layout></layoutAssignments>
<layoutAssignments><layout>TMT_Session__c-SES - Trainer Layout</layout></layoutAssignments>
<layoutAssignments><layout>TMT_Teaching__c-TEA - Layout</layout></layoutAssignments>
<layoutAssignments><layout>Target_Products__c-Quality Alert Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>TargetedCountriesHeadCount__c-Targeted Countries Head Count Layout</layout></layoutAssignments>
<layoutAssignments><layout>TargetedCountries__c-Targeted Country Layout</layout></layoutAssignments>
<layoutAssignments><layout>Task-TSK - Standard Layout</layout></layoutAssignments>
<layoutAssignments><layout>TeamAgentMapping__c-TME - Page Layout</layout></layoutAssignments>
<layoutAssignments><layout>TeamCaseJunction__c-Supported Case Classification Layout</layout></layoutAssignments>
<layoutAssignments><layout>TeamMember__c-Program Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>TeamProductJunction__c-TPA - Page Layout</layout></layoutAssignments>
<layoutAssignments><layout>Team_Member__c-Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>Team_Members_Opportunity_Notification__c-Team Member Layout</layout></layoutAssignments>
<layoutAssignments><layout>Technical_Return__c-Technical Return Layout</layout></layoutAssignments>
<layoutAssignments><layout>Tilkee_SF2__Project_Tilkee__c-Tilkee_SF2__Layout Projet Tilkee</layout></layoutAssignments>
<layoutAssignments><layout>Tilkee_SF2__Tilk__c-Tilkee_SF2__Présentation Tilk</layout></layoutAssignments>
<layoutAssignments><layout>Tilkee_SF2__Tilkee_Item__c-Tilkee_SF2__Présentation OpportunityAttachment</layout></layoutAssignments>
<layoutAssignments><layout>TimeTracking__c-Time Tracking Layout</layout></layoutAssignments>
<layoutAssignments><layout>Time_Sheet_Daily_Totals__c-Time Sheet Daily Totals Layout</layout></layoutAssignments>
<layoutAssignments><layout>TrackSetupAlets__c-Track Setup Alerts Layout</layout></layoutAssignments>
<layoutAssignments><layout>UAT_Results__c-UAT Results Layout</layout></layoutAssignments>
<layoutAssignments><layout>UIMSCompany__c-UIMS Company Layout</layout></layoutAssignments>
<layoutAssignments><layout>UIMS_Company__c-UIMS Company Layout</layout></layoutAssignments>
<layoutAssignments><layout>UIMS_User__c-UIMS User Layout</layout></layoutAssignments>
<layoutAssignments><layout>UnitRate__c-Unit Rate Layout</layout></layoutAssignments>
<layoutAssignments><layout>User-User Layout</layout></layoutAssignments>
<layoutAssignments><layout>UserAccessibleListViews__c-User Accessible List View Layout</layout></layoutAssignments>
<layoutAssignments><layout>UserAlt-User Profile Layout</layout></layoutAssignments>
<layoutAssignments><layout>UserAppMenuItem-Layout de Aplicativo</layout></layoutAssignments>
<layoutAssignments><layout>UserParameter__c-User Parameter Layout</layout></layoutAssignments>
<layoutAssignments><layout>UserProvAccount-User Provisioning Account Layout</layout></layoutAssignments>
<layoutAssignments><layout>UserProvisioningLog-User Provisioning Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>UserProvisioningRequest-User Provisioning Request Layout</layout></layoutAssignments>
<layoutAssignments><layout>UserSAMLAssertion__c-User SAML Assertion Layout</layout></layoutAssignments>
<layoutAssignments><layout>UserStories__c-User Story Layout</layout></layoutAssignments>
<layoutAssignments><layout>User_Acceptance_Test__c-User Acceptance Test Layout</layout></layoutAssignments>
<layoutAssignments><layout>User_Story_Scenarios__c-User Story Scenario Layout</layout></layoutAssignments>
<layoutAssignments><layout>VCPOpportunityLineLink__c-VCP - Opportunity Line link Layout</layout></layoutAssignments>
<layoutAssignments><layout>Validated_Learning__c-Validated Learning Layout</layout></layoutAssignments>
<layoutAssignments><layout>View__c-Open Framework App View Layout</layout></layoutAssignments>
<layoutAssignments><layout>VisualforceAccessMetric__c-Visualforce Access Metric Layout</layout></layoutAssignments>
<layoutAssignments><layout>WONInstalledProductLine__c-WON Installed Product Line Layout</layout></layoutAssignments>
<layoutAssignments><layout>WO_ValueChainPlayer__c-WOVCP-Layout</layout></layoutAssignments>
<layoutAssignments><layout>WorkDetailDeletion__c-Work Detail Deletion Layout</layout></layoutAssignments>
<layoutAssignments><layout>WorkOrderAssignmentRule__c-Assignment Rule Layout</layout></layoutAssignments>
<layoutAssignments><layout>WorkOrderGroup__c-Work Order Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>WorkOrderNote__c-Work Order Note Layout</layout></layoutAssignments>
<layoutAssignments><layout>WorkOrderNotification__c-Work Order Notification Layout</layout></layoutAssignments>
<layoutAssignments><layout>Work_Order_Rescheduling_Detail__c-Work Order Rescheduling Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>Work_Order_Skills__c-Work Order Skill Layout</layout></layoutAssignments>
<layoutAssignments><layout>Work_Order_Task__c-Work Order Task Layout</layout></layoutAssignments>
<layoutAssignments><layout>X3rd_Party_Cost__c-3rd Party Cost Layout</layout></layoutAssignments>
<layoutAssignments><layout>XAAffectedProduct__c-XA Affected Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>XactlyCorp__XCIncentBusiness__c-XactlyCorp__XCIncentBusiness Layout</layout></layoutAssignments>
<layoutAssignments><layout>XactlyCorp__XactlyUserBusiness__c-XactlyCorp__XactlyUserBusiness Layout</layout></layoutAssignments>
<layoutAssignments><layout>ZHFMCode__c-HFM Code Layout</layout></layoutAssignments>
<layoutAssignments><layout>ZHMIGateManagerList__c-Gate Manager Region Layout</layout></layoutAssignments>
<layoutAssignments><layout>ZProfile__c-Digital Services Profile Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__CrmId_Change_Result__c-Zuora__CrmId Change Result Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__CustomerAccount__c-Zuora__Billing Account Z-Force Layout v2%2E9</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__InvoiceItem__c-Zuora__Invoice Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__ObjectStub__c-Zuora__ObjectStub Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__PaymentGateway__c-Zuora__PaymentGateway Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__PaymentInvoice__c-Zuora__PaymentInvoice Z-Force Layout v2%2E5</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__PaymentMethod__c-Zuora__Payment Method Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__PaymentTerm__c-Zuora__ProductTerm Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__Payment__c-Zuora__Payment Z-Force Layout v2%2E7</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__Product__c-Zuora__Product Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__RefundInvoicePayment__c-Zuora__RefundInvoicePayment Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__Refund__c-Zuora__Refund Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__SubscriptionProductCharge__c-Zuora__Subscription Charge Z-Force Layout v2%2E9</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__SubscriptionProductFeature__c-Zuora__SubscriptionProductFeature Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__SubscriptionRatePlanChargeTier__c-Zuora__Subscription Rate Plan Charge Tier Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__SubscriptionRatePlan__c-Zuora__Subscription Rate Plan Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__Subscription__c-Zuora__Subscription Z-Force Layout v2%2E6</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__Sync_History__c-Zuora__Sync History Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__TaxationItem__c-Zuora__TaxationItem Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__UnitOfMeasure__c-Zuora__Unit Of Measure Layout</layout></layoutAssignments>
<layoutAssignments><layout>Zuora__ZInvoice__c-Zuora__ZInvoice Z-Force Layout v2%2E100</layout></layoutAssignments>
<layoutAssignments><layout>ad_dqplus__Acmedata_Issues__c-ad_dqplus__Acmedata Issue Layout</layout></layoutAssignments>
<layoutAssignments><layout>ad_dqplus__FieldGroup__c-ad_dqplus__Field Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>ad_dqplus__FieldSetting__c-ad_dqplus__Field Setting Layout</layout></layoutAssignments>
<layoutAssignments><layout>ad_dqplus__Search_Button__c-ad_dqplus__DQ*Plus Smart Search Button Layout</layout></layoutAssignments>
<layoutAssignments><layout>bFO_Object__c-bFO Object Layout</layout></layoutAssignments>
<layoutAssignments><layout>bFoMatchingResult__c-bFO Matching Result Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>box__BOSS_Exception__c-box__BOSS Exception Layout</layout></layoutAssignments>
<layoutAssignments><layout>box__FRUP__c-box__FRUP Layout</layout></layoutAssignments>
<layoutAssignments><layout>box__Folder_Meta__c-box__Folder Metadata Layout</layout></layoutAssignments>
<layoutAssignments><layout>box__ItemMoveQueue__c-box__Item Move Queue Layout</layout></layoutAssignments>
<layoutAssignments><layout>box__LeadConvertQueue__c-box__Lead Convert Queue Layout</layout></layoutAssignments>
<layoutAssignments><layout>briefingedge__BriefingEdge_REST_Opportunity__c-briefingedge__BriefingEdge REST Opportunity Layout</layout></layoutAssignments>
<layoutAssignments><layout>ce4sf20_001__Guide_Definition__c-ce4sf20_001__Guide Definition Layout</layout></layoutAssignments>
<layoutAssignments><layout>ce4sf20_001__Guide_Execution__c-ce4sf20_001__Guide Execution Layout</layout></layoutAssignments>
<layoutAssignments><layout>ce4sf20_001__Guide_Milestone__c-ce4sf20_001__Guide Milestone Layout</layout></layoutAssignments>
<layoutAssignments><layout>chttrunfollow__UnfollowBatchJobsQueue__c-chttrunfollow__Chatter Record Unfollow Batch Job Queued Layout</layout></layoutAssignments>
<layoutAssignments><layout>chttrunfollow__UnfollowQueue__c-chttrunfollow__Chatter Record Unfollow Delayed RecordId Layout</layout></layoutAssignments>
<layoutAssignments><layout>chttrunfollow__UnfollowRuleJob__c-chttrunfollow__Chatter Unfollow Rule Job Layout</layout></layoutAssignments>
<layoutAssignments><layout>chttrunfollow__UnfollowRule__c-chttrunfollow__Chatter Record Unfollow Rule Layout</layout></layoutAssignments>
<layoutAssignments><layout>chttrunfollow__UnfollowTest__c-chttrunfollow__Chatter Unfollow Test Data Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Analytics__c-dgAI2__DG Analytics Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Case_Companion__c-dgAI2__DG Case Companion Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Dependencies__c-dgAI2__DG Dependencies Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Log__c-dgAI2__DG Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Model_Criteria__c-dgAI2__DG Model Criteria Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Model_Input__c-dgAI2__DG Model Input Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Model_Output__c-dgAI2__DG Model Output Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Model_Version__c-dgAI2__DG Model Version Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Model__c-dgAI2__DG Model Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI2__DG_Prediction__c-dgAI2__DG Prediction Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI3__DG_Companion__c-dgAI3__DG_Companion Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI3__DG_Flow_Filter_Query__c-dgAI3__DG Flow Filter Query Layout</layout></layoutAssignments>
<layoutAssignments><layout>dgAI3__DG_Log__c-dgAI3__DG Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>dlrs__LookupChildAReallyReallyReallyBigBigName__c-dlrs__Lookup Child Big Layout</layout></layoutAssignments>
<layoutAssignments><layout>dlrs__LookupChild__c-dlrs__Lookup Child Layout</layout></layoutAssignments>
<layoutAssignments><layout>dlrs__LookupParent__c-dlrs__Lookup Parent Layout</layout></layoutAssignments>
<layoutAssignments><layout>dlrs__LookupRollupSummaryLog__c-dlrs__Lookup Rollup Summary Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>dlrs__LookupRollupSummaryScheduleItems__c-dlrs__Lookup Rollup Summary Queue Layout</layout></layoutAssignments>
<layoutAssignments><layout>dlrs__LookupRollupSummary__c-dlrs__Lookup Rollup Summary Layout</layout></layoutAssignments>
<layoutAssignments><layout>groupappuserjunction__c-Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>ltnadptn__Lightning_Adoption_Report_Snapshot__c-ltnadptn__Lightning Adoption Report Snapshot Layout</layout></layoutAssignments>
<layoutAssignments><layout>ltngsharing__PrivateTestObject__c-ltngsharing__PrivateTestObject Layout</layout></layoutAssignments>
<layoutAssignments><layout>ltngsharing__ReadOnlyTestObject__c-ltngsharing__ReadOnlyTestObject Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__BestBetsCache__c-mkto_si__BestBetsCache Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__Best_Bets_View_Detail__c-mkto_si__Best Bets View Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__Best_Bets_View__c-mkto_si__Best Bets View Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__EmailActivityCache__c-mkto_si__EmailActivityCache Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__Get_Method_Argus__c-mkto_si__GetMethodArgu Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__GroupedWebActivityCache__c-mkto_si__GroupedWebActivityCache Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__InterestingMomentsCache__c-mkto_si__InterestingMomentsCache Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__Marketo_Sales_Insight_Config__c-mkto_si__Marketo Sales Insight Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__ScoringCache__c-mkto_si__ScoringCache Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__Value__c-mkto_si__Value Layout</layout></layoutAssignments>
<layoutAssignments><layout>mkto_si__WebActivityCache__c-mkto_si__WebActivityCache Layout</layout></layoutAssignments>
<layoutAssignments><layout>myFS_Message_Template__c-myFS Message Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>myFS_Notification__c-myFS Notification Layout</layout></layoutAssignments>
<layoutAssignments><layout>odnoklassniki__mdt-odnoklassniki Layout</layout></layoutAssignments>
<layoutAssignments><layout>ofwgroup__c-Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Action_Object__c-smagicinteract__Action Object Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Action_Parameter__c-smagicinteract__Action Parameter Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Action__c-smagicinteract__Action Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Child_Object_Config__c-smagicinteract__Child Object Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Error_Log__c-smagicinteract__Error Log Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Filter_Setting__c-smagicinteract__Filter Setting Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Incoming_Alert_Configuration__c-smagicinteract__Incoming Alert Configuration Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Incoming_MMS_Detail__c-smagicinteract__Incoming MMS Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Incoming_SMS__c-smagicinteract__Incoming SMS Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Keyword_Action_Config__c-smagicinteract__Keyword Action Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__LV_MMS_Detail__c-smagicinteract__LV MMS Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__List_View_Configuration__c-smagicinteract__List View Configuration Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__List_View_Execution__c-smagicinteract__List View Execution Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__MMS_Detail__c-smagicinteract__MMS Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Message_Action__c-smagicinteract__Message Action Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Message_Object_Config__c-smagicinteract__Message Object Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Object_Field_Config__c-smagicinteract__Object Field Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Optout_Settings__c-smagicinteract__Optout Manager Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__SMS_Batch_Execution_Tracker__c-smagicinteract__SMS Batch Execution Tracker Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__SMS_Schedule__c-smagicinteract__SMS Schedule Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__SMS_SenderId__c-smagicinteract__SMS SenderId Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__SMS_Template_Type__c-smagicinteract__SMS Template Type Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__SMS_Template__c-smagicinteract__SMS Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Scheduled_SMS__c-smagicinteract__Scheduled SMS Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__SenderId_Profile_Map__c-smagicinteract__SenderId Profile Map Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__Unrelated_Object_Config__c-smagicinteract__Unrelated Object Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__forward_config__c-smagicinteract__Forward Configuration</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__incoming_lookup_config__c-smagicinteract__incoming_lookup_config Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__lookup_config__c-smagicinteract__lookup_config Layout</layout></layoutAssignments>
<layoutAssignments><layout>smagicinteract__smsMagic__c-smagicinteract__smsMagic Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__ConversationAccountAssociation__c-spr_sf__Social Message Account Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__ConversationCaseAssociation__c-spr_sf__Social Message Case Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__ConversationContactAssociation__c-spr_sf__Social Message Contact Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__ConversationLeadAssociation__c-spr_sf__Social Message Lead Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__ConversationOpportunityAssociation__c-spr_sf__Social Message Opportunity Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__Conversation__c-spr_sf__Social Message Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__Social_Profile_Account_Association__c-spr_sf__Social Profile Account Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__Social_Profile_Contact_Association__c-spr_sf__Social Profile Contact Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__Social_Profile_Lead_Association__c-spr_sf__Social Profile Lead Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__Social_Profile_Opportunity_Association__c-spr_sf__Social Profile Opportunity Association Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__Social_Profile__c-spr_sf__Social Profile Layout</layout></layoutAssignments>
<layoutAssignments><layout>spr_sf__UserConfig__c-spr_sf__UserConfig Layout</layout></layoutAssignments>
<layoutAssignments><layout>transactionhistory__c-Transaction History Layout</layout></layoutAssignments>
<layoutAssignments><layout>vkontakte__mdt-session Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__BillingEntity__c-zqu__Billing Entity Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__CalculatedValue__c-zqu__Calculated Value - Default V7%2E1</layout></layoutAssignments>
<layoutAssignments><layout>zqu__Catalog_Sync_History__c-zqu__Catalog Sync History Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__CommunicationProfile__c-zqu__Communication Profile Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__Field_Set_Config__c-zqu__Field Set Config Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__FilterCondition__c-zqu__Filter Condition - Default V7%2E1</layout></layoutAssignments>
<layoutAssignments><layout>zqu__Format_Object__c-zqu__Format Object Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__GuidedSellingFlow__c-zqu__Guided Selling Flow Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__GuidedSellingSection__c-zqu__Guided Selling Section Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__GuidedSellingStep__c-zqu__Guided Selling Step Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__HostedPageLiteSetting__c-zqu__Hosted Page Lite Setting Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__Hosted_Page_Setting__c-zqu__Hosted Page Setting Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__InvoiceTemplate__c-zqu__Invoice Template Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__List_Filter_Item__c-zqu__List Filter Item Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__List_Filter__c-zqu__List Filter Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ProductOptionGroup__c-zqu__Product Option Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ProductOption__c-zqu__Product Option Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ProductRatePlanChargeOption__c-zqu__Product Rate Plan Charge Option Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ProductRatePlanChargePriceSummary__c-zqu__Product Rate Plan Charge Price Summary Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ProductRatePlanChargeTierOption__c-zqu__Product Rate Plan Charge Tier Option Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ProductRatePlanChargeTier__c-zqu__Product RatePlan Charge Tier Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ProductRatePlanCharge__c-zqu__Rate Plan Charge Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ProductRatePlanOption__c-zqu__Product Rate Plan Option Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ProductRatePlan__c-zqu__Rate Plan Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteAmendment__c-zqu__Quote Amendment Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteChargeDetail__c-zqu__Charge Detail Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteChargeSummary__c-zqu__QuoteChargeSummary Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteCharge_Tier__c-zqu__Quote Charge Tier Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteCharge__c-zqu__QuoteCharge Layout - ReadOnly</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteProductFeature__c-zqu__Quote Product Feature Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteProductOptionGroup__c-zqu__Quote Product Option Group Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteProductOption__c-zqu__Quote Product Option Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteRatePlanChargeOption__c-zqu__Quote Rate Plan Charge Option Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteRatePlanCharge__c-zqu__Quote Rate Plan Charge Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteRatePlanOption__c-zqu__Quote Rate Plan Option Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteRatePlan__c-zqu__Quote Rate Plan Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteTCVStatus__c-zqu__Quote TCV Status Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__QuoteWizardStep__c-zqu__Quote Wizard Step Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__Quote_Processing_Data__c-zqu__Quote Processing Data Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__Quote_Template__c-zqu__Quote Template Layout - V5%2E0</layout></layoutAssignments>
<layoutAssignments><layout>zqu__Quote__c-zqu__Quote Layout - Default V6%2E1</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ScaleSetting__c-zqu__Scale Setting Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__SequenceGenerator__c-zqu__Sequence Generator Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__StepToFilterMap__c-zqu__Step To Filter Map Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__StepToFlowMap__c-zqu__Step To Flow Map Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__Sync_History__c-zqu__Sync History Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__UserProductFilter__c-zqu__User Product Filter Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZFeatureFieldSet__c-zqu__ZFeatureFieldSet Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZFeature__c-zqu__ZFeature Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZFilter__c-zqu__ZFilter Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZList__c-zqu__List Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZProductFeature__c-zqu__ZProductFeature Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZProduct__c-zqu__ZProduct Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZRule__c-zqu__Rule Layout - Default V7%2E1</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZSyncSchemaValue__c-zqu__ZSyncSchemaValue Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZSyncSchema__c-zqu__ZSyncSchema Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZUnitOfMeasure__c-zqu__ZUnit Of Measure Layout</layout></layoutAssignments>
<layoutAssignments><layout>zqu__ZuoraConfig__c-zqu__Zuora Config Layout</layout></layoutAssignments>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>Individual</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>SVMXC__Config_Change_Detail__c</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>SVMXC__SM_Appointment_Status__c</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>SVMXC__SM_Crew_Resource__c</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>SVMXC__SM_Crew__c</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>SVMXC__SM_IG_Job_Child__c</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>SVMXC__SM_IG_Job_Request__c</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>SVMXC__SM_SB_Queue_Inbound__c</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>SVMXC__SM_SB_Queue_Outbound__c</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>SVMXC__SM_Service_Board__e</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<objectPermissions><allowCreate>true</allowCreate><allowDelete>true</allowDelete><allowEdit>true</allowEdit><allowRead>true</allowRead><modifyAllRecords>false</modifyAllRecords><object>XactlyCorp__XCIncentBusiness__c</object><viewAllRecords>false</viewAllRecords></objectPermissions>
<pageAccesses><apexPage>SVMXC__CONF_MobFilesConfig</apexPage><enabled>true</enabled></pageAccesses>
<pageAccesses><apexPage>SVMXC__Conf_ManageIntegration</apexPage><enabled>true</enabled></pageAccesses>
<pageAccesses><apexPage>XactlyCorp__XactlyIncentSettings</apexPage><enabled>true</enabled></pageAccesses>
<recordTypeVisibilities><default>true</default><recordType>PITCHER_Q__Audit_Questions__c.PITCHER_Q__TrueFalse</recordType><visible>true</visible></recordTypeVisibilities>
<recordTypeVisibilities><default>false</default><recordType>PITCHER_Q__Audit_Questions__c.PITCHER_Q__True_False_NA</recordType><visible>true</visible></recordTypeVisibilities>
<recordTypeVisibilities><default>true</default><recordType>Tilkee_SF2__Tilk__c.Tilkee_SF2__Tilk</recordType><visible>true</visible></recordTypeVisibilities>
<tabVisibilities><tab>Business_Requirement__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>CSQ_CertificationStatus__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>CTR_ValueChainPlayers__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>Calendar1</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>CareAgent__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>CommercialReference__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>ContractExternalReference__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>CountryStateLanguageTranslation__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>Decision__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>Defect__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>DomainsOfExpertiseCatalog__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>EasyCVR</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>ExternalPropertiesCatalog__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>Feedback__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>FieloPRM_Feature__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>Knowledge__kav</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>LegacyAccount__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>ManageTranslations</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>MyLeads</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>OPP_SupportRequest__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>OptyOwnerRoutingRule__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>Pre_study__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>Revenue_Line__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>S1_Feedback</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SFE_CoachingVisitForm__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SFGA__GoogleAdWordsSetup</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SVMXC__Activity_Master__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SVMXC__PM_Plan_Template__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SVMXC__PM_Plan__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SVMXC__Proforma_Invoice__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SVMXC__Service_Plan__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SVMXC__Service_Pricebook__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SVMXC__Service__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SVMXC__Task_Template__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>SVMXC__Territory_Coverage__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>Search_Accounts</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>StateProvince__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>System__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>Validated_Learning__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>WM4SF3__Advanced</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>WM4SF3__Tab_License</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>WM4SF3__WalkMe_Extension_Configuration</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>XactlyCorp__Xactly_Settings</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>Zuora__Subscription__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>Zuora__ZInvoice__c</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>box__Box_Files2</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>box__Box_Settings</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__Conversation_View_Classic</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__Conversation_View_Creator</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__Create_Bulk_Page</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__Error_Log__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__Incoming_SMS__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__List_View_Configuration__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__SMS_Magic_Help</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__SMS_Magic_Settings</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__SMS_Schedule__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__SMS_Template__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__SM_Home</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>smagicinteract__smsMagic__c</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Account</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-ActiveScratchOrg</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-AuthorizationForm</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-AuthorizationFormConsent</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-AuthorizationFormDataUse</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-AuthorizationFormText</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Campaign</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Case</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-ChannelProgram</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-ChannelProgramLevel</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Contact</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-ContactPointTypeConsent</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Contract</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-DataUseLegalBasis</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-DataUsePurpose</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-DuplicateRecordSet</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Idea</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Lead</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-LiveAgentSession</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-LiveChatTranscript</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-LiveChatVisitor</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Macro</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-NamespaceRegistry</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Opportunity</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-PartnerFundAllocation</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-PartnerFundClaim</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-PartnerFundRequest</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-PartnerMarketingBudget</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Pricebook2</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Product2</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-QuickText</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-SOSSession</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-ScratchOrgInfo</tab><visibility>DefaultOff</visibility></tabVisibilities>
<tabVisibilities><tab>standard-Solution</tab><visibility>DefaultOn</visibility></tabVisibilities>
<tabVisibilities><tab>standard-StreamingChannel</tab><visibility>DefaultOff</visibility></tabVisibilities>
<userLicense>Salesforce</userLicense>
<userPermissions><enabled>true</enabled><name>ActivitiesAccess</name></userPermissions>
<userPermissions><enabled>true</enabled><name>AddDirectMessageMembers</name></userPermissions>
<userPermissions><enabled>true</enabled><name>AllowUniversalSearch</name></userPermissions>
<userPermissions><enabled>true</enabled><name>AllowViewKnowledge</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ApexRestServices</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ApiEnabled</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ApiUserOnly</name></userPermissions>
<userPermissions><enabled>true</enabled><name>AssignTopics</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ChatterEditOwnPost</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ChatterEnabledForUser</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ChatterFileLink</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ChatterInternalUser</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ChatterInviteExternalUsers</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ChatterOwnGroups</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ContentWorkspaces</name></userPermissions>
<userPermissions><enabled>true</enabled><name>CreateCustomizeFilters</name></userPermissions>
<userPermissions><enabled>true</enabled><name>CreateCustomizeReports</name></userPermissions>
<userPermissions><enabled>true</enabled><name>CreateTopics</name></userPermissions>
<userPermissions><enabled>true</enabled><name>DistributeFromPersWksp</name></userPermissions>
<userPermissions><enabled>true</enabled><name>EditEvent</name></userPermissions>
<userPermissions><enabled>true</enabled><name>EditOppLineItemUnitPrice</name></userPermissions>
<userPermissions><enabled>true</enabled><name>EditTask</name></userPermissions>
<userPermissions><enabled>true</enabled><name>EditTopics</name></userPermissions>
<userPermissions><enabled>true</enabled><name>EmailMass</name></userPermissions>
<userPermissions><enabled>true</enabled><name>EmailSingle</name></userPermissions>
<userPermissions><enabled>true</enabled><name>EnableCommunityAppLauncher</name></userPermissions>
<userPermissions><enabled>true</enabled><name>EnableNotifications</name></userPermissions>
<userPermissions><enabled>true</enabled><name>LightningConsoleAllowedForUser</name></userPermissions>
<userPermissions><enabled>true</enabled><name>LightningExperienceUser</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ListEmailSend</name></userPermissions>
<userPermissions><enabled>true</enabled><name>MassInlineEdit</name></userPermissions>
<userPermissions><enabled>true</enabled><name>RemoveDirectMessageMembers</name></userPermissions>
<userPermissions><enabled>true</enabled><name>RunReports</name></userPermissions>
<userPermissions><enabled>true</enabled><name>SelectFilesFromSalesforce</name></userPermissions>
<userPermissions><enabled>true</enabled><name>SendExternalEmailAvailable</name></userPermissions>
<userPermissions><enabled>true</enabled><name>SendSitRequests</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ShowCompanyNameAsUserBadge</name></userPermissions>
<userPermissions><enabled>true</enabled><name>SubmitMacrosAllowed</name></userPermissions>
<userPermissions><enabled>true</enabled><name>TransactionalEmailSend</name></userPermissions>
<userPermissions><enabled>true</enabled><name>UseWebLink</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ViewGlobalHeader</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ViewHelpLink</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ViewRoles</name></userPermissions>
<userPermissions><enabled>true</enabled><name>ViewSetup</name></userPermissions>


</Profile>
