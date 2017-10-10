<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Financial Statement Reports</TITLE>
</HEAD>
<%
String mainMenu = "manageReports";
String subMenu  = "finStatementReports";
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
		 </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1>Financial Statement Reports</h1>
		  <hsCommonTag:breadCrumb pageTitle="Financial Statement Reports" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form name="statementDetailsForm" id="statementDetailsForm" method="post" action="<%=ctxPath%>/reports/societyBalanceSheetReportPage.htm">
    						<input type="hidden" name="fiscalYear" id="fiscalYear"> 
						</form>
						
					    <div class="box-header with-border">							
						</div>
						<div class="box-body">
							<table id="financialStatmentGridDiv" class="table table-bordered table-striped table-hover dt-responsive">
								<thead>
								<tr>
					                <th></th>
					                <th></th>
					                <th colspan="2">Opening</th>
					                <th colspan="2">Transaction</th>
					                <th colspan="2">Closing</th>
					                <th></th>
					            </tr>
					            <tr>
					                <th></th>
					                <th>Fiscal Year</th>
					                <th>Debit</th>
					                <th>Credit</th>
					                <th>Debit</th>
					                <th>Credit</th>
					                <th>Debit</th>
					                <th>Credit</th>
					                <th>Action</th>
					            </tr>
					            </thead>
							</table>							
						</div> <!--  end of body -->
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
<script src="<%=jsRoot%>/reports/manageFinancialStatementReportPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>