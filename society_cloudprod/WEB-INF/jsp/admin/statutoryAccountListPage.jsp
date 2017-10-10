<%@include file="../common/config.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Statutory Account List</TITLE> 
   <!-- CSS Files -->    
   <style>
   .form{
	width: 100%;
	padding-bottom: 10px;
	}

	.form label{
	display:inline-block;
	float: left;
	height: 25px;
	line-height: 25px;
	vertical-align: middle;
	padding-left: 10px;
	padding-right: 5px;
	}

	.form select{
	float: left;
	width: 200px;
	margin-right: 10px;
	}
	</style>
</HEAD>
<%
String mainMenu = "admin";
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
			</ul>
		</div>
		</div>
	</div>	
<!-- Sub Menu / Option -->

<form id="advertismentForm" method="post">
	 <input type="hidden" id="advertiseDetailsId" name="advertiseDetailsId">
</form>

<div class="contentBg">
	<div class="center">
	<div class="content">
	
		<!-- Start Code for Bread crumb -->
		<hsCommonTag:breadCrumb pageTitle="Manage Statutory Account" isFirstIndex="false" isSocietyNameDisplay="false"/>
		<!-- End Code for Bread crumb -->
		
		<h1>Statutory Account Details</h1>
		<p>Configure Statutory Account from here</p>
		
		<div class="infoDiv">Configure Statutory Account from here</div>
		
		<div class="gridHolder">
			<table id="statutoryAccountGridDiv"><!-- This will be populated by Ajax --></table>
			<div id="pstatutoryAccountGridDiv"><!-- This will be populated by Ajax --></div>
		</div>
		
	</div>
	</div>
</div>


<div id="accountStatutoryRatePopupForm" name="accountStatutoryRatePopupForm" class="popup_block">
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->

<script src="<%=ctxPath%>/jquery/grid/js/i18n/grid.locale-en.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=ctxPath%>/jquery/grid/js/jquery.jqGrid.min.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/admin/statutoryAccountListPage.js?${Server_Token_Value}" type="text/javascript"></script>

</body>

</html>
