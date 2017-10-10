<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@include file="../common/config.jsp" %>

<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@page import="java.util.List"%>

<html>
<HEAD>
	<%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Reports</TITLE> 
   <!-- CSS Files -->
   <link rel="stylesheet" type="text/css" href="<%=cssRoot%>/society/societyCard.css?${Server_Token_Value}" />   
</HEAD>
<%
String mainMenu = "manageReports";
String subMenu  = "";
pageCode = PageCode.REPORT;
session.setAttribute(CommonConstant.SESSION_DASHBOARD_MENU_NAME,mainMenu);
%>

<body>
<!-- Start Code for Header -->
<%@ include file="../common/appHeader.jsp" %> 
<!-- End Code for Header -->

<!-- Start Code for Header -->
<%@ include file="../common/appMainMenu.jsp" %>
<!-- End Code for Header -->

<form  method="post" id="societyForm">
	<input type="hidden" name="societyID" id="societyID">
	<input type="hidden" name="pageMode" id="pageMode">
</form>

<div class="contentBg">
	<div class="center">
	<div class="content">
	
	<!-- Start Code for Bread crumb -->
	<hsCommonTag:breadCrumb pageTitle="Reports" isFirstIndex="true" isSocietyNameDisplay="false"/>
	<!-- End Code for Bread crumb -->
	
	<div class="ui-widget inputHolder">
		<label><b>Society Name</b></label>
		<input type="text" id="societySelectedName" name="societySelectedName">		
		<input type="hidden"" id="societySelectedId" name="societySelectedId">			
		<input type="button" value="Search" onclick="javascript:filterSocietyDashboard();">				
		<a href="javascript:;" onclick="javascript:showAllSociety();" id="showAllSocietyLink" name="showAllSocietyLink"></a>		
	</div>
	
<!-- Start Code for Dashboard Div This data load by Ajax -->
	<div id="dashboardDataDiv">
	
	</div>
<!-- End Code for Dashboard Div This data load by Ajax -->
	</div>
	</div>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->

</body>
<!-- JS Files -->  
<script type="text/javascript" src="<%=jsRoot%>/common/SocietyDashboard.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/reports/manageReportDashboard.js?${Server_Token_Value}"></script>
<script>
	showSocietyDiv();
</script>
</html>