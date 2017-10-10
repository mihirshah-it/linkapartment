<%@page import="app.societywala.account.bo.JournalEntityType"%>
<%@page import="app.societywala.account.bo.DebitNotesEntryDetailsBO"%>
<%@page import="app.societywala.account.bo.SocietyDebitNotesEntryBO"%>
<%@page import="app.societywala.account.bo.JournalEntryDetailsType"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Debit Notes Entry Details</TITLE>
	<!-- Page Specific Java Script Variables  -->
	<script>
	var journalDetailsTypeBY = '<%=JournalEntryDetailsType.BY%>';
	var journalDetailsTypeTO = '<%=JournalEntryDetailsType.TO%>';
	</script>
</HEAD>

<%
String mainMenu = "manageAccount";
String subMenu  = "debitNotes";

String formSubmitAction=ctxPath+"/account/saveJournalEntryPage.htm";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);

SocietyDebitNotesEntryBO societyJournalEntryBO =(SocietyDebitNotesEntryBO)request.getAttribute("societyJournalEntryBO");
List<DebitNotesEntryDetailsBO> journalEntryByDetailsList = (List<DebitNotesEntryDetailsBO>)request.getAttribute("journalEntryByDetailsList");
List<DebitNotesEntryDetailsBO> journalEntryToDetailsList = (List<DebitNotesEntryDetailsBO>)request.getAttribute("journalEntryToDetailsList");

Boolean isViewMode = false;
if (pageRenderMode.equals(CommonConstant.VIEW_MODE))
{
	isViewMode = true;
}
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<nav class="navbar-static-top">
  	<div id="subNavBar" class="navbar-collapse collapse in">
          <ul class="nav navbar-nav">
             <li>
				<a  href="javascript:;"  onclick="javascript: backURL();"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.back"/></a>
			</li>
			<% if (pageRenderMode.equals(CommonConstant.VIEW_MODE) == false) { %>
			<li>
				<a  href="javascript:;"  onclick="javascript:addNewJournalEntry();"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;<spring:message code="account.manage.debit.notes.entry.page.btn.add.journalEntry"/></a>
			</li>
			<%} %>
			<li>
            	<a  href="javascript:;"  onclick="javascript:printJournalEntryReceipt();" id="print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="account.debit.notes.entry.form.label.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Debit Notes Entry Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="journalReceiptForm" method="post">
						 <input type="hidden" id="voucherId" name="voucherId" value="<%=societyJournalEntryBO.getDebitNotesEntryId()%>">
					</form>
					<div class="box box-primary">
						<form:form  cssClass="form"  style="width:100%;" method="post" commandName="societyJournalEntryBO">
						<form:hidden path="debitNotesEntryId"/>
						<form:hidden path="sequenceNumber"/>
						<form:hidden path="isChequeReturnEntry"/>
						<div class="box-header with-border">
							<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) == false) { %>
							<div class="form-group">
								<form:label cssClass="control-label" path="sequenceNumber">
									Sr No.
								</form:label>
								<form:label cssClass="control-label" path="sequenceNumber">
									${societyJournalEntryBO.sequenceNumber}
								</form:label>				
							</div>
							<% } %>
						</div>
						<div class="box-body">
							<div class="form-group">
								<table class="table table-bordered dt-responsive">
								<tr>
									<td>
										<input type="hidden" name="journalEntryByFieldCounter" id="journalEntryByFieldCounter" value="<%=journalEntryByDetailsList.size()%>"/>
										<table class="table table-bordered dt-responsive" id="journalEntryByTbl">
											<thead>
												<tr>
													<td colspan="2">
														<button type="button" onclick="javascript:showAddJournalDetailFieldPopup('<%=JournalEntryDetailsType.BY%>');" class="btn btn-primary"><spring:message code="account.journal.entry.form.page.lable.by"/></button>
													</td>
												</tr>
												<tr>
													<td width="60%" >
														<label class="control-label required">(Expenses/Receiver/Received)</label>
													</td>	
													<td width="40%">
														<label class="control-label required"><spring:message code="account.journal.entry.form.page.lable.rupees"/></label>
													</td>					
												</tr>					
											</thead>
											<tbody>						
												<c:forEach items="${journalEntryByDetailsList}" var="journalEntryByDetails" varStatus="counter">
											 		<tr id="journalEntryByDetailsBOTR${counter.count}">
											 			<td><label class="control-label">${journalEntryByDetails.accountLedgerSubTypeBO.ledgerTypeTitle}</label></td>
											 			<td align="right">
											 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
											 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryByDetails.amount}" />
											 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
											 				<input type="number" class="form-control" name="journalEntryByDetailsValue${counter.count}" id="journalEntryByDetailsValue${counter.count}" value="${journalEntryByDetails.amount}" onblur="javascript:computeTotal(<%=JournalEntryDetailsType.BY%>);" required>
											 				<a href="javascript:deletePersistanceJournalEntryDetailBO(${counter.count},<%=JournalEntryDetailsType.BY%>);">Delete</a>
											 				<input type="hidden" name="journalEntryByDetails${counter.count}" id="journalEntryByDetails${counter.count}" value="${journalEntryByDetails.debitNotesEntryDetailsId}">
											 				<input type="hidden" name="journalEntryByDetailsFieldLedgerId${counter.count}" id="journalEntryByDetailsFieldLedgerId${counter.count}" value="${journalEntryByDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
											 				<input type="hidden" name="journalEntryByDetailsStatus${counter.count}" id="journalEntryByDetailsStatus${counter.count}" value="update">
											 			<%} %>				
											 			</td> 			
											 		</tr>
										 		</c:forEach>
											</tbody>
										</table>
									</td>
									<td>		
										<input type="hidden" name="journalEntryToFieldCounter" id="journalEntryToFieldCounter" value="<%=journalEntryToDetailsList.size()%>"/>	
										<table class="table table-bordered dt-responsive" id="journalEntryToTbl">
											<thead>
												<tr>
													<td colspan="2">
														<button type="button" onclick="javascript:showAddJournalDetailFieldPopup('<%=JournalEntryDetailsType.TO%>');" class="btn btn-primary"><spring:message code="account.journal.entry.form.page.lable.to"/></button>
													</td>
												</tr>
												<tr>
													<td width="60%" >
														<label class="control-label required">(Gain/Giver/Given)</label>
													</td>	
													<td width="40%">
														<label class="control-label required"><spring:message code="account.journal.entry.form.page.lable.rupees"/></label>
													</td>					
												</tr>					
											</thead>
											<tbody>
												<c:forEach items="${journalEntryToDetailsList}" var="journalEntryToDetails" varStatus="counter">
											 		<tr id="journalEntryToDetailsBOTR${counter.count}">
											 			<td><label class="control-label">${journalEntryToDetails.accountLedgerSubTypeBO.ledgerTypeTitle}</label></td>
											 			<td align="right">
											 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
											 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryToDetails.amount}" />
											 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
											 				<input type="number" class="form-control" name="journalEntryToDetailsValue${counter.count}" id="journalEntryToDetailsValue${counter.count}" value="${journalEntryToDetails.amount}" onblur="javascript:computeTotal(<%=JournalEntryDetailsType.TO%>);" required>
											 				<a href="javascript:deletePersistanceJournalEntryDetailBO(${counter.count},<%=JournalEntryDetailsType.TO%>);">Delete</a>
											 				<input type="hidden" name="journalEntryToDetails${counter.count}" id="journalEntryToDetails${counter.count}" value="${journalEntryToDetails.debitNotesEntryDetailsId}">
											 				<input type="hidden" name="journalEntryToDetailsFieldLedgerId${counter.count}" id="journalEntryToDetailsFieldLedgerId${counter.count}" value="${journalEntryToDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
											 				<input type="hidden" name="journalEntryToDetailsStatus${counter.count}" id="journalEntryToDetailsStatus${counter.count}" value="update">
											 			<%} %>				
											 			</td> 			
											 		</tr>
										 		</c:forEach>
											</tbody>
										</table>
										</td>
									</tr>
									<tfoot>
										<tr>
											<td>
												<table class="table table-bordered dt-responsive">
													<tr>
														<td width="60%" >
															<label class="control-label"><spring:message code="account.journal.entry.form.page.lable.total"/></label>
														</td>	
														<td width="40%" id="totalByFieldTD">
															${societyJournalEntryBO.amount}							
														</td>					
													</tr>				
												</table>
											</td>
											<td>
												<table class="table table-bordered dt-responsive">
													<tr>
														<td width="60%" >
															<label class="control-label"><spring:message code="account.journal.entry.form.page.lable.total"/></label>
														</td>	
														<td width="40%" id="totalToFieldTD">
															${societyJournalEntryBO.amount}							
														</td>					
													</tr>	
												</table>
											</td>
										</tr>
									</tfoot>
								</table>			
							</div> <!-- End of Particular -->
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="debitNotesEntryDate">
									<spring:message code="account.debit.notes.entry.form.page.lable.JournalEntry.Date"/>
								</form:label>
								<div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="debitNotesEntryDate" dateFormat="dateFormat" required="required"/>
			                  	</div>												
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label" path="chequeDDNumber">
									<spring:message code="label.Cheque.or.DD.Number"/>
								</form:label>
								<form:input cssClass="form-control" path="chequeDDNumber" htmlEscape="true"/>				
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label" path="narration">
									<spring:message code="account.journal.entry.form.page.lable.narration"/>
								</form:label>
								<form:input cssClass="form-control" path="narration" htmlEscape="true"/>						
							</div>
							
						</div> <!--  End of box body -->
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								<button type="button" onclick="saveJournalEntry();" class="btn btn-primary"><spring:message code="common.button.save"/></button>
								<button type="button" onclick="saveAndPrintJournalEntry();" class="btn btn-primary"><spring:message code="common.button.save.and.print"/></button>
							<%} %>
						</div>
						</form:form>
    				</div> <!--  End of box -->
    				
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->

<div class="modal fade" id="addJournalDetailFieldPopupForm" tabindex="-1" role="dialog" aria-labelledby="Debit Entry details">
</div>	

<!-- End Code for Footer -->
<Script type="text/javascript">
	bindRestrictedDatePicker('debitNotesEntryDate',minJqueryDateFmtStr,maxJqueryDateFmtStr);
	var journalEntityType = '<%=JournalEntityType.DEBIT_NOTES_ENTRY%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/account/debitNotesEntryVoucherPage.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/account/debitNotesEntryReceiptPage.js?${Server_Token_Value}" ></script>
</body>

<%if(request.getParameter("isSaveAndPrintSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
	<script>
		printJournalEntryReceipt();
	</script>
<% } %>

</html>
