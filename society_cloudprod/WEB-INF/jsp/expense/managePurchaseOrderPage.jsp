<%@page import="java.util.Map"%>
<%@include file="../common/config.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Purchase Order</TITLE> 
   <!-- CSS Files -->
   <link rel="stylesheet" type="text/css" href="<%=cssRoot%>/society/societyCard.css?${Server_Token_Value}" />   
   <style type="text/css">
   
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
String mainMenu = "manageAccount";
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
			</ul>
		</div>
		</div>
	</div>	
<!-- Sub Menu / Option -->


<div class="contentBg">
	<div class="center">
	<div class="content">
	
	<!-- Start Code for Bread crumb -->
	<hsCommonTag:breadCrumb pageTitle="Manage Purchase Order" isFirstIndex="false"/>
	<!-- End Code for Bread crumb -->
	
	<h1><spring:message code="expense.manage.purchase.order.page.header"/></h1>
	<p><spring:message code="expense.manage.purchase.order.page.subHeader"/></p>
	
	<div class="infoDiv">Show all Purchase Order</div>
	
	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
		<div class="form" style="width: 100%;">
			<div class="buttonPanel">
				<input type="button" value="<spring:message code="expense.btn.create.purchaseOrder"/>" onclick="javascript:createNewPurchaseOrder();"/>
			</div>
		</div>
	<%} %>
	
	<form method="post" id="purchaseOrderFormForward" name="purchaseOrderFormForward">
	   <input type="hidden" id="purchaseOrderId" name="purchaseOrderId">
	</form>
	
	<div class="form horizontalSpan">
			<label><spring:message code="common.label.selectYear"/></label>
			<select class="year" id="periodYear" onchange="javascript:showAllPurchaseOrderForSelectedYearGrid();">
				<c:forEach items="${purchaseOrderYearList}" var="periodYear" varStatus="counter">
					<option value="${periodYear}">${periodYear}</option>
				</c:forEach>
			</select>							
	</div>
	
	<table id="societyPurchaseOrderGridDiv"></table>
	<div id="psocietyPurchaseOrderGridDiv" ></div>
	
	</div>
	</div>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->
<!-- JS Files -->  
<script src="<%=ctxPath%>/jquery/grid/js/i18n/grid.locale-en.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=ctxPath%>/jquery/grid/js/jquery.jqGrid.min.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/expense/managePurchaseOrderPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>