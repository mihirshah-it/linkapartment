<%@page import="java.util.Map"%>
<%@include file="../common/config.jsp" %>

<html>
<HEAD>
   <%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Trail Balance Report</TITLE>
</HEAD>
<%
String mainMenu = "manageReports";
String subMenu  = "";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<body>
<!-- Start Code for Header -->
<%@ include file="../common/appHeader.jsp" %> 
<!-- End Code for Header -->

<!-- Start Code for Header -->
<%@ include file="../common/appMainMenu.jsp" %>
<!-- End Code for Header -->

<!-- Sub Menu / Option -->
	<div class="appSubMenuBg">
		<div class="center">
		<div class="appSubMenu">
			<ul>
					<li>
						<a  href="javascript:;"  onclick="javascript: backURL();"> << <spring:message code="common.button.back"/></a>
					</li>	
					<li>
						<a  href="javascript:;"  onclick="javascript:printSelectedLedger();">Print</a>
					</li>							
			</ul>
		</div>
		</div>
	</div>	
<!-- Sub Menu / Option -->

<div class="contentBg">
	<div class="center">
	<div class="content">
	
	<!-- Start Code for Bread crumb -->
	<hsCommonTag:breadCrumb pageTitle="Manage Ledger Report" isFirstIndex="false"/>
	<!-- End Code for Bread crumb -->
	
	<h1>Trail Balance Report</h1>
	<p>Trail Balance Report</p>
	<div class="infoDiv">View and Print Trail Balance Report Fiscal Yearwise</div>
	
	<div align="center">
		<table id="trailBalanceFYGridDiv"></table>
		<div id="ptrailBalanceFYGridDiv" ></div>	
	</div>	

	</div>
	</div>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->
	
<script src="<%=ctxPath%>/jquery/grid/js/i18n/grid.locale-en.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=ctxPath%>/jquery/grid/js/jquery.jqGrid.min.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/reports/societyTrailBalanceReportPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>