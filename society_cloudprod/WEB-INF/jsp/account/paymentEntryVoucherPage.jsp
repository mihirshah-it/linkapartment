<%@page import="app.societywala.account.bo.PaymentEntryDetailsBO"%>
<%@page import="app.societywala.account.bo.SocietyPaymentEntryBO"%>
<%@page import="app.societywala.account.bo.JournalEntityType"%>
<%@page import="app.societywala.account.bo.JournalEntryDetailsType"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Payment Entry Details</TITLE>
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
String subMenu  = "pettyCash";

String formSubmitAction=ctxPath+"/account/saveReceiptEntryPage.htm";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);

SocietyPaymentEntryBO societyJournalEntryBO =(SocietyPaymentEntryBO)request.getAttribute("societyJournalEntryBO");
List<PaymentEntryDetailsBO> journalEntryByDetailsList = (List<PaymentEntryDetailsBO>)request.getAttribute("journalEntryByDetailsList");
List<PaymentEntryDetailsBO> journalEntryToDetailsList = (List<PaymentEntryDetailsBO>)request.getAttribute("journalEntryToDetailsList");
List<PaymentEntryDetailsBO> journalEntryByTaxDetailsList = (List<PaymentEntryDetailsBO>)request.getAttribute("journalEntryByTaxDetailsList");
List<PaymentEntryDetailsBO> journalEntryToTaxDetailsList = (List<PaymentEntryDetailsBO>)request.getAttribute("journalEntryToTaxDetailsList");

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
				<a  href="javascript:;"  onclick="javascript: addNewReceipt();"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;<spring:message code="expense.btn.add.pettycash"/></a>
			</li>
			<%} %>
			<li>
            	<a  href="javascript:;"  onclick="javascript:printExpenseReceipt();" id="print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
			<h1><spring:message code="expense.pettycash.form.label.header"/></h1>
			<%} else if (pageRenderMode.equals(CommonConstant.VIEW_MODE))  {%>
			<h1><spring:message code="expense.view.pettycash.form.label.header"/></h1>
			<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE))  {%>
			<h1><spring:message code="expense.edit.pettycash.form.label.header"/></h1>
			<%} %>
		  <hsCommonTag:breadCrumb pageTitle="Payment Entry Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="expenseReceiptForm" method="post">
						 <input type="hidden" id="voucherId" name="voucherId" value="<%=societyJournalEntryBO.getPaymentEntryId()%>">
					</form>
    				<div class="box box-primary">
	    				<form:form  cssClass="form" method="post" commandName="societyJournalEntryBO" id="societyJournalEntryBO">
						<form:hidden path="paymentEntryId"/>
						<form:hidden path="sequenceNumber"/>
						<form:hidden path="amount"/>
						<form:hidden path="journalAccountId"/>
						<input type="hidden" id="calculatedTotalAmount" name="calculatedTotalAmount" value="0"/>
						<input type="hidden" id="tdsRate" name="tdsRate" value="0"/>
						<input type="hidden" id="tdsExcemptionLimit" name="tdsExcemptionLimit" value="0"/>
						<form:hidden path="chequeAmount"/>
						<div class="box-header with-border">
							<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) == false) { %>
							<div class="form-group">
								<form:label cssClass="control-label" path="sequenceNumber">
									<spring:message code="expense.pettycash.form.label.paymentNumber"/>
								</form:label>
								<form:label cssClass="control-label" path="sequenceNumber">
									${societyJournalEntryBO.sequenceNumber}
								</form:label>								
							</div>
							<% } %>
						</div>
						<div class="box-body">
							<div>
								<div class="col-md-4 form-group" id="journalEntryToDetailsBOTR1">
									<input type="hidden" name="journalEntryToFieldCounter" id="journalEntryToFieldCounter" value="1"/>
									<label class="control-label required">
											<spring:message code="expense.pettycash.form.label.payment.from"/> (Cr.)
									</label>
									<c:choose>
									<c:when test="${! empty(journalEntryToDetailsList)}">
										<input type="text" class="form-control" name="journalEntryToDetailsName1" id="journalEntryToDetailsName1" value="${journalEntryToDetailsList[0].accountLedgerSubTypeBO.ledgerTypeTitle}" required>
										<input type="hidden" name="journalEntryToDetails1" id="journalEntryToDetails1" value="${journalEntryToDetailsList[0].paymentEntryDetailsId}" required>
										<input type="hidden" name="journalEntryToDetailsFieldLedgerId1" id="journalEntryToDetailsFieldLedgerId1" value="${journalEntryToDetailsList[0].accountLedgerSubTypeBO.accountLedgerSubTypeId}" required>
										<input type="hidden" name="journalEntryToDetailsStatus1" id="journalEntryToDetailsStatus1" value="update">
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control" name="journalEntryToDetailsName1" id="journalEntryToDetailsName1" value="" required>
										<input type="hidden" name="journalEntryToDetails1" id="journalEntryToDetails1" value="" required>
										<input type="hidden" name="journalEntryToDetailsFieldLedgerId1" id="journalEntryToDetailsFieldLedgerId1" value="" required>
										<input type="hidden" name="journalEntryToDetailsStatus1" id="journalEntryToDetailsStatus1" value="new">
									</c:otherwise>
									</c:choose>
								</div>								
								<div class="col-md-4 form-group">
									<form:label cssClass="control-label required" path="paymentEntryDate">
										<spring:message code="expense.pettycash.form.label.voucherDate"/>
									</form:label>
									<div class="input-group date">
					                  <div class="input-group-addon">
					                    <i class="fa fa-calendar"></i>
					                  </div>
					                  <form:input cssClass="form-control pull-right datepicker" path="paymentEntryDate" dateFormat="dateFormat" required="required"/>
				                  	</div>
			                  	</div>	
			                  	<div class="col-md-4 form-group">
			                  		<form:label cssClass="control-label" path="chequeDDNumber">
											<spring:message code="collection.receipt.form.label.Cheque.or.DD.Number"></spring:message> 
									</form:label>
									<form:input cssClass="form-control" path="chequeDDNumber" htmlEscape="true"/>
			                  	</div>	
			                  				                  									
							</div>
							
							
							<div class="form-group">
								<input type="hidden" name="journalEntryByFieldCounter" id="journalEntryByFieldCounter" value="<%=journalEntryByDetailsList.size()%>"/>	
								<table id="journalEntryByTbl" class="table table-bordered table-striped table-hover dt-responsive">
									<thead>
										<tr>
											<td width="40%" >
												<label class="control-label required"><spring:message code="expense.pettycash.form.label.payment.to"/> (Dr.)</label>
											</td>	
											<td width="30%">
												<label class="control-label required"><spring:message code="account.journal.entry.form.page.lable.rupees"/></label>
											</td>
											<td width="30%">												
											</td>				
										</tr>					
									</thead>
									<tbody>
										<c:forEach items="${journalEntryByDetailsList}" var="journalEntryByDetails" varStatus="counter">
									 		<tr id="journalEntryByDetailsBOTR${counter.count}">
									 			<td>
									 				<input type="text" class="form-control" name="journalEntryByDetailsName${counter.count}" id="journalEntryByDetailsName${counter.count}" value="${journalEntryByDetails.accountLedgerSubTypeBO.ledgerTypeTitle}" >
									 				<input type="hidden" name="journalEntryByDetails${counter.count}" id="journalEntryByDetails${counter.count}" value="${journalEntryByDetails.paymentEntryDetailsId}">
									 				<input type="hidden" name="journalEntryByDetailsFieldLedgerId${counter.count}" id="journalEntryByDetailsFieldLedgerId${counter.count}" value="${journalEntryByDetails.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
									 				<input type="hidden" name="journalEntryByDetailsStatus${counter.count}" id="journalEntryByDetailsStatus${counter.count}" value="update">
									 			</td>
									 			<td>
									 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
									 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryByDetails.amount}" />
									 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
									 				<input type="number" class="form-control" name="journalEntryByDetailsValue${counter.count}" id="journalEntryByDetailsValue${counter.count}" value="${journalEntryByDetails.amount}" onblur="javascript:computeTotal(<%=JournalEntryDetailsType.BY%>);" required>
									 			<%} %>
									 			</td>
									 			<td>
									 				<a href="javascript:deletePersistanceJournalEntryDetailBO(${counter.count},<%=JournalEntryDetailsType.BY%>);">Delete</a>
									 			</td> 			
									 		</tr>
								 		</c:forEach>						
									</tbody>
									<tfoot>
										<tr>
											<td>
												<a href="javascript:;" onclick="javascript:addAccountField('<%=JournalEntryDetailsType.BY%>');">Add</a>
											</td>
											<td>
												Total
											</td>
											<td>
												<label id="ByTotal">0</label>
											</td>
										</tr>
									</tfoot>
								</table>	
							</div> <!-- End of Particular -->
							
							<!--  Start of Duty Tax  -->
							
							<div class="form-group">
								<input type="hidden" name="journalEntryByTaxFieldCounter" id="journalEntryByTaxFieldCounter" value="<%=journalEntryByTaxDetailsList.size()%>"/>	
								<table id="journalEntryByTaxTbl" class="table table-bordered table-striped table-hover dt-responsive">
									<thead>
										<tr>
											<td width="40%" >
												<label class="control-label required">Duty/Tax (Dr.)</label>
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
									 				<input type="hidden" name="journalEntryByTaxDetails${counter.count}" id="journalEntryByTaxDetails${counter.count}" value="${journalEntryTaxDetails.paymentEntryDetailsId}">
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
							</div> <!-- End of Duty Tax -->
							
							<!--  Start of Duty Tax To  -->
							<div class="form-group">
								<input type="hidden" name="journalEntryToTaxFieldCounter" id="journalEntryToTaxFieldCounter" value="<%=journalEntryToTaxDetailsList.size()%>"/>
								<table id="journalEntryToTaxTbl" class="table table-bordered table-striped table-hover dt-responsive">
									<thead>
										<tr>
											<td width="40%" >
												<label class="control-label required">Tds/Rebate (Cr.)</label>
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
									 				<input type="hidden" name="journalEntryToTaxDetails${counter.count}" id="journalEntryToTaxDetails${counter.count}" value="${journalEntryTaxDetails.paymentEntryDetailsId}">
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
											<input class="form-control" id="totalByFieldTD" readonly="readonly" value="${societyJournalEntryBO.amount}">
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
	var journalEntityType = '<%=JournalEntityType.PEETY_CASH_EXPENCE_VOUHER%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/account/paymentEntryVoucherPage.js?${Server_Token_Value}" ></script>
<script type="text/javascript" src="<%=jsRoot%>/account/expenseReceiptPage.js?${Server_Token_Value}"></script>
</body>

<%if(request.getParameter("isSaveAndPrintSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
	<script>
		printExpenseReceipt();
	</script>
<% } %>

</html>
