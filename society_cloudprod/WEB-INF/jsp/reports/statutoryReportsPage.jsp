<%@page import="app.societywala.reports.bo.StatutoryReportType"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Statutory Report</TITLE>
</HEAD>
<%
String mainMenu = "manageReports";
String subMenu  = "statutoryReports";
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
				<a  href="javascript:;" onclick="javascript:printStatutoryReportGrid();"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
			</li>
		 </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="report.view.statutoryreport.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Statutory Report" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form name="societRegisterIForm" id="societRegisterIForm" method="post">
							<input type="hidden" name="registerIdStrArray" id="registerIdStrArray">
						</form>
						
						<form name="societRegisterJForm" id="societRegisterJForm" method="post">		
						</form>
						
						<form id="societMemberShareRegistrationForm" name="societMemberShareRegistrationForm" method="post">
						</form>
						
						<form id="societNominationMemberRegisterForm" name="societNominationMemberRegisterForm" method="post">
						</form>
						
						<form id="societPropertyRegisterForm" name="societPropertyRegisterForm" method="post">
						</form>
					    <div class="box-header with-border">
							<form name="societStatutoryReportForm" id="societStatutoryReportForm" method="post">
									<input type="hidden" name="entityTypeIds" id="entityTypeIds">			
									<label class="control-label"><spring:message code="report.view.statutoryReport.label.report.type"/></label>
									<select class="form-control" id="reportType" name="reportType" onchange="showStaturyReportGrid();">
										<option value="<%=StatutoryReportType.MEMBER_I_FORM%>"><spring:message code="report.view.statutoryReport.options.report.type.register.of.member.i.form"/>  </option>
							   			<option value="<%=StatutoryReportType.MEMBER_J_FORM%>"><spring:message code="report.view.statutoryReport.options.report.type.register.of.member.j.form"/> </option>
							   			<option value="<%=StatutoryReportType.MEMBER_SHARES_REGISTER%>"><spring:message code="report.view.statutoryReport.options.report.type.register.of.shares"/> </option>
							   			<option value="<%=StatutoryReportType.MEMBER_SHARES_CERTIFICATE%>"><spring:message code="report.view.statutoryReport.options.report.type.shares.certificates"/> </option>
							   			<option value="<%=StatutoryReportType.MEMBER_NOMINATION%>"><spring:message code="report.view.statutoryReport.options.report.type.register.of.nomination"/> </option>
							   			<option value="<%=StatutoryReportType.PROPERTY_REGISTER%>"><spring:message code="report.view.statutoryReport.options.report.type.register.of.property"/> </option>
							   			<option value="<%=StatutoryReportType.INVESTEMENT_REGISTER%>"><spring:message code="report.view.statutoryReport.options.report.type.register.of.investement"/> </option>
							   			<option value="<%=StatutoryReportType.SINKING_FUND_REGISTER%>"><spring:message code="report.view.statutoryReport.options.report.type.register.of.sinking.funds"/> </option>
							   		</select>	 	
							</form>
						</div>
						<div class="box-body">
							<table id="iFormGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>							
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
	
<!-- Share Certificate Popup form -->
<div class="modal fade" id="certificatePopupForm" tabindex="-1" role="dialog" aria-labelledby="Share Certificate Template">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Select the certificate format</h4>
     </div>	
	<div class="modal-body">
	<form  id="societMemberShareCertificateForm" name="societMemberShareCertificateForm" method="post" class="form">	
		<div class="form-group">	
		  	<label class="control-label">TemplateName</label>
		  	<select class="form-control" id="certificateTemplateName" name="certificateTemplateName">
		  		<option value="shareCertificateTemplate">Bye-Law Design</option>
		  		<option value="shareCertificateTemplateMorocon">Customize Design</option>	  		
		  	</select>
	  	</div>
	  	
	  	<div class="form-group">	
		  	<label class="control-label">Border Style</label>
		  	<select class="form-control" id="certificateBorderName" name="certificateBorderName">
		  		<option value="DesignBorder">Designer Border</option>
		  		<option value="SimpleBorder">Simple Border</option>	  			  		
		  	</select>
	  	</div>
	  	
	  	<div class="form-group">
		  	<label class="control-label">Color</label>
		  	<select class="form-control" id="colorName" name="colorName">
		  		<option value="red">Red</option>
		  		<option value="blue">Blue</option>
		  	</select>
	  	</div>
	  	
	  	<div class="form-group">
		  	<label class="control-label">WaterMark Image</label>
		  	<select class="form-control" id="waterMark" name="waterMark">
		  		<option value="ganesh">Ganesh Image</option>
		  		<option value="building">Building Image</option>
		  		<option value="none">No WaterMark</option>
		  	</select>
	  	</div>
	  </form>
	  </div>
	  	<div class="modal-footer">
	  		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	  		<button type="button" class="btn btn-primary" onclick="javascript:printMemberShareCertificate();">Download</button>			
	  	</div>	
	</div>
	</div>
</div>
<!-- Share Certificate Popup form -->
	

<!-- End Code for Footer -->
<script type="text/javascript">
	var jsMemberIFormId = <%=StatutoryReportType.MEMBER_I_FORM%>;
	var jsMemberJFormId = <%=StatutoryReportType.MEMBER_J_FORM%>;
	var jsMemberShareRegister = <%=StatutoryReportType.MEMBER_SHARES_REGISTER%>;
	var jsMemberShareCertificate = <%=StatutoryReportType.MEMBER_SHARES_CERTIFICATE%>;
	var jsNominationMemberRegister = <%=StatutoryReportType.MEMBER_NOMINATION%>;
	var jsPropertyRegister = <%=StatutoryReportType.PROPERTY_REGISTER%>;
	var jsInvestmentRegister = <%=StatutoryReportType.INVESTEMENT_REGISTER%>;
	var jsSinkingFundRegister = <%=StatutoryReportType.SINKING_FUND_REGISTER%>;
</script>
<script src="<%=jsRoot%>/reports/statutoryReportsPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>