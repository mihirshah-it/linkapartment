<%@page import="java.util.Map"%>
<%@page import="app.societywala.account.bo.AccountDimentionType"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@page import="app.societywala.reports.bo.ReportConstant" %>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Ledger Report</TITLE>
   <!-- CSS Files -->
   <link rel="stylesheet" type="text/css" href="<%=pluginPath%>/multiselect/css/bootstrap-multiselect.css?${Server_Token_Value}" />
</HEAD>
<%
String mainMenu = "manageReports";
String subMenu  = "ledgerReports";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
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
			<li>
            	<a  href="javascript:;"  onclick="javascript:printSelectedLedger();"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="report.view.ledgerreport.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Ledger Report" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
						<div class="box-header with-border">
						<form name="societLedgerForm" id="societLedgerForm" method="post">
							<input type="hidden" name="accountSubTypeId" id="accountSubTypeId">
							<div class="form-group col-md-4">
							<label class="control-label"><spring:message code="common.label.financial.year"/></label>
							<select class="form-control" id="fiscalYear" name="fiscalYear">
					   			<c:forEach items="${ficalYearList}" var="ficalYear">
					   				<option value="${ficalYear}"><%=CommonUtilImpl.getDisplayFormatFiscalYear((Integer)pageContext.getAttribute("ficalYear"))%></option>	   		
					   			</c:forEach>
							</select>
							</div>
							
							<div class="form-group col-md-4">
							<label class="control-label">Report Type</label>
							<select class="form-control" id="reportType" name="reportType">
					   			<option value="<%=ReportConstant.LEDGER_SIMPLE_REPORT%>">Ledger Summary</option>
					   			<option value="<%=ReportConstant.LEDGER__BREAKUP_DETAILS_REPORT%>">Ledger with Principal Interest</option>  			
							</select>
							</div>
							
							<div class="form-group col-md-4">
							<label class="control-label">As On Date</label>
							<div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <input type="datetime" class="form-control pull-right datepicker dateFormat" id="toDate" name="toDate"/>
				             </div>
							</div>
							
							<div class="form-group col-md-4">
							<label class="control-label"><spring:message code="report.view.ledgerreport.label.ledger.type"/></label>
							<select class="form-control" id="accountDimentionType" name="accountDimentionType" multiple="multiple">
							<%if(pageRenderMode.equals(CommonConstant.VIEW_MODE)) { %>
								<option value="<%=AccountDimentionType.MEMBER%>">Member</option>
							<%} else {%>			
					   			<option value="<%=AccountDimentionType.INCOME%>">Income</option>
					   			<option value="<%=AccountDimentionType.EXPENSE%>">Expense</option>
					   			<option value="<%=AccountDimentionType.ASSETS%>">Assets</option>
					   			<option value="<%=AccountDimentionType.LIABILITY%>">Liabilities</option>
					   			<option value="<%=AccountDimentionType.MEMBER%>">Member</option>
					   			<option value="<%=AccountDimentionType.DUTIES_TAXES%>">Duties and Taxes</option>
					   			<option value="<%=AccountDimentionType.P_AND_L%>">Income & Expenditure</option>
					   		<%} %>   		
							</select>
							</div>
							<div class="form-group col-md-4">
								<label class="control-label">Show Particulars</label>
								<select class="form-control" id="showParticulars" name="showParticulars">
									<option value="false">No</option>
									<option value="true">Yes</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<button type="button" class="col-md-3 btn btn-primary margin" onclick="javascript:showSocietyLedgerGrid();">Show</button>								
							</div>
						</form>						
						</div>
						<div class="box-body">
							<table id="societyLedgerGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
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

<script>
var prevFiscalYear = "";
var prevAccountDimentionTypeIdStr = "";
</script>

<%
Map pageStateRequestParam = (Map)request.getAttribute("pageStateRequestParam");
if(pageStateRequestParam != null)
{		
%>
	<script>
	prevFiscalYear = '<%=(String)pageStateRequestParam.get("fiscalYear")%>';
	prevAccountDimentionType = '<%=(String)pageStateRequestParam.get("accountDimentionType")%>';
	</script>
<%
}
%>
<!-- Page State from Session -->

<!-- JS Files -->  
<script type="text/javascript" src="<%=pluginPath%>/multiselect/js/bootstrap-multiselect.js?${Server_Token_Value}"></script>
<script src="<%=jsRoot%>/reports/accountLedgerReportPage.js?${Server_Token_Value}" type="text/javascript"></script>
<script>
if(prevFiscalYear != '')
{
	$("#fiscalYear").val(prevFiscalYear);
	var prevAccountDimentionTypeArray=prevAccountDimentionType.split(",");
	$("#accountDimentionType").val(prevAccountDimentionTypeArray);
	$("#accountDimentionType").multiselect("refresh");
}
showSocietyLedgerGrid();
</script>
</body>
</html>
