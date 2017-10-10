<%@page import="app.societywala.account.bo.ReceiptEntryDetailsBO"%>
<%@page import="app.societywala.account.bo.SocietyReceiptEntryBO"%>
<%@page import="app.societywala.account.bo.JournalEntityType"%>
<%@page import="app.societywala.account.bo.JournalEntryDetailsType"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Receipt Entry Details</TITLE>
	<!-- Page Specific Java Script Variables  -->
	<script>
	var journalDetailsTypeBY = '<%=JournalEntryDetailsType.BY%>';
	var journalDetailsTypeTO = '<%=JournalEntryDetailsType.TO%>';
	var journalDetailsTypeTaxBY = '<%=JournalEntryDetailsType.BY_DUTIES_TAX_TDS%>';
	var journalDetailsTypeTaxTO = '<%=JournalEntryDetailsType.TO_DUTIES_TAX_TDS%>';
	</script>
</HEAD>

<%
String mainMenu = "manageAccount";
String subMenu  = "receipts";

String formSubmitAction=ctxPath+"/account/saveReceiptEntryPage.htm";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);

SocietyReceiptEntryBO societyJournalEntryBO =(SocietyReceiptEntryBO)request.getAttribute("societyJournalEntryBO");
List<ReceiptEntryDetailsBO> journalEntryByDetailsList = (List<ReceiptEntryDetailsBO>)request.getAttribute("journalEntryByDetailsList");
List<ReceiptEntryDetailsBO> journalEntryToDetailsList = (List<ReceiptEntryDetailsBO>)request.getAttribute("journalEntryToDetailsList");
List<ReceiptEntryDetailsBO> journalEntryByTaxDetailsList = (List<ReceiptEntryDetailsBO>)request.getAttribute("journalEntryByTaxDetailsList");
List<ReceiptEntryDetailsBO> journalEntryToTaxDetailsList = (List<ReceiptEntryDetailsBO>)request.getAttribute("journalEntryToTaxDetailsList");


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
				<a  href="javascript:;"  onclick="javascript: createNewReceipt();"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;<spring:message code="collection.btn.create.receipt"/></a>
			</li>
			<%} %>
			<li>
            	<a  href="javascript:;"  onclick="javascript:printIncomeReceipt();" id="print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="collection.receipt.form.label.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Receipt Entry Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form id="incomeReceiptForm" method="post">
						 <input type="hidden" id="voucherId" name="voucherId" value="<%=societyJournalEntryBO.getReceiptEntryId()%>">
						</form>
						<form:form  cssClass="form" method="post" commandName="societyJournalEntryBO" id="societyJournalEntryBO">
						<form:hidden path="receiptEntryId"/>
						<form:hidden path="sequenceNumber"/>
						<form:hidden path="amount"/>
						<form:hidden path="journalAccountId"/>
						<input type="hidden" id="calculatedTotalAmount" name="calculatedTotalAmount" value="0"/>
						<form:hidden path="chequeAmount"/>
						<input type="hidden" name="journalEntryToFieldCounter" id="journalEntryToFieldCounter" value="<%=journalEntryToDetailsList.size()%>"/>
						<div class="box-header with-border">
							<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) == false) { %>
							<div class="form-group">
								<form:label cssClass="control-label" path="sequenceNumber">
									<spring:message code="collection.receipt.form.label.receiptNumber"/>
								</form:label>
								<form:label cssClass="control-label" path="sequenceNumber">
									${societyJournalEntryBO.sequenceNumber}
								</form:label>								
							</div>
							<% } %>
						</div>
						<div class="box-body">						
							<div class="form-group col-md-4">
								<form:label cssClass="control-label required" path="receiptEntryDate">
									<spring:message code="collection.receipt.form.label.incomeReceiptDate"/>
								</form:label>
								 <div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="receiptEntryDate" dateFormat="dateFormat" required="required"/>
			                  	</div>				
							</div>
							
							<div class="form-group col-md-4">
								<form:label cssClass="control-label" path="chequeDDNumber">
									<spring:message code="collection.receipt.form.label.Cheque.or.DD.Number"></spring:message> 
								</form:label>
								<form:input cssClass="form-control" path="chequeDDNumber" htmlEscape="true"/>
							</div>
							
							<div class="form-group col-md-4" id="journalEntryByDetailsBOTR1">
								<input type="hidden" name="journalEntryByFieldCounter" id="journalEntryByFieldCounter" value="1"/>
								<label class="control-label required">
										<spring:message code="collection.receipt.form.label.payment.from"></spring:message> (Dr.)
								</label>
								<c:choose>
								<c:when test="${! empty(journalEntryByDetailsList)}">
									<input type="text" class="form-control" name="journalEntryByDetailsName1" id="journalEntryByDetailsName1" value="${journalEntryByDetailsList[0].accountLedgerSubTypeBO.ledgerTypeTitle}" required>
									<input type="hidden" name="journalEntryByDetails1" id="journalEntryByDetails1" value="${journalEntryByDetailsList[0].receiptEntryDetailsId}">
									<input type="hidden" name="journalEntryByDetailsFieldLedgerId1" id="journalEntryByDetailsFieldLedgerId1" value="${journalEntryByDetailsList[0].accountLedgerSubTypeBO.accountLedgerSubTypeId}">
									<input type="hidden" name="journalEntryByDetailsStatus1" id="journalEntryByDetailsStatus1" value="update">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" name="journalEntryByDetailsName1" id="journalEntryByDetailsName1" value="" required>
									<input type="hidden" name="journalEntryByDetailsId1" id="journalEntryByDetailsId1" value="">
									<input type="hidden" name="journalEntryByDetailsFieldLedgerId1" id="journalEntryByDetailsFieldLedgerId1" value="">
									<input type="hidden" name="journalEntryByDetailsStatus1" id="journalEntryByDetailsStatus1" value="new">
								</c:otherwise>
								</c:choose>
							</div>
							
							<div class="form-group">
								<input type="hidden" name="journalEntryToFieldCounter" id="journalEntryToFieldCounter" value="<%=journalEntryToDetailsList.size()%>"/>
								<table id="journalEntryToTbl" class="table table-bordered table-striped table-hover dt-responsive">
								<thead>
									<tr>
										<td width="40%">
											<label class="control-label required">To (Cr.)</label>
										</td>	
										<td width="30%">
											<label class="control-label required"><spring:message code="account.journal.entry.form.page.lable.rupees"/></label>
										</td>
										<td width="30%">											
										</td>				
									</tr>
								</thead>
								<tbody>						
									<c:forEach items="${journalEntryToDetailsList}" var="journalEntryToDetails" varStatus="counter">
								 		<tr id="journalEntryToDetailsBOTR${counter.count}">
								 			<td>
								 				<input type="text" class="form-control" name="journalEntryToDetailsName${counter.count}" id="journalEntryToDetailsName${counter.count}" value="${journalEntryToDetails.accountLedgerSubTypeBO.ledgerTypeTitle}" required>
								 				<input type="hidden" name="journalEntryToDetails${counter.count}" id="journalEntryToDetails${counter.count}" value="${journalEntryToDetails.receiptEntryDetailsId}">
								 				<input type="hidden" name="journalEntryToDetailsFieldLedgerId${counter.count}" id="journalEntryToDetailsFieldLedgerId${counter.count}" value="${journalEntryToDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
								 				<input type="hidden" name="journalEntryToDetailsStatus${counter.count}" id="journalEntryToDetailsStatus${counter.count}" value="update">
								 			</td>
								 			<td align="right">
								 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
								 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryToDetails.amount}" />
								 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								 				<input type="number" class="form-control" name="journalEntryToDetailsValue${counter.count}" id="journalEntryToDetailsValue${counter.count}" value="${journalEntryToDetails.amount}" onblur="javascript:computeTotal(<%=JournalEntryDetailsType.TO%>);" required>
								 			<%} %>
								 			</td>
								 			<td>
								 				<a href="javascript:deletePersistanceJournalEntryDetailBO(${counter.count},<%=JournalEntryDetailsType.TO%>);">Delete</a>
								 			</td> 			
								 		</tr>
							 		</c:forEach>				 		
								</tbody>
								<tfoot>
									<tr>
										<td>
											<a href="javascript:;" onclick="javascript:addAccountField('<%=JournalEntryDetailsType.TO%>');">Add</a>
										</td>
										<td>
											<label class="control-label">
												<spring:message code="account.journal.entry.form.page.lable.total"/>
											</label>
										</td>
										<td>
											<label class="control-label" id="ToTotal">
												${societyJournalEntryBO.amount}	
											</label>
										</td>
									</tr>									
								</tfoot>
							</table>
							</div>
							
							<!--  Start of Duty Tax  -->
							
							<div class="form-group">
								<input type="hidden" name="journalEntryToTaxFieldCounter" id="journalEntryToTaxFieldCounter" value="<%=journalEntryToTaxDetailsList.size()%>"/>	
								<table id="journalEntryToTaxTbl" class="table table-bordered table-striped table-hover dt-responsive">
									<thead>
										<tr>
											<td width="40%" >
												<label class="control-label required">Duty/Tax (Cr.)</label>
											</td>	
											<td width="30%">
												<label class="control-label required"><spring:message code="account.journal.entry.form.page.lable.rupees"/></label>
											</td>
											<td width="30%">												
											</td>				
										</tr>					
									</thead>
									<tbody>
										<c:forEach items="${journalEntryToTaxDetailsList}" var="journalEntryTaxDetails" varStatus="counter">
									 		<tr id="journalEntryToTaxDetailsBOTR${counter.count}">
									 			<td>
									 				<input type="text" class="form-control" name="journalEntryToTaxDetailsName${counter.count}" id="journalEntryToTaxDetailsName${counter.count}" value="${journalEntryTaxDetails.accountLedgerSubTypeBO.ledgerTypeTitle}" >
									 				<input type="hidden" name="journalEntryToTaxDetails${counter.count}" id="journalEntryToTaxDetails${counter.count}" value="${journalEntryTaxDetails.receiptEntryDetailsId}">
									 				<input type="hidden" name="journalEntryToTaxDetailsFieldLedgerId${counter.count}" id="journalEntryToTaxDetailsFieldLedgerId${counter.count}" value="${journalEntryTaxDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
									 				<input type="hidden" name="journalEntryToTaxDetailsStatus${counter.count}" id="journalEntryToTaxDetailsStatus${counter.count}" value="update">
									 			</td>
									 			<td>
									 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
									 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryTaxDetails.amount}" />
									 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
									 				<input type="number" class="form-control" name="journalEntryToTaxDetailsValue${counter.count}" id="journalEntryToTaxDetailsValue${counter.count}" value="${journalEntryTaxDetails.amount}" onblur="javascript:computeTotal(<%=JournalEntryDetailsType.TO_DUTIES_TAX_TDS%>);" required>
									 			<%} %>
									 			</td>
									 			<td>
									 				<a href="javascript:deletePersistanceJournalEntryDetailBO(${counter.count},<%=JournalEntryDetailsType.TO_DUTIES_TAX_TDS%>);">Delete</a>
									 			</td> 			
									 		</tr>
								 		</c:forEach>						
									</tbody>
									<tfoot>
										<tr>
											<td>
												<a href="javascript:;" onclick="javascript:addAccountField('<%=JournalEntryDetailsType.TO_DUTIES_TAX_TDS%>');">Add</a>
											</td>
											<td>
												Total
											</td>
											<td>
												<label id="ToTaxTotal">0</label>
											</td>
										</tr>
									</tfoot>
								</table>	
							</div> <!-- End of Duty Tax -->
							
							<!--  Start of Duty Tax To  -->
							<div class="form-group">
								<input type="hidden" name="journalEntryByTaxFieldCounter" id="journalEntryByTaxFieldCounter" value="<%=journalEntryByTaxDetailsList.size()%>"/>
								<table id="journalEntryByTaxTbl" class="table table-bordered table-striped table-hover dt-responsive">
									<thead>
										<tr>
											<td width="40%" >
												<label class="control-label required">Tds/Rebate/Loan (Dr.)</label>
											</td>	
											<td width="30%">
												<label class="control-label required"><spring:message code="account.journal.entry.form.page.lable.rupees"/></label>
											</td>
											<td width="30%">												
											</td>				
										</tr>					
									</thead>
									<tbody>
										<c:forEach items="${journalEntryByTaxDetailsList}" var="journalEntryTaxDetails" varStatus="counter">
									 		<tr id="journalEntryByTaxDetailsBOTR${counter.count}">
									 			<td>
									 				<input type="text" class="form-control" name="journalEntryByTaxDetailsName${counter.count}" id="journalEntryByTaxDetailsName${counter.count}" value="${journalEntryTaxDetails.accountLedgerSubTypeBO.ledgerTypeTitle}" >
									 				<input type="hidden" name="journalEntryByTaxDetails${counter.count}" id="journalEntryByTaxDetails${counter.count}" value="${journalEntryTaxDetails.receiptEntryDetailsId}">
									 				<input type="hidden" name="journalEntryByTaxDetailsFieldLedgerId${counter.count}" id="journalEntryByTaxDetailsFieldLedgerId${counter.count}" value="${journalEntryTaxDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
									 				<input type="hidden" name="journalEntryByTaxDetailsStatus${counter.count}" id="journalEntryByTaxDetailsStatus${counter.count}" value="update">
									 			</td>
									 			<td>
									 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
									 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryTaxDetails.amount}" />
									 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
									 				<input type="number" class="form-control" name="journalEntryByTaxDetailsValue${counter.count}" id="journalEntryByTaxDetailsValue${counter.count}" value="${journalEntryTaxDetails.amount}" onblur="javascript:computeTotal(<%=JournalEntryDetailsType.BY_DUTIES_TAX_TDS%>);" required>
									 			<%} %>
									 			</td>
									 			<td>
									 				<a href="javascript:deletePersistanceJournalEntryDetailBO(${counter.count},<%=JournalEntryDetailsType.BY_DUTIES_TAX_TDS%>);">Delete</a>
									 			</td> 			
									 		</tr>
								 		</c:forEach>						
									</tbody>
									<tfoot>
										<tr>
											<td>
												<a href="javascript:;" onclick="javascript:addAccountField('<%=JournalEntryDetailsType.BY_DUTIES_TAX_TDS%>');">Add</a>
											</td>
											<td>
												Total
											</td>
											<td>
												<label id="ByTaxTotal">0</label>
											</td>
										</tr>
									</tfoot>
								</table>	
							</div> <!-- End of Duty Tax To -->
							
							<div class="form-group">
								<form:label cssClass="control-label" path="narration">
									<spring:message code="account.journal.entry.form.page.lable.narration"/>
								</form:label>
								<form:input cssClass="form-control" path="narration" htmlEscape="true"/>						
							</div>
							
							<div class="form-group">
								<table class="table table-bordered table-striped table-hover dt-responsive">
									<tr>
										<td width="50%" >
											<label class="control-label"><spring:message code="account.journal.entry.form.page.lable.total"/></label>
											<input class="form-control" id="totalToFieldTD" readonly="readonly" value="${societyJournalEntryBO.amount}">
										</td>											
										<td width="50%" >
											<label class="control-label">Total Cheque Amount</label>
											<input class="form-control" id="totalChequeAmountFieldTD" readonly="readonly" value="${societyJournalEntryBO.chequeAmount}">
										</td>				
									</tr>	
								</table>
							</div>  <!-- End of Particular -->
							
						</div>
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
							<button type="submit" class="btn btn-primary" onclick="saveJournalEntry();" ><spring:message code="common.button.save"/></button>
							<button type="submit" class="btn btn-primary" onclick="saveAndPrintJournalEntry();" ><spring:message code="common.button.save.and.print"/></button>
							<%} %>
						</div>
						</form:form>
    				</div>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->

<Script type="text/javascript">
	var journalEntityType = '<%=JournalEntityType.INCOME_RECEIPT_VOUHER%>';
	bindRestrictedDatePicker('receiptEntryDate',minJqueryDateFmtStr,maxJqueryDateFmtStr);
</script>
<script type="text/javascript" src="<%=jsRoot%>/account/receiptEntryVoucherPage.js?${Server_Token_Value}" ></script>
<script type="text/javascript" src="<%=jsRoot%>/account/incomeReceiptPage.js?${Server_Token_Value}"></script>
</body>

<%if(request.getParameter("isSaveAndPrintSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
	<script>
		printIncomeReceipt();
	</script>
<% } %>
</html>
