<%@page import="app.societywala.account.bo.AccountReferenceType"%>
<%@page import="app.societywala.account.bo.JournalEntityType"%>
<%@page import="app.societywala.account.bo.JournalEntryDetailsType"%>
<%@page import="app.societywala.account.bo.JournalEntryDetailsBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.account.bo.SocietyJournalEntryBO"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Journal Entry Details</TITLE>
	<!-- Page Specific Java Script Variables  -->
	<script>
	var journalDetailsTypeBY = '<%=JournalEntryDetailsType.BY%>';
	var journalDetailsTypeTO = '<%=JournalEntryDetailsType.TO%>';
	var journalDetailsTypeBYTDS = '<%=JournalEntryDetailsType.BY_DUTIES_TAX_TDS%>';
	var journalDetailsTypeTOTDS = '<%=JournalEntryDetailsType.TO_DUTIES_TAX_TDS%>';
	</script>
</HEAD>

<%
String mainMenu = "manageAccount";
String subMenu  = "journalReceipt";

String formSubmitAction=ctxPath+"/account/saveJournalEntryPage.htm";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);

SocietyJournalEntryBO societyJournalEntryBO =(SocietyJournalEntryBO)request.getAttribute("societyJournalEntryBO");
List<JournalEntryDetailsBO> journalEntryByDetailsList = (List<JournalEntryDetailsBO>)request.getAttribute("journalEntryByDetailsList");
List<JournalEntryDetailsBO> journalEntryToDetailsList = (List<JournalEntryDetailsBO>)request.getAttribute("journalEntryToDetailsList");

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
				<a href="javascript:;"  onclick="javascript:backURL();"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.back"/></a>
			</li>
			<% if (pageRenderMode.equals(CommonConstant.VIEW_MODE) == false) { %>
			<li>
				<a href="javascript:;"  onclick="javascript:addNewJournalEntry();"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;<spring:message code="account.manage.journal.entry.page.btn.add.journalEntry"/></a>
			</li>
			<%} %>
			<li>
            	<a href="javascript:;"  onclick="javascript:printJournalEntryReceipt();" id="print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="account.journal.entry.form.label.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Journal Entry Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="journalReceiptForm" method="post">
						 <input type="hidden" id="voucherId" name="voucherId" value="<%=societyJournalEntryBO.getJournalEntryId()%>">
					</form>
					<form:form  method="post" commandName="societyJournalEntryBO" id="societyJournalEntryBO">
					<form:hidden path="journalEntryId"/>
					<form:hidden path="sequenceNumber"/>
    				<div class="box box-primary">
						<div class="box-header with-border">
							<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) == false) { %>
							<div class="form-group">
								<form:label cssClass="control-label" path="sequenceNumber">
									Sr No
								</form:label>
								<form:label cssClass="control-label" path="sequenceNumber">
									${societyJournalEntryBO.sequenceNumber}
								</form:label>				
							</div>
							<% } %>
						</div>
						<div class="box-body">
							<div class="form-group">
								<form:label cssClass="control-label required" path="journalEntryDate">
									<spring:message code="account.journal.entry.form.page.lable.JournalEntry.Date"/>
								</form:label>
								 <div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="journalEntryDate" dateFormat="dateFormat" required="required"/>
			                  	</div>				
							</div>
						
							<div class="form-group">
									<table class="table table-bordered dt-responsive">
										<tr>
									<%for(int i=1; i <=2 ; i++){ 
										String journalDetailsTypeName = null;
										String tableClassName = null;
										List<JournalEntryDetailsBO> journalEntryDetailsList = null;
										Integer journalEntryDetailsTypeId = null;
										String buttonName = null;
										String tableHeadingTitle = null;
										if(i == 1) // 1 is render By Field
										{
											journalDetailsTypeName = "By";
											tableClassName = "leftTable";
											journalEntryDetailsList = journalEntryByDetailsList;
											journalEntryDetailsTypeId = JournalEntryDetailsType.BY;
											tableHeadingTitle = "(Expenses/Receiver/Received)";
											buttonName = "account.journal.entry.form.page.lable.by";
										}
										else // 2 is render To Field
										{
											journalDetailsTypeName = "To";	
											tableClassName = "rightTable";
											journalEntryDetailsList = journalEntryToDetailsList;
											journalEntryDetailsTypeId = JournalEntryDetailsType.TO;
											tableHeadingTitle = "(Gain/Giver/Given)";
											buttonName = "account.journal.entry.form.page.lable.to";
										}
									%>
									<c:set var="journalEntryDetailsList" value="<%=journalEntryDetailsList%>"/>
									<td>
									<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>FieldCounter" id="journalEntry<%=journalDetailsTypeName%>FieldCounter" value="<%=journalEntryDetailsList.size()%>">
									<table class="table table-bordered dt-responsive" id="journalEntry<%=journalDetailsTypeName%>Tbl">
										<thead>
											<tr>
												<td colspan="2">
													<button type="button" onclick="javascript:showAddJournalDetailFieldPopup('<%=journalEntryDetailsTypeId%>');" class="btn btn-primary"><spring:message  code="<%=buttonName%>"/></button>
												</td>
											</tr>
											<tr>
												<td width="60%" >
													<label class="control-label required"><%=tableHeadingTitle%></label>
												</td>	
												<td width="40%">
													<label class="control-label required">Amount</label>
												</td>					
											</tr>					
										</thead>
										<tbody>						
											<c:forEach items="${journalEntryDetailsList}" var="journalEntryDetails" varStatus="counter">
										 		<tr id="journalEntry<%=journalDetailsTypeName%>DetailsBOTR${counter.count}">
										 			<td colspan="2">
										 			<table>
										 				<tr>
												 			<td width="60%"><label class="control-label">${journalEntryDetails.accountLedgerSubTypeBO.ledgerTypeTitle}</label></td>
												 			<td align="right" width="40%">
												 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
												 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryDetails.amount}" />
												 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
												 				<input class="form-control" type="number" name="journalEntry<%=journalDetailsTypeName%>DetailsValue${counter.count}" id="journalEntry<%=journalDetailsTypeName%>DetailsValue${counter.count}" value="${journalEntryDetails.amount}" onblur="javascript:computeTotal(<%=journalEntryDetailsTypeId%>);computeChildAmountReference(${counter.count},<%=journalEntryDetailsTypeId%>);" required>
												 				<a href="javascript:deletePersistanceJournalEntryDetailBO(${counter.count},<%=journalEntryDetailsTypeId%>);">Delete</a>
												 				<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>Details${counter.count}" id="journalEntry<%=journalDetailsTypeName%>Details${counter.count}" value="${journalEntryDetails.journalEntryDetailsId}">
												 				<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>DetailsFieldLedgerId${counter.count}" id="journalEntry<%=journalDetailsTypeName%>DetailsFieldLedgerId${counter.count}" value="${journalEntryDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
												 				<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>DetailsStatus${counter.count}" id="journalEntry<%=journalDetailsTypeName%>DetailsStatus${counter.count}" value="update">
												 				<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>FieldChildCounter${counter.count}" id="journalEntry<%=journalDetailsTypeName%>FieldChildCounter${counter.count}" value="${fn:length(journalEntryDetails.childJournalEntryDetailsBOSet)}">
												 				<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>ChildParentCountIsEqual${counter.count}" id="journalEntry<%=journalDetailsTypeName%>ChildParentCountIsEqual${counter.count}" value="yes">
												 			<%} %>				
												 			</td> 	
												 		</tr>
												 		<!-- Add Child here -->
												 		<c:forEach items="${journalEntryDetails.childJournalEntryDetailsBOSet}" var="journalEntryChildDetails" varStatus="childCounter">
												 		<tr>
												 			<c:set var="refereneType" value="<%=AccountReferenceType.NEW_ACCOUNT_REFERENCE%>"></c:set>
												 			<c:set var="childReferenceAccountName" value="${journalEntryChildDetails.accountLedgerSubTypeBO.ledgerTypeTitle}"/>
												 			<c:if test="${journalEntryChildDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId  eq  journalEntryDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
												 				<c:set var="refereneType" value="<%=AccountReferenceType.ON_ACCOUNT_REFERENCE%>"></c:set>
												 				<c:set var="childReferenceAccountName" value="On Account"/>
												 			</c:if>
												 			<td width="60%"><label class="control-label">${childReferenceAccountName}</label></td>
												 			<td align="right" width="40%">
												 			<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>childReferenceType${counter.count}_${childCounter.count}" id="journalEntry<%=journalDetailsTypeName%>childReferenceType${counter.count}_${childCounter.count}" value="${refereneType}">
												 			<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>DetailsChild${counter.count}_${childCounter.count}" id="journalEntry<%=journalDetailsTypeName%>DetailsChild${counter.count}_${childCounter.count}" value="${journalEntryChildDetails.journalEntryDetailsId}">
												 			<input type="number" name="journalEntry<%=journalDetailsTypeName%>DetailsChildValue${counter.count}_${childCounter.count}" id="journalEntry<%=journalDetailsTypeName%>DetailsChildValue${counter.count}_${childCounter.count}" value="${journalEntryChildDetails.amount}" onblur="javascript:computeChildAmountReference(${counter.count},<%=journalEntryDetailsTypeId%>);" required>
												 			<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>DetailsChildFieldLedgerId${counter.count}_${childCounter.count}" id="journalEntry<%=journalDetailsTypeName%>DetailsChildFieldLedgerId${counter.count}_${childCounter.count}" value="${journalEntryChildDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
												 			<input type="hidden" name="journalEntry<%=journalDetailsTypeName%>DetailsChildStatus${counter.count}_${childCounter.count}" id="journalEntry<%=journalDetailsTypeName%>DetailsChildStatus${counter.count}_${childCounter.count}" value="update">
												 			</td>
												 		</tr>
												 		</c:forEach>
												 		<!-- Add Child here Ends-->
												 	</table>
												 	</td>		
										 		</tr>
									 		</c:forEach>
										</tbody>
									</table>
									</td>
									<%} //end of for %>
									</tr>
									<tr>
										<td>
											<table class="table table-bordered dt-responsive">
												<tfoot>
													<tr>
													<td width="60%" >
														<label class="control-label"><spring:message code="account.journal.entry.form.page.lable.total"/></label>
													</td>	
													<td width="40%" id="totalByFieldTD">
														${societyJournalEntryBO.amount}						
													</td>
													</tr>			
												</tfoot>				
											</table>
										</td>
										<td>
											<table class="table table-bordered dt-responsive">
												<tfoot>
													<tr>
														<td width="60%" >
															<label class="control-label"><spring:message code="account.journal.entry.form.page.lable.total"/></label>
														</td>	
														<td width="40%" id="totalToFieldTD">
															${societyJournalEntryBO.amount}							
														</td>					
													</tr>			
												</tfoot>				
											</table>
										</td>
									</tr>
									</table>			
								</div> <!-- End of Right Particular -->								
								
								
								<div class="form-group">
									<form:label cssClass="control-label" path="narration">
										<spring:message code="account.journal.entry.form.page.lable.narration"/>
									</form:label>
									<form:input cssClass="form-control" path="narration" htmlEscape="true"/>						
								</div>
						</div> <!--  end of box-body -->
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								<button type="button" onclick="saveJournalEntry();" class="btn btn-primary"><spring:message code="common.button.save"/></button>
								<button type="button" onclick="saveAndPrintJournalEntry();" class="btn btn-primary"><spring:message code="common.button.save.and.print"/></button>
							<%} %>
						</div>
    				</div>
    				</form:form>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->

<div class="modal fade" id="addJournalDetailFieldPopupForm" tabindex="-1" role="dialog" aria-labelledby="property details">
</div>
			
<!-- End Code for Footer -->
<script type="text/javascript">
	var journalEntityType = '<%=JournalEntityType.JOURNAL_ENTRY%>';
	//bindRestrictedDatePicker('journalEntryDate',minJqueryDateFmtStr,maxJqueryDateFmtStr);	
</script>
<script type="text/javascript" src="<%=jsRoot%>/account/journalEntryVoucherPage.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/account/journalEntryReceiptPage.js?${Server_Token_Value}" ></script>
</body>

<%if(request.getParameter("isSaveAndPrintSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
	<script>
		printJournalEntryReceipt();
	</script>
<% } %>

</html>
