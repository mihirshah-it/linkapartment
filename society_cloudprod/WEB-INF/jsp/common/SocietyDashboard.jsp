<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="app.societywala.common.bo.ViewMenuCardBO"%>
<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@page import="app.societywala.common.bo.EditMenuCardBO"%>
<%@page import="app.societywala.common.bo.MenuCardBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%
List<SocietyBO> userSocietyBOList = (List<SocietyBO>)request.getAttribute("userSocietyList");
Map<Long,List<Long>> userSocietyRoleIdMap = (Map<Long,List<Long>>)request.getAttribute("userSocietyRoleIdMap");
Long totalSocietyBO = (Long)request.getAttribute("totalSocietyBO");

String dashboardSelectedMenuName = (String) session.getAttribute(CommonConstant.SESSION_DASHBOARD_MENU_NAME);

Map<String, MenuCardBO> urlMap = new LinkedHashMap<String,MenuCardBO>();
if(dashboardSelectedMenuName.equals("manageSociety"))
{
	List<Long> editAccessRoleIdList = new ArrayList<Long>();
	editAccessRoleIdList.add(UserRoleType.SOCIETY_ADMIN);
	editAccessRoleIdList.add(UserRoleType.CHAIR_MAN);
	editAccessRoleIdList.add(UserRoleType.SECRETARY);
	editAccessRoleIdList.add(UserRoleType.TRESURER);

	/* First Option */
	EditMenuCardBO editMenuCardBO1 = new EditMenuCardBO();
	editMenuCardBO1.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO1.setLabelCode("societyCard.menu.modifyDetail");
	editMenuCardBO1.setFunctionName("societyDetails");

	ViewMenuCardBO viewMenuCardBO1 = new ViewMenuCardBO();
	viewMenuCardBO1.setLabelCode("societyCard.menu.viewDetail");
	viewMenuCardBO1.setFunctionName("societyDetails");

	MenuCardBO menuCardBO1 = new MenuCardBO();
	menuCardBO1.setEditMenuCardBO(editMenuCardBO1);
	menuCardBO1.setViewMenuCardBO(viewMenuCardBO1);
	urlMap.put("option1",menuCardBO1);
	/* First Option */

	/* Second Option */
	EditMenuCardBO editMenuCardBO2 = new EditMenuCardBO();
	editMenuCardBO2.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO2.setLabelCode("societyCard.menu.modifyStructure");
	editMenuCardBO2.setFunctionName("societyStructure");

	ViewMenuCardBO viewMenuCardBO2 = new ViewMenuCardBO();
	viewMenuCardBO2.setLabelCode("societyCard.menu.viewsStructure");
	viewMenuCardBO2.setFunctionName("societyStructure");

	MenuCardBO menuCardBO2 = new MenuCardBO();
	menuCardBO2.setEditMenuCardBO(editMenuCardBO2);
	menuCardBO2.setViewMenuCardBO(viewMenuCardBO2);
	urlMap.put("option2",menuCardBO2);
	/* Second Option */

	/* Third Option */
	EditMenuCardBO editMenuCardBO3 = new EditMenuCardBO();
	editMenuCardBO3.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO3.setLabelCode("societyCard.menu.modify.propertyDetails");
	editMenuCardBO3.setFunctionName("propertyDetails");

	ViewMenuCardBO viewMenuCardBO3 = new ViewMenuCardBO();
	viewMenuCardBO3.setLabelCode("societyCard.menu.view.propertyDetails");
	viewMenuCardBO3.setFunctionName("propertyDetails");

	MenuCardBO menuCardBO3 = new MenuCardBO();
	menuCardBO3.setEditMenuCardBO(editMenuCardBO3);
	menuCardBO3.setViewMenuCardBO(viewMenuCardBO3);
	urlMap.put("option3",menuCardBO3);
	/* Third Option */

	/* Forth Option */
	EditMenuCardBO editMenuCardBO4 = new EditMenuCardBO();
	editMenuCardBO4.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO4.setLabelCode("societyCard.menu.modifyPanel");
	editMenuCardBO4.setFunctionName("societyPanel");

	ViewMenuCardBO viewMenuCardBO4 = new ViewMenuCardBO();
	viewMenuCardBO4.setLabelCode("societyCard.menu.viewPanel");
	viewMenuCardBO4.setFunctionName("societyPanel");

	MenuCardBO menuCardBO4 = new MenuCardBO();
	menuCardBO4.setEditMenuCardBO(editMenuCardBO4);
	menuCardBO4.setViewMenuCardBO(viewMenuCardBO4);
	urlMap.put("option4",menuCardBO4);
	/* Forth Option */
	
	/* Society Facility Option */
	EditMenuCardBO editFacilityCardBO = new EditMenuCardBO();
	editFacilityCardBO.setAccessRoleId(editAccessRoleIdList);
	editFacilityCardBO.setLabelCode("societyCard.menu.facility");
	editFacilityCardBO.setFunctionName("manageFacility");

	MenuCardBO facilityCardBO = new MenuCardBO();
	facilityCardBO.setEditMenuCardBO(editFacilityCardBO);
	urlMap.put("facilityCardBO",facilityCardBO);
	/* Fifth Option */
	
	/* Fifth Option */
	EditMenuCardBO editPropertyStaffCardBO = new EditMenuCardBO();
	editPropertyStaffCardBO.setAccessRoleId(editAccessRoleIdList);
	editPropertyStaffCardBO.setLabelCode("societyCard.menu.editPropertyStaff");
	editPropertyStaffCardBO.setFunctionName("propertyStaff");

	ViewMenuCardBO viewPropertyStaffCardBO = new ViewMenuCardBO();
	viewPropertyStaffCardBO.setLabelCode("societyCard.menu.viewPropertyStaff");
	viewPropertyStaffCardBO.setFunctionName("propertyStaff");

	MenuCardBO propertyStaffCardBO = new MenuCardBO();
	propertyStaffCardBO.setEditMenuCardBO(editPropertyStaffCardBO);
	propertyStaffCardBO.setViewMenuCardBO(viewPropertyStaffCardBO);
	urlMap.put("propertyStaffCardBO",propertyStaffCardBO);
	/* Fifth Option */
	
	/* Import/Export Options */
	EditMenuCardBO editImportCardBO = new EditMenuCardBO();
	editImportCardBO.setAccessRoleId(editAccessRoleIdList);
	editImportCardBO.setLabelCode("societyCard.menu.editImportData");
	editImportCardBO.setFunctionName("importData");

	ViewMenuCardBO viewImportCardCardBO = new ViewMenuCardBO();
	viewImportCardCardBO.setLabelCode("societyCard.menu.viewImportData");
	viewImportCardCardBO.setFunctionName("importData");

	MenuCardBO importCardBO = new MenuCardBO();
	importCardBO.setEditMenuCardBO(editImportCardBO);
	importCardBO.setViewMenuCardBO(viewImportCardCardBO);
	urlMap.put("importCardBO",importCardBO);
	/* Fifth Option */

} // end of if(dashboardSelectedMenuName.equals("manageSociety"))
else if(dashboardSelectedMenuName.equals("manageBills"))
{
	List<Long> editAccessRoleIdList = new ArrayList<Long>();
	editAccessRoleIdList.add(UserRoleType.SOCIETY_ADMIN);
	editAccessRoleIdList.add(UserRoleType.CHAIR_MAN);
	editAccessRoleIdList.add(UserRoleType.SECRETARY);
	editAccessRoleIdList.add(UserRoleType.TRESURER);

	/* First Option */
	EditMenuCardBO editMenuCardBO1 = new EditMenuCardBO();
	editMenuCardBO1.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO1.setLabelCode("billCard.menu.manageTemplates");
	editMenuCardBO1.setFunctionName("templateDetails");

	ViewMenuCardBO viewMenuCardBO1 = new ViewMenuCardBO();
	viewMenuCardBO1.setLabelCode("billCard.menu.viewTemplates");
	viewMenuCardBO1.setFunctionName("viewTemplateFields");

	MenuCardBO menuCardBO1 = new MenuCardBO();
	menuCardBO1.setEditMenuCardBO(editMenuCardBO1);
	menuCardBO1.setViewMenuCardBO(viewMenuCardBO1);
	urlMap.put("option1",menuCardBO1);
	/* First Option */
	
	/* Third Option */
	EditMenuCardBO editMenuCardBO3 = new EditMenuCardBO();
	editMenuCardBO3.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO3.setLabelCode("billCard.menu.manageBillPolicy");
	editMenuCardBO3.setFunctionName("billPolicy");

	ViewMenuCardBO viewMenuCardBO3 = new ViewMenuCardBO();
	viewMenuCardBO3.setLabelCode("billCard.menu.viewBillPolicy");
	viewMenuCardBO3.setFunctionName("billPolicy");

	MenuCardBO menuCardBO3 = new MenuCardBO();
	menuCardBO3.setEditMenuCardBO(editMenuCardBO3);
	menuCardBO3.setViewMenuCardBO(viewMenuCardBO3);
	urlMap.put("option3",menuCardBO3);
	/* Third Option */

	/* Generate Bill Opeiont */
	EditMenuCardBO editGenerateBillCardBO = new EditMenuCardBO();
	editGenerateBillCardBO.setAccessRoleId(editAccessRoleIdList);
	editGenerateBillCardBO.setLabelCode("billCard.menu.generateBill");
	editGenerateBillCardBO.setFunctionName("generateBill");
	
	MenuCardBO menuGenerateBillCardBO = new MenuCardBO();
	menuGenerateBillCardBO.setEditMenuCardBO(editGenerateBillCardBO);
	urlMap.put("menuGenerateBillCardBO",menuGenerateBillCardBO);	
	/* Generate Bill Opeiont */
	
	/* Second Option */
	EditMenuCardBO editMenuCardBO2 = new EditMenuCardBO();
	editMenuCardBO2.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO2.setLabelCode("billCard.menu.viewBill");
	editMenuCardBO2.setFunctionName("viewBill");

	ViewMenuCardBO viewMenuCardBO2 = new ViewMenuCardBO();
	viewMenuCardBO2.setLabelCode("billCard.menu.viewBill");
	viewMenuCardBO2.setFunctionName("viewBill");

	MenuCardBO menuCardBO2 = new MenuCardBO();
	menuCardBO2.setEditMenuCardBO(editMenuCardBO2);
	menuCardBO2.setViewMenuCardBO(viewMenuCardBO2);
	urlMap.put("option2",menuCardBO2);
	/* Second Option */

	

	/* Forth Option */
	EditMenuCardBO editMenuCardBO4 = new EditMenuCardBO();
	editMenuCardBO4.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO4.setLabelCode("billCard.menu.dynamicField");
	editMenuCardBO4.setFunctionName("dynamicField");

	ViewMenuCardBO viewMenuCardBO4 = new ViewMenuCardBO();
	viewMenuCardBO4.setLabelCode("billCard.menu.view.dynamicField");
	viewMenuCardBO4.setFunctionName("dynamicField");

	MenuCardBO menuCardBO4 = new MenuCardBO();
	menuCardBO4.setEditMenuCardBO(editMenuCardBO4);
	menuCardBO4.setViewMenuCardBO(viewMenuCardBO4);
	urlMap.put("option4",menuCardBO4);
	/* Forth Option */
	
	
	/* Supplementary Bill Template Option */
	EditMenuCardBO editMenuCardBOSupplementaryBillTemplate = new EditMenuCardBO();
	editMenuCardBOSupplementaryBillTemplate.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOSupplementaryBillTemplate.setLabelCode("billCard.menu.supplementaryBillTemplate");
	editMenuCardBOSupplementaryBillTemplate.setFunctionName("supplementaryBillTemplate");

	MenuCardBO menuCardBOSupplementaryBillTemplate = new MenuCardBO();
	menuCardBOSupplementaryBillTemplate.setEditMenuCardBO(editMenuCardBOSupplementaryBillTemplate);
	urlMap.put("supplementaryBillTemplate",menuCardBOSupplementaryBillTemplate);
	/* Supplementary Bill Template Option */
	
	/* Supplementary Bill Generate Option */
	EditMenuCardBO editMenuCardBOSupplementaryBillGenerate = new EditMenuCardBO();
	editMenuCardBOSupplementaryBillGenerate.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOSupplementaryBillGenerate.setLabelCode("billCard.menu.supplementaryBillGenerate");
	editMenuCardBOSupplementaryBillGenerate.setFunctionName("supplementaryBillGenerate");

	MenuCardBO menuCardBOSupplementaryBillGenerate = new MenuCardBO();
	menuCardBOSupplementaryBillGenerate.setEditMenuCardBO(editMenuCardBOSupplementaryBillGenerate);
	urlMap.put("supplementaryBillGenerate",menuCardBOSupplementaryBillGenerate);
	/* Supplementary Bill Template Option */

}
else if(dashboardSelectedMenuName.equals("manageEvent"))
{
	List<Long> editAccessRoleIdList = new ArrayList<Long>();
	editAccessRoleIdList.add(UserRoleType.SOCIETY_ADMIN);
	editAccessRoleIdList.add(UserRoleType.CHAIR_MAN);
	editAccessRoleIdList.add(UserRoleType.SECRETARY);
	editAccessRoleIdList.add(UserRoleType.TRESURER);
	editAccessRoleIdList.add(UserRoleType.SOCIETY_ALL_MEMBERS);

	/* First Option */
	EditMenuCardBO editMenuCardBO1 = new EditMenuCardBO();
	editMenuCardBO1.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO1.setLabelCode("eventCard.menu.broadCastMessage");
	editMenuCardBO1.setFunctionName("broadCastMessage");

	ViewMenuCardBO viewMenuCardBO1 = new ViewMenuCardBO();
	viewMenuCardBO1.setLabelCode("eventCard.menu.view.broadCastMessage");
	viewMenuCardBO1.setFunctionName("broadCastMessage");

	MenuCardBO menuCardBO1 = new MenuCardBO();
	menuCardBO1.setEditMenuCardBO(editMenuCardBO1);
	menuCardBO1.setViewMenuCardBO(viewMenuCardBO1);
	urlMap.put("option1",menuCardBO1);
	/* First Option */

	/* Second Option */
	EditMenuCardBO editMenuCardBO2 = new EditMenuCardBO();
	editMenuCardBO2.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO2.setLabelCode("eventCard.menu.bookProperty");
	editMenuCardBO2.setFunctionName("bookProperty");

	ViewMenuCardBO viewMenuCardBO2 = new ViewMenuCardBO();
	viewMenuCardBO2.setLabelCode("eventCard.menu.bookProperty");
	viewMenuCardBO2.setFunctionName("bookProperty");

	MenuCardBO menuCardBO2 = new MenuCardBO();
	menuCardBO2.setEditMenuCardBO(editMenuCardBO2);
	menuCardBO2.setViewMenuCardBO(viewMenuCardBO2);
	urlMap.put("option2",menuCardBO2);
	/* Second Option */

	/* Third Option */
	EditMenuCardBO editMenuCardBO3 = new EditMenuCardBO();
	editMenuCardBO3.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO3.setLabelCode("eventCard.menu.scheduleMeeting");
	editMenuCardBO3.setFunctionName("scheduleMeeting");

	ViewMenuCardBO viewMenuCardBO3 = new ViewMenuCardBO();
	viewMenuCardBO3.setLabelCode("eventCard.menu.scheduleMeeting");
	viewMenuCardBO3.setFunctionName("scheduleMeeting");

	MenuCardBO menuCardBO3 = new MenuCardBO();
	menuCardBO3.setEditMenuCardBO(editMenuCardBO3);
	menuCardBO3.setViewMenuCardBO(viewMenuCardBO3);
	urlMap.put("option3",menuCardBO3);
	/* Third Option */

	/* Forth Option */
	EditMenuCardBO editMenuCardBO4 = new EditMenuCardBO();
	editMenuCardBO4.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO4.setLabelCode("eventCard.menu.scheduleFestivalCelebration");
	editMenuCardBO4.setFunctionName("scheduleFestival");

	ViewMenuCardBO viewMenuCardBO4 = new ViewMenuCardBO();
	viewMenuCardBO4.setLabelCode("eventCard.menu.scheduleFestivalCelebration");
	viewMenuCardBO4.setFunctionName("scheduleFestival");

	MenuCardBO menuCardBO4 = new MenuCardBO();
	menuCardBO4.setEditMenuCardBO(editMenuCardBO4);
	menuCardBO4.setViewMenuCardBO(viewMenuCardBO4);
	urlMap.put("option4",menuCardBO4);
	/* Forth Option */
	
	/* Fifth Option */
	EditMenuCardBO editMenuCardBO5 = new EditMenuCardBO();
	editMenuCardBO5.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO5.setLabelCode("eventCard.menu.manageNotice");
	editMenuCardBO5.setFunctionName("createNotice");

	ViewMenuCardBO viewMenuCardBO5 = new ViewMenuCardBO();
	viewMenuCardBO5.setLabelCode("eventCard.menu.manageNotice");
	viewMenuCardBO5.setFunctionName("createNotice");

	MenuCardBO menuCardBO5 = new MenuCardBO();
	menuCardBO5.setEditMenuCardBO(editMenuCardBO5);
	menuCardBO5.setViewMenuCardBO(viewMenuCardBO5);
	urlMap.put("option5",menuCardBO5);
	/* Fifth Option */
	
	/* Poll Option */
	EditMenuCardBO editMenuCardPollBO = new EditMenuCardBO();
	editMenuCardPollBO.setAccessRoleId(editAccessRoleIdList);
	editMenuCardPollBO.setLabelCode("eventCard.menu.managePoll");
	editMenuCardPollBO.setFunctionName("managePoll");

	ViewMenuCardBO viewMenuCardPollBO = new ViewMenuCardBO();
	viewMenuCardPollBO.setLabelCode("eventCard.menu.managePoll");
	viewMenuCardPollBO.setFunctionName("managePoll");

	MenuCardBO menuCardPollBO = new MenuCardBO();
	menuCardPollBO.setEditMenuCardBO(editMenuCardPollBO);
	menuCardPollBO.setViewMenuCardBO(viewMenuCardPollBO);
	urlMap.put("menuCardPollBO",menuCardPollBO);
	/* Poll Option */
	
	/* Ballot Option */
	EditMenuCardBO editMenuCardBallotBO = new EditMenuCardBO();
	editMenuCardBallotBO.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBallotBO.setLabelCode("eventCard.menu.manageSecretBallot");
	editMenuCardBallotBO.setFunctionName("manageSecretBallot");

	MenuCardBO menuCardBallotBO = new MenuCardBO();
	menuCardBallotBO.setEditMenuCardBO(editMenuCardBallotBO);
	urlMap.put("menuCardBallotBO",menuCardBallotBO);
	/* Ballot Option */
	
	
	/* Six Option */
	EditMenuCardBO editMenuCardBO6 = new EditMenuCardBO();
	editMenuCardBO6.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO6.setLabelCode("eventCard.menu.manageComplaints");
	editMenuCardBO6.setFunctionName("manageComplaints");

	ViewMenuCardBO viewMenuCardBO6 = new ViewMenuCardBO();
	viewMenuCardBO6.setLabelCode("eventCard.menu.manageComplaints");
	viewMenuCardBO6.setFunctionName("manageComplaints");

	MenuCardBO menuCardBO6 = new MenuCardBO();
	menuCardBO6.setEditMenuCardBO(editMenuCardBO6);
	menuCardBO6.setViewMenuCardBO(viewMenuCardBO6);
	urlMap.put("option6",menuCardBO6);
	/* Six Option */
}
else if(dashboardSelectedMenuName.equals("manageAccount"))
{
	List<Long> editAccessRoleIdList = new ArrayList<Long>();
	editAccessRoleIdList.add(UserRoleType.SOCIETY_ADMIN);
	editAccessRoleIdList.add(UserRoleType.CHAIR_MAN);
	editAccessRoleIdList.add(UserRoleType.SECRETARY);
	editAccessRoleIdList.add(UserRoleType.TRESURER);
	
	/* First Option */
	EditMenuCardBO editMenuCardBO1 = new EditMenuCardBO();
	editMenuCardBO1.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO1.setLabelCode("accountCard.menu.income.Receipt");
	editMenuCardBO1.setFunctionName("receipts");
	
	ViewMenuCardBO viewMenuCardBO1 = new ViewMenuCardBO();
	viewMenuCardBO1.setLabelCode("accountCard.menu.view.income.Receipt");
	viewMenuCardBO1.setFunctionName("receipts");
	
	MenuCardBO menuCardBO1 = new MenuCardBO();
	menuCardBO1.setEditMenuCardBO(editMenuCardBO1);
	menuCardBO1.setViewMenuCardBO(viewMenuCardBO1);
	urlMap.put("option1",menuCardBO1);
	/* First Option */
	
	/* Second Option */
	
	EditMenuCardBO editMenuCardBO2 = new EditMenuCardBO();
	editMenuCardBO2.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO2.setLabelCode("accountCard.menu.expense.Receipt");
	editMenuCardBO2.setFunctionName("pettyCash");
	
	ViewMenuCardBO viewMenuCardBO2 = new ViewMenuCardBO();
	viewMenuCardBO2.setLabelCode("accountCard.menu.view.expense.Receipt");
	viewMenuCardBO2.setFunctionName("pettyCash");
	
	MenuCardBO menuCardBO2 = new MenuCardBO();
	menuCardBO2.setEditMenuCardBO(editMenuCardBO2);
	menuCardBO2.setViewMenuCardBO(viewMenuCardBO2);
	urlMap.put("option2",menuCardBO2);
	
	/* Second Option */
	
	/* Third Option */
	
	EditMenuCardBO editMenuCardBOContra = new EditMenuCardBO();
	editMenuCardBOContra.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOContra.setLabelCode("accountCard.menu.contra.receipt");
	editMenuCardBOContra.setFunctionName("contraReceipt");
	
	ViewMenuCardBO viewMenuCardBOContra = new ViewMenuCardBO();
	viewMenuCardBOContra.setLabelCode("accountCard.menu.view.contra.receipt");
	viewMenuCardBOContra.setFunctionName("contraReceipt");
	
	MenuCardBO menuCardBOContra = new MenuCardBO();
	menuCardBOContra.setEditMenuCardBO(editMenuCardBOContra);
	menuCardBOContra.setViewMenuCardBO(viewMenuCardBOContra);
	urlMap.put("menuCardBOContra",menuCardBOContra);
	
	/* Third Option */
	
	/* Forth Option */
	
	EditMenuCardBO editMenuCardBOJournal = new EditMenuCardBO();
	editMenuCardBOJournal.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOJournal.setLabelCode("accountCard.menu.journal.receipt");
	editMenuCardBOJournal.setFunctionName("journalReceipt");
	
	ViewMenuCardBO viewMenuCardBOJournal = new ViewMenuCardBO();
	viewMenuCardBOJournal.setLabelCode("accountCard.menu.view.journal.receipt");
	viewMenuCardBOJournal.setFunctionName("journalReceipt");
	
	MenuCardBO menuCardBOJournal = new MenuCardBO();
	menuCardBOJournal.setEditMenuCardBO(editMenuCardBOJournal);
	menuCardBOJournal.setViewMenuCardBO(viewMenuCardBOJournal);
	urlMap.put("menuCardBOJournal",menuCardBOJournal);
	
	/* Forth Option */
	
	/* New Option */
	
	EditMenuCardBO editMenuCardBODebitNotes = new EditMenuCardBO();
	editMenuCardBODebitNotes.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBODebitNotes.setLabelCode("accountCard.menu.debit.notes");
	editMenuCardBODebitNotes.setFunctionName("debitNotes");
	
	ViewMenuCardBO viewMenuCardBODebitNotes = new ViewMenuCardBO();
	viewMenuCardBODebitNotes.setLabelCode("accountCard.menu.view.debit.notes");
	viewMenuCardBODebitNotes.setFunctionName("debitNotes");
	
	MenuCardBO menuCardBODebitNotes = new MenuCardBO();
	menuCardBODebitNotes.setEditMenuCardBO(editMenuCardBODebitNotes);
	menuCardBODebitNotes.setViewMenuCardBO(viewMenuCardBODebitNotes);
	urlMap.put("menuCardBODebitNotes",menuCardBODebitNotes);
	
	/* New Option */
	
	/* New Option */
	
	EditMenuCardBO editMenuCardBOCreditNotes = new EditMenuCardBO();
	editMenuCardBOCreditNotes.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOCreditNotes.setLabelCode("accountCard.menu.credit.notes");
	editMenuCardBOCreditNotes.setFunctionName("creditNotes");
	
	ViewMenuCardBO viewMenuCardBOCreditNotes = new ViewMenuCardBO();
	viewMenuCardBOCreditNotes.setLabelCode("accountCard.menu.view.credit.notes");
	viewMenuCardBOCreditNotes.setFunctionName("creditNotes");
	
	MenuCardBO menuCardBOCreditNotes = new MenuCardBO();
	menuCardBOCreditNotes.setEditMenuCardBO(editMenuCardBOCreditNotes);
	menuCardBOCreditNotes.setViewMenuCardBO(viewMenuCardBOCreditNotes);
	urlMap.put("menuCardBOCreditNotes",menuCardBOCreditNotes);
	
	/* New Option */
	
	
	/* Fifth Option */
	EditMenuCardBO editMenuCardBO3 = new EditMenuCardBO();
	editMenuCardBO3.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO3.setLabelCode("collectionCard.menu.billPayment");
	editMenuCardBO3.setFunctionName("billPayment");
	
	MenuCardBO menuCardBO3 = new MenuCardBO();
	menuCardBO3.setEditMenuCardBO(editMenuCardBO3);
	urlMap.put("option3",menuCardBO3);
	/* Fifth Option */
	
	/* Cheque Return option */
	EditMenuCardBO editMenuCardChequeReturn = new EditMenuCardBO();
	editMenuCardChequeReturn.setAccessRoleId(editAccessRoleIdList);
	editMenuCardChequeReturn.setLabelCode("accountCard.menu.ChequeReturn");
	editMenuCardChequeReturn.setFunctionName("chequeReturn");

	
	MenuCardBO menuCardChequeReturn = new MenuCardBO();
	menuCardChequeReturn.setEditMenuCardBO(editMenuCardChequeReturn);
	urlMap.put("menuCardChequeReturn",menuCardChequeReturn);
		
	
	/* Cheque Return option */
	/* Sixth Option */
	
	EditMenuCardBO editMenuCardBO4 = new EditMenuCardBO();
	editMenuCardBO4.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO4.setLabelCode("expenseCard.menu.BillClearance");
	editMenuCardBO4.setFunctionName("billClearance");
	
	MenuCardBO menuCardBO4 = new MenuCardBO();
	menuCardBO4.setEditMenuCardBO(editMenuCardBO4);
	urlMap.put("option4",menuCardBO4);
	
	/* Sixth Option */
	
	/* Seventh Option */
	
	EditMenuCardBO editMenuCardBO5 = new EditMenuCardBO();
	editMenuCardBO5.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO5.setLabelCode("accountCard.menu.view.balancesheet");
	editMenuCardBO5.setFunctionName("viewBalanceSheet");
	
	ViewMenuCardBO viewMenuCardBO5 = new ViewMenuCardBO();
	viewMenuCardBO5.setLabelCode("accountCard.menu.view.balancesheet");
	viewMenuCardBO5.setFunctionName("viewBalanceSheet");
	
	MenuCardBO menuCardBO5 = new MenuCardBO();
	menuCardBO5.setEditMenuCardBO(editMenuCardBO5);
	menuCardBO5.setViewMenuCardBO(viewMenuCardBO5);
	urlMap.put("option5",menuCardBO5);
	
	/* Seventh Option */
	
	/* Eighth Option */
	
	EditMenuCardBO editMenuCardBO6 = new EditMenuCardBO();
	editMenuCardBO6.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO6.setLabelCode("expenseCard.menu.PurchaseOrder");
	editMenuCardBO6.setFunctionName("purchaseOrder");
	
	MenuCardBO menuCardBO6 = new MenuCardBO();
	menuCardBO6.setEditMenuCardBO(editMenuCardBO6);
	urlMap.put("option6",menuCardBO6);
	
	/* Eighth Option */
	
	/* Ninth Option */
	
	EditMenuCardBO editMenuCardBO7 = new EditMenuCardBO();
	editMenuCardBO7.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO7.setLabelCode("accountCard.menu.manageledger");
	editMenuCardBO7.setFunctionName("manageLedgerPage");
	
	MenuCardBO menuCardBO7 = new MenuCardBO();
	menuCardBO7.setEditMenuCardBO(editMenuCardBO7);
	urlMap.put("option7",menuCardBO7);
	
	/* Ninth Option */
	

	/* Tenth Option */
	
	EditMenuCardBO editMenuCardBOAccountSettings = new EditMenuCardBO();
	editMenuCardBOAccountSettings.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOAccountSettings.setLabelCode("accountCard.menu.editAccountSetting");
	editMenuCardBOAccountSettings.setFunctionName("manageAccountSetting");
	
	MenuCardBO menuCardBOAccountSettings = new MenuCardBO();
	menuCardBOAccountSettings.setEditMenuCardBO(editMenuCardBOAccountSettings);
	urlMap.put("optionAccountSettings",menuCardBOAccountSettings);
	
	/* Tenth Option */
} // End of if(dashboardSelectedMenuName.equals("manageAccount"))
else if(dashboardSelectedMenuName.equals("manageReports"))
{
	List<Long> editAccessRoleIdList = new ArrayList<Long>();
	editAccessRoleIdList.add(UserRoleType.SOCIETY_ADMIN);
	editAccessRoleIdList.add(UserRoleType.CHAIR_MAN);
	editAccessRoleIdList.add(UserRoleType.SECRETARY);
	editAccessRoleIdList.add(UserRoleType.TRESURER);

	/* First Option */
	EditMenuCardBO editMenuCardBO1 = new EditMenuCardBO();
	editMenuCardBO1.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO1.setLabelCode("reportCard.menu.monthlyBillSummary");
	editMenuCardBO1.setFunctionName("monthlyBillSummary");

	MenuCardBO menuCardBO1 = new MenuCardBO();
	menuCardBO1.setEditMenuCardBO(editMenuCardBO1);
	urlMap.put("option1",menuCardBO1);
	/* First Option */
	
	
	/* Second Option */
	EditMenuCardBO editMenuCardBO2 = new EditMenuCardBO();
	editMenuCardBO2.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO2.setLabelCode("reportCard.menu.ledgerReports");
	editMenuCardBO2.setFunctionName("ledgerReports");

	ViewMenuCardBO viewMenuCardBO2 = new ViewMenuCardBO();
	viewMenuCardBO2.setLabelCode("reportCard.menu.ledgerReports");
	viewMenuCardBO2.setFunctionName("ledgerReports");

	MenuCardBO menuCardBO2 = new MenuCardBO();
	menuCardBO2.setEditMenuCardBO(editMenuCardBO2);
	menuCardBO2.setViewMenuCardBO(viewMenuCardBO2);
	urlMap.put("option2",menuCardBO2);
	/* Second Option */
	
	/* Trail Balance Option */
	EditMenuCardBO editMenuCardBOTrailBalanceReport = new EditMenuCardBO();
	editMenuCardBOTrailBalanceReport.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOTrailBalanceReport.setLabelCode("reportCard.menu.trailBalanceReports");
	editMenuCardBOTrailBalanceReport.setFunctionName("trailBalanceReports");

	ViewMenuCardBO viewMenuCardTrailBalanceReport = new ViewMenuCardBO();
	viewMenuCardTrailBalanceReport.setLabelCode("reportCard.menu.trailBalanceReports");
	viewMenuCardTrailBalanceReport.setFunctionName("trailBalanceReports");

	MenuCardBO menuCardBOTrailBalanceReport = new MenuCardBO();
	menuCardBOTrailBalanceReport.setEditMenuCardBO(editMenuCardBOTrailBalanceReport);
	menuCardBOTrailBalanceReport.setViewMenuCardBO(viewMenuCardTrailBalanceReport);
	urlMap.put("trailBalanceReportOption",menuCardBOTrailBalanceReport);
	/* Trail Balance Option */
	
    /* Bank Pass Book Reconcilation Option */
	EditMenuCardBO editMenuCardBOBankPassBookRecoReport = new EditMenuCardBO();
	editMenuCardBOBankPassBookRecoReport.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOBankPassBookRecoReport.setLabelCode("reportCard.menu.bankPassBookReconciliationReport");
	editMenuCardBOBankPassBookRecoReport.setFunctionName("bankPassBookReconciliationReport");

	MenuCardBO menuCardBOBankPassBookRecoReport = new MenuCardBO();
	menuCardBOBankPassBookRecoReport.setEditMenuCardBO(editMenuCardBOBankPassBookRecoReport);
	urlMap.put("bankPassBookReconciliationReportOption",menuCardBOBankPassBookRecoReport);
	/* Bank Pass Book  Reconcilation Option */
	
	/* Bank Reconcilation Option */
	EditMenuCardBO editMenuCardBOBankReconciliationReport = new EditMenuCardBO();
	editMenuCardBOBankReconciliationReport.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOBankReconciliationReport.setLabelCode("reportCard.menu.bankReconciliationReport");
	editMenuCardBOBankReconciliationReport.setFunctionName("bankReconciliationReport");

	MenuCardBO menuCardBOBankReconciliationReport = new MenuCardBO();
	menuCardBOBankReconciliationReport.setEditMenuCardBO(editMenuCardBOBankReconciliationReport);
	urlMap.put("bankReconciliationReportOption",menuCardBOBankReconciliationReport);
	/* Bank Reconcilation Option */
	

	
	/* Statutory Option */
	EditMenuCardBO editMenuCardBOStatutoryReport = new EditMenuCardBO();
	editMenuCardBOStatutoryReport.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBOStatutoryReport.setLabelCode("reportCard.menu.statutoryReports");
	editMenuCardBOStatutoryReport.setFunctionName("statutoryReports");

	MenuCardBO menuCardBOStatutoryReport = new MenuCardBO();
	menuCardBOStatutoryReport.setEditMenuCardBO(editMenuCardBOStatutoryReport);
	urlMap.put("statutoryReportOption",menuCardBOStatutoryReport);
	/* Statutory Option */

}else if(dashboardSelectedMenuName.equals("admin"))
{
	List<Long> editAccessRoleIdList = new ArrayList<Long>();
	editAccessRoleIdList.add(UserRoleType.SYSTEM_MASTER_ADMIN);
	
	/* First Option */
	EditMenuCardBO editMenuCardBO1 = new EditMenuCardBO();
	editMenuCardBO1.setAccessRoleId(editAccessRoleIdList);
	editMenuCardBO1.setLabelCode("adminCard.menu.netBankingConfiguration");
	editMenuCardBO1.setFunctionName("manageNetBankingConfigurationPage");

	MenuCardBO menuCardBO1 = new MenuCardBO();
	menuCardBO1.setEditMenuCardBO(editMenuCardBO1);
	urlMap.put("option1",menuCardBO1);
	/* First Option */
}
%>
	    <%
	      for(int i=0 ; i<userSocietyBOList.size(); i++)
	      {
	    	  SocietyBO societyBO = (SocietyBO)userSocietyBOList.get(i);	      
	    %>
				
		<div class="societyCard">
		
			<div class="SocietyPicHolder">
				<%
				 String societyProfileImageThumb = ctxPath+"/images/common/en_US/buildingImg.jpg";
				 if(societyBO.getProfileImageFileName() != null)
				 {
					 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
					 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.SOCIETY_ENTITY) +"/" +societyBO.getSocietyId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_SOCIETY_PROFILE_MODULE);
					 societyProfileImageThumb = finalAttachementDirectoryLocation + "/" + societyBO.getProfileImageFileName();
				 }
				%>				
				<div class="societyPic">
						<%if(societyBO.getProfileImageFileName() != null)
						{%>
						<img alt="" src="<%=societyProfileImageThumb%>" width="100%" height="180px">
						<%
						}else{
						%>
						<img alt="" src="<%=societyProfileImageThumb%>">
						<%
						}
						%>					
				</div>						
			</div>
					
			<div class="societyActivityHolder">
				 <%
			  		Iterator mapIterator = urlMap.keySet().iterator();
			  		while(mapIterator.hasNext())
			  		{	 
				 		 boolean isOptionEligibleToShow = false;
				 		 boolean isEditOptinShow = false;
				 		 String key = (String)mapIterator.next();
				 		 MenuCardBO tempMenuCardBO = (MenuCardBO)urlMap.get(key);
				 		 EditMenuCardBO tmpeditMenuCardBO = tempMenuCardBO.getEditMenuCardBO();
				 		 ViewMenuCardBO tmpviewMenuCardBO = tempMenuCardBO.getViewMenuCardBO();
				 		 
				 		 List<Long> tmpAccessRoleID = tmpeditMenuCardBO.getAccessRoleId();
				 		 List<Long> tmpUserSocietyRoleID = (List<Long>)userSocietyRoleIdMap.get(societyBO.getSocietyId());
			  			
				 		 String labelName = null;
				  		 String functionName = null;
				  		 String pageRenderMode = null;
				  		 
				  		 for(Long roleId : tmpAccessRoleID)
				  		 {
				  			 if(tmpUserSocietyRoleID.contains(roleId))
				  			 {
				  				isEditOptinShow = true;
				  				 
				  				 /* labelName = tmpeditMenuCardBO.getLabelCode();
						  		functionName = tmpeditMenuCardBO.getFunctionName();
						  		pageRenderMode = CommonConstant.EDIT_MODE;
						  		isOptionEligibleToShow = true;
				  			 }else if(tempMenuCardBO.getViewMenuCardBO() != null)
				  			 {
				  				 labelName = tmpviewMenuCardBO.getLabelCode();
						  		 functionName = tmpviewMenuCardBO.getFunctionName();
						  		 pageRenderMode = CommonConstant.VIEW_MODE;
						  		isOptionEligibleToShow = true; */
				  			 }
				  		 }
				  		 
				  		 if(isEditOptinShow && tempMenuCardBO.getEditMenuCardBO() != null)
				  		 {
				  			labelName = tmpeditMenuCardBO.getLabelCode();
					  		functionName = tmpeditMenuCardBO.getFunctionName();
					  		pageRenderMode = CommonConstant.EDIT_MODE;
					  		isOptionEligibleToShow = true;
				  		 }else if(tempMenuCardBO.getViewMenuCardBO() != null)
			  			 {
			  				labelName = tmpviewMenuCardBO.getLabelCode();
					  		functionName = tmpviewMenuCardBO.getFunctionName();
					  		pageRenderMode = CommonConstant.VIEW_MODE;
					  		isOptionEligibleToShow = true;
			  			 }				  		 
				  		 
					if(isOptionEligibleToShow){	
			     %>
			     <a href="javascript:<%=functionName%>('<%=societyBO.getSocietyId()%>','<%=pageRenderMode%>');">
					<spring:message code="<%=labelName%>"/>
				</a>
				<%
					} //  End of if(isOptionEligibleToShow)
				   } // End of While
				%>												
			</div>	
			
			<div class="societyName">
				<%=societyBO.getSocietyName()%>
			</div>
			
			<div class="societyAddress">
				<%=societyBO.getFormatedAddress()%>				
			</div>
			
			
			
		</div>
		<%
	      } // end of  for(int i=0 ; i<userSocietyBOList.size(); i++)
		%>
		
<script>
	if(<%=totalSocietyBO%> != <%=userSocietyBOList.size()%>)
		{
			$("#showAllSocietyLink").text("Show All (<%=totalSocietyBO%>) Society");
		}
	else
		{
			$("#showAllSocietyLink").text("");
		}
</script>