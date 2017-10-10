<%@page import="app.societywala.account.bo.SocietyContraEntryBO"%>
<%@page import="app.societywala.account.bo.ContraEntryDetailsBO"%>
<%@page import="app.societywala.account.bo.JournalEntityType"%>
<%@page import="app.societywala.account.bo.JournalEntryDetailsType"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Contra Entry Details</TITLE>
	<script>
	var journalDetailsTypeBY = '<%=JournalEntryDetailsType.BY%>';
	var journalDetailsTypeTO = '<%=JournalEntryDetailsType.TO%>';
	</script>
</HEAD>

<%
String mainMenu = "manageAccount";
String subMenu  = "contraReceipt";

String formSubmitAction=ctxPath+"/account/saveReceiptEntryPage.htm";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);

SocietyContraEntryBO societyJournalEntryBO =(SocietyContraEntryBO)request.getAttribute("societyJournalEntryBO");
List<ContraEntryDetailsBO> journalEntryByDetailsList = (List<ContraEntryDetailsBO>)request.getAttribute("journalEntryByDetailsList");
List<ContraEntryDetailsBO> journalEntryToDetailsList = (List<ContraEntryDetailsBO>)request.getAttribute("journalEntryToDetailsList");

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
				<a  href="javascript:;"  onclick="javascript: addNewReceipt();"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;<spring:message code="account.btn.add.contra"/></a>
			</li>
			<%} %>
			<li>
            	<a  href="javascript:;"  onclick="javascript:printContraReceipt();" id="print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>
                        
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		 <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
			<h1><spring:message code="account.contra.form.label.header"/></h1>			
		<%} else if (pageRenderMode.equals(CommonConstant.VIEW_MODE))  {%>
			<h1><spring:message code="account.view.contra.form.label.header"/></h1>			
		<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE))  {%>
			<h1><spring:message code="account.edit.contra.form.label.header"/></h1>			
		<%} %>
		  <hsCommonTag:breadCrumb pageTitle="Contra Entry Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form id="contraReceiptForm" method="post">
							 <input type="hidden" id="voucherId" name="voucherId" value="<%=societyJournalEntryBO.getContraEntryId()%>">
						</form>
						<form:form  cssClass="form" method="post" commandName="societyJournalEntryBO" id="societyJournalEntryBO">
						<form:hidden path="contraEntryId"/>
						<form:hidden path="sequenceNumber"/>
						<form:hidden path="amount"/>
						<div class="box-header with-border">
						<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) == false) { %>
						<div class="form-group">
							<form:label cssClass="control-label" path="sequenceNumber">
								<spring:message code="account.contra.form.label.contra.no"/>
							</form:label>
							<form:label cssClass="control-label" path="sequenceNumber">
								${societyJournalEntryBO.sequenceNumber}
							</form:label>				
						</div>
						<% } %>
						</div>
						<div class="box-body">
						<div class="form-group" id="journalEntryByDetailsBOTR1">
							<label class="control-label required">
									By Account (Dr.)
							</label>
							<c:choose>
							<c:when test="${! empty(journalEntryByDetailsList)}">
								<input type="text" class="form-control" name="journalEntryByDetailsName1" id="journalEntryByDetailsName1" value="${journalEntryByDetailsList[0].accountLedgerSubTypeBO.ledgerTypeTitle}" required>
								<input type="hidden" name="journalEntryByDetails1" id="journalEntryByDetails1" value="${journalEntryByDetailsList[0].contraEntryDetailsId}">
								<input type="hidden" name="journalEntryByDetailsFieldLedgerId1" id="journalEntryByDetailsFieldLedgerId1" value="${journalEntryByDetailsList[0].accountLedgerSubTypeBO.accountLedgerSubTypeId}">
								<input type="hidden" name="journalEntryByDetailsStatus1" id="journalEntryByDetailsStatus1" value="update">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" name="journalEntryByDetailsName1" id="journalEntryByDetailsName1" value="" required>
								<input type="hidden" name="journalEntryByDetails1" id="journalEntryByDetails1" value="">
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
										<td width="50%" >
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
								 				<input type="hidden" name="journalEntryToDetails${counter.count}" id="journalEntryToDetails${counter.count}" value="${journalEntryToDetails.contraEntryDetailsId}">
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
										<td colspan="3">
											<a href="javascript:;" onclick="javascript:addAccountToField();">Add</a>
										</td>
									</tr>
								</tfoot>
							</table>							
						</div> <!-- End of Particular -->
						<div class="form-group">
							<table class="table table-bordered table-striped table-hover dt-responsive">
								<tr>
									<td width="60%" >
										<label class="control-label"><spring:message code="account.journal.entry.form.page.lable.total"/></label>
									</td>	
									<td width="40%" id="totalToFieldTD">
										<label class="control-label">${societyJournalEntryBO.amount}</label>							
									</td>					
								</tr>	
							</table>
						</div>  <!-- End of Particular -->
						<div class="form-group">
							<form:label cssClass="control-label" path="chequeDDNumber">
								<spring:message code="label.Cheque.or.DD.Number"></spring:message> 
							</form:label>
							<form:input cssClass="form-control" path="chequeDDNumber" htmlEscape="true"/>						
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label" path="narration">
								<spring:message code="account.journal.entry.form.page.lable.narration"/>
							</form:label>
							<form:input cssClass="form-control" path="narration" htmlEscape="true"/>						
						</div>
						
						<div class="form-group">
								<form:label cssClass="control-label required" path="contraEntryDate">
									<spring:message code="account.contra.form.label.contraDate"/>
								</form:label>
								<div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="contraEntryDate" dateFormat="dateFormat" required="required"/>
			                  	</div>												
						</div>
						</div> <!-- End of box body -->
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
	var journalEntityType = '<%=JournalEntityType.CONTRA_VOUCHER%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/account/contraEntryVoucherPage.js?${Server_Token_Value}" ></script>
<script type="text/javascript" src="<%=jsRoot%>/account/contraReceiptPage.js?${Server_Token_Value}"></script>
</body>

<%if(request.getParameter("isSaveAndPrintSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
	<script>
		printContraReceipt();
	</script>
<% } %>

</html>
