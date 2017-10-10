<%@page import="app.societywala.bill.bo.PropertyBillType"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Monthly Summary Report</TITLE>
</HEAD>
<%
String mainMenu = "manageReports";
String subMenu = "monthlyBillSummary";
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
			<% if (pageRenderMode.equals(CommonConstant.VIEW_MODE) == false) { %>
			<li>
				<a  href="javascript:;"  onclick="javascript:printSelectedMonthlySummaryBillReport();"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;Print Bill Summary</a>
			</li>
			<%} %>
			<li>
				<a  href="javascript:;"  onclick="javascript:printSelectedMonthlySummaryBillReceiptReport();"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;Print Receipt Summary</a>
           </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="report.showAllMonthlyReport.form.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Monthly Summary Report" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form id="showSocietMonthlyBillsSummaryForm" method="post">
						 <input type="hidden" id="billGenerationPeriod" name="billGenerationPeriod">
						 <input type="hidden" id="billType" name="billType">
						</form>
						<div class="box-header with-border">
						<div class="col-md-6">
							<label class="control-label"><spring:message code="common.label.selectFiscalYear"/></label>
							<select class="form-control" id="periodYear" onchange="javascript:showSocietyMonthlySummaryBillsReportGrid();">
								<c:forEach items="${generatedBillPeriodYearList}" var="periodYear" varStatus="counter">
									<option value="${periodYear}"><%=CommonUtilImpl.getDisplayFormatFiscalYear((Integer)pageContext.getAttribute("periodYear"))%></option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6">
							<label class="control-label">Bill Type</label>
							<select class="form-control" id="selbillType" name="selbillType" onchange="javascript:showSocietyMonthlySummaryBillsReportGrid();">
								<option value="<%=PropertyBillType.MAINTAINANCE_BILL%>"><%=PropertyBillType.returnPropertyBillTypeName(PropertyBillType.MAINTAINANCE_BILL)%></option>
								<option value="<%=PropertyBillType.SUPPLEMENTARY_BILL%>"><%=PropertyBillType.returnPropertyBillTypeName(PropertyBillType.SUPPLEMENTARY_BILL)%></option>
							</select>
						</div>
						</div>
						<div class="box-body">
							<table id="societyMonthlySummaryBillsReportGridDiv" class="table table-bordered table-striped table-hover dt-responsive"><!-- This will be populated by Ajax --></table>
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
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>
<script src="<%=jsRoot%>/reports/monthlyAllBillsSummaryReportPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>