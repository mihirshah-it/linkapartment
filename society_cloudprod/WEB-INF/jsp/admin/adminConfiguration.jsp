<%@include file="../common/config.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appmetaFile.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Admin Configuration</TITLE>
	<!-- CSS Files -->
	</style>
</HEAD>

<%
String mainMenu = "admin";
String subMenu  = "";
%>

<body>

<form  method="post" id="adminForm">
	<input type="hidden" name="pageMode" id="pageMode">
</form>

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
						<a  href="javascript:;" onclick="javascript: backURL();"> << <spring:message code="common.button.back"/></a>
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
	<hsCommonTag:breadCrumb pageTitle="Admin Configuration" isFirstIndex="true" isSocietyNameDisplay="false"/>
	<!-- End Code for Bread crumb -->
	
	<div class="societyActivityHolder">
		<a href="javascript:manageAdvertise();">
					Advertise
		</a>
	</div>
	
	<div class="societyActivityHolder">
		<a href="javascript:manageStatutoryAccountPage();">
					Account Statutory
		</a>
	</div>
	
	<div class="societyActivityHolder">
		<a href="javascript:manageLetterCircularTemplatePage();">
					Letter/Circular Templates
		</a>
	</div>
	
	<div class="societyActivityHolder">
		<a href="javascript:manageUsersPage();">
					Users
		</a>
	</div>
	
	<div class="societyActivityHolder">
		<a href="javascript:manageLedgerPage('<%=CommonConstant.EDIT_MODE%>');">
					Account Head and Ledger
		</a>
	</div>
	
	<div class="societyActivityHolder">
		<a href="javascript:manageSocietyDashboard();">
					Manage Society
		</a>
	</div>
	
	</div>
	</div>
</div>

<!-- Start Code for Footer -->
		<%@include file="../common/appFooter.jsp" %>
	<!-- End Code for Footer -->
<script src="<%=jsRoot%>/admin/adminConfiguration.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>