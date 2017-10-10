<%@page import="java.util.Map"%>
<%@page import="app.societywala.reports.bo.ReportConstant"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Member Related Reports</TITLE>
</HEAD>
<%
String mainMenu = "manageReports";
String subMenu  = "memberReports";
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
            	<a  href="javascript:;"  onclick="javascript:printLedgerOutstandingReport();"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1>Member Related Reports</h1>
		  <hsCommonTag:breadCrumb pageTitle="Member Related Reports" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
						<div class="box-header with-border">
						<form name="memberReportForm" id="memberReportForm" method="post">
							<input type="hidden" name="accountSubTypeId" id="accountSubTypeId">
														
							<div class="form-group col-md-3">
							<label class="control-label">Report Type</label>
							<select class="form-control" id="reportType" name="reportType">
					   			<option value="1">Outstanding Balance</option>					   			  			
							</select>
							</div>
							
							<div class="form-group col-md-2">
							<label class="control-label"><spring:message code="common.label.financial.year"/></label>
							<select class="form-control" id="fiscalYear" name="fiscalYear">
					   			<c:forEach items="${ficalYearList}" var="ficalYear">
					   				<option value="${ficalYear}"><%=CommonUtilImpl.getDisplayFormatFiscalYear((Integer)pageContext.getAttribute("ficalYear"))%></option>	   		
					   			</c:forEach>
							</select>
							</div>
							
							<div class="form-group col-md-2">
							<label class="control-label">Show BreakUp</label>
							<select class="form-control" id="showBreakUp" name="showBreakUp">
					   			<option value="false">No</option>
					   			<option value="true">Yes</option>					   			
							</select>
							</div>
							
							<div class="form-group col-md-3">
							<label class="control-label">As On Date</label>
							<div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <input type="datetime" class="form-control pull-right datepicker dateFormat" id="toDate" name="toDate"/>
				             </div>
							</div>
							
							<div class="form-group col-md-2">
								<button  type="button" class="btn btn-primary margin" onclick="javascript:showLedgerOutstandingReport();">Show</button>
							</div>
						</form>						
						</div>
						<div class="box-body">
							<div id="reportDiv"></div>
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
<script src="<%=jsRoot%>/reports/memberRelatedReportPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>
