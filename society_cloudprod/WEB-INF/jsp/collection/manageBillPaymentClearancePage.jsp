<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.bill.bo.ClearanceStatus"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Manage Reconciliation</TITLE>
</HEAD>

<%
String mainMenu = "manageAccount";
String subMenu  = "chequeReturn";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
String pageFor = (String)request.getAttribute("PAGE_FOR");
if(pageFor.equals("BANK_RECO")) 
{
	subMenu = "billClearance";
}
List<AccountLedgerSubTypeBO> soceityAssetsBankBOList = (List<AccountLedgerSubTypeBO>)request.getAttribute("soceityAssetsBankBOList");
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
    <section class="content-header">
		<%
		if(pageFor.equals("BANK_RECO")) {
		%>
			<h1><spring:message code="society.property.bill.payment.clearance.form.header"/></h1>
		  	<hsCommonTag:breadCrumb pageTitle="Reconciliation Page" isFirstIndex="true"/>
		 <%} else if (pageFor.equals("CHEQUE_RETURN"))  {
		  %>
			<h1>Cheque Return Details Page</h1>
			<hsCommonTag:breadCrumb pageTitle="Cheque Return Page" isFirstIndex="true"/>
		 <%}%>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
						<div class="box-header with-border">
							<form role="form" id="transactionClearanceStatusForm" name="transactionClearanceStatusForm">
								<div class="form-group">
									<div class="col-md-3">       
						        		<label class="control-label required">Bank Name</label>
						        		<select id="bankSubTypeId" name="bankSubTypeId" class="form-control">
						        			<c:forEach items="${soceityAssetsBankBOList}" var="societyAssetsBankBO">
						        			<option value="${societyAssetsBankBO.accountLedgerSubTypeId}">${societyAssetsBankBO.ledgerTypeTitle}</option>
						        			</c:forEach>
						        		</select>
						        	</div>
						        	<div class="col-md-3">
										<label class="control-label required">
											From Date
										</label>								
										<div class="input-group date">
							              <div class="input-group-addon">
							                <i class="fa fa-calendar"></i>
							              </div>
							              <input class="form-control pull-right datepicker" id="fromDate" name="fromDate" value="<%=minJqueryDateFmtStr%>"/>
						                </div>
									</div>
									<div class="col-md-3">
										<label class="control-label required">
											To Date
										</label>								
										<div class="input-group date">
							              <div class="input-group-addon">
							                <i class="fa fa-calendar"></i>
							              </div>
							              <input class="form-control pull-right datepicker" id="toDate" name="toDate" value="<%=maxJqueryDateFmtStr%>"/>
						                </div>
									</div>
									<div class="col-md-3">
										<button type="button" class="col-md-3 btn btn-primary margin" onclick="javascript:showBillClearanceGrid();">Filter</button>
									</div>
								</div>
								</div>
								<div class="box-header with-border">
								<div class="form-group">
								<div class="col-md-4">       
						        <label class="control-label required"><spring:message code="common.label.show"/></label>
						        
								<select class="form-control" name="billCleranceViewType" id="billCleranceViewType" onchange="javascript:showBillClearanceGrid()" required>
								  <option value="<%=ClearanceStatus.CLEARANCE_AWAITING_FOR_CLEARANCE%>">All Not Cleared Cheque</option>
								  <option value="<%=ClearanceStatus.CLEARANCE_OK%>">All Cleared Cheque</option>
								  <option value="<%=ClearanceStatus.CLEARANCE_BOUNCE%>">All Bounce Cheque</option>
								  <option value="<%=ClearanceStatus.ALL_STATUS%>">All Transaction</option>
								</select>
								</div>
								<%
								if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {
					     		%>
					     		<input type="hidden" id="journalAccountId" name="journalAccountId"/>
								<input type="hidden" id="clearanceStatusId" name="clearanceStatusId"/>						        
								<div class="col-md-4">
								<label class="control-label required">
									Date
								</label>								
								<div class="input-group date">
					              <div class="input-group-addon">
					                <i class="fa fa-calendar"></i>
					              </div>
					              <input class="form-control pull-right datepicker" id="clearanceDate" name="clearanceDate"/>
				                </div>
								</div>
								<div class="col-md-4">
								<%if(pageFor.equals("BANK_RECO")) {%>
								<button type="submit" class="btn btn-primary">Reconciliation</button>
								<%} else if(pageFor.equals("CHEQUE_RETURN")) {%>
								<!-- 			<div> -->
								<!-- 			<label class="label"> -->
								<!-- 				Penalty Amount -->
								<!-- 			</label> -->
								<!-- 			<input type="text" id="penaltyAmount" name="penaltyAmount"/> -->
								<!-- 			</div> -->
								<button type="submit" class="btn btn-primary">Return</button>
								<%
								 } // end of if(pageFor.equals)
								}
								%>
								</div>
								</div> <!--  end of form-group -->
						</form>
						</div> <!--  End of header -->
						<div class="box-body">
							<table id="societyBillClearanceGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
						</div>
						<div class="box-footer">
						</div>
    				</div>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->


<!-- Popup Start -->
<!-- <div id="bouncePenaltyChargesPopup" name="bouncePenaltyChargesPopup" class="popup_block">
</div> -->
<!-- Popup Start -->

<!-- Popup Start -->
<!-- <div id="transactionClearanceStatusPopup" name="transactionClearanceStatusPopup" class="popup_block">
	<div class="popUpTitle">Transaction Clearance/Bounce Details</div>
	<div class="infoDiv">Provide clearance/Bounce date</div>
	<form id="transactionClearanceStatusForm" name="transactionClearanceStatusForm" class="form" style="width: 100%;">
		<input type="hidden" id="journalAccountId" name="journalAccountId"/>
		<input type="hidden" id="clearanceStatusId" name="clearanceStatusId"/>
		<div style="width:60%;">
			<div class="inputHolder">
			  	<label class="label">Date</label>
			  	<input class="datepicker" type="text" id="clearanceDate" name="clearanceDate"/>
		  	</div>
		 </div>
		 <div class="form buttonPanel">
			<input type="button" class="primary" onclick="javascript:updateTransactionClearanceStatus();" value="Save">										
		</div> 
	</form>
</div> -->
<!-- Popup Start -->

<!-- JS Files -->  
<script>
var jpageRenderMode = '<%=pageRenderMode%>';
var jsClearanceOk = '<%=ClearanceStatus.CLEARANCE_OK%>';
var jsClearanceBounce = '<%=ClearanceStatus.CLEARANCE_BOUNCE%>';
var jsClearanceAwaiting = '<%=ClearanceStatus.CLEARANCE_AWAITING_FOR_CLEARANCE%>';
<%if(pageFor.equals("BANK_RECO")) {%>
	var jsPaymentStatus = '<%=ClearanceStatus.CLEARANCE_OK%>';	
<%} else if(pageFor.equals("CHEQUE_RETURN")) {%>
	var jsPaymentStatus = '<%=ClearanceStatus.CLEARANCE_BOUNCE%>';	
<%}%>
//bindRestrictedDatePicker('clearanceDate',minJqueryDateFmtStr,maxJqueryDateFmtStr);
</script>
<script type="text/javascript" src="<%=jsRoot%>/collection/manageBillPaymentClearancePage.js?${Server_Token_Value}"></script>
<script>
<%if(pageFor.equals("BANK_RECO")) {%>
	bindUpdateTransactionClearanceStatus('<%=ClearanceStatus.CLEARANCE_OK%>');
<%} else if(pageFor.equals("CHEQUE_RETURN")) {%>
	bindUpdateChequeReturnDetails();
<%}%>
</script>
</body>
</html>