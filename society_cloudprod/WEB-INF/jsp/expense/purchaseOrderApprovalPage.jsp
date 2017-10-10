<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@page import="app.societywala.expense.bo.PurchaseOrderBO"%>
<%@page import="java.util.Map"%>
<%@include file="../common/config.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Purchase Order Approval Details</TITLE> 
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
PurchaseOrderBO purchaseOrderBO = (PurchaseOrderBO)request.getAttribute("purchaseOrderBO");
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
	<hsCommonTag:breadCrumb pageTitle="Purchase Order Approval Details" isFirstIndex="false"/>
	<!-- End Code for Bread crumb -->
	
	<h1><spring:message code="expense.manage.purchase.order.approval.page.header"/></h1>
	<p><spring:message code="expense.manage.purchase.order.approval.page.subHeader"/></p>
	
	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>	
		<div class="infoDiv"><spring:message code="expense.manage.purchase.order.approval.page.info"/></div>
	<%} %>
	
	<table id="societyPurchaseOrderApprovalGridDiv"></table>
	<div id="psocietyPurchaseOrderApprovalGridDiv" ></div>
	
	<div class="form" style="width: 100%;">
	
		 <div class="inputHolder">
				<label class="label"><spring:message code="expense.purchase.order.form.label.purchaseOrderNumber"/> : </label>
				<label class="label">${purchaseOrderBO.sequenceNumber}</label>        			
		 </div>
	     
	     <div class="inputHolder">
				<label class="label"><spring:message code="expense.purchaseOrder.form.label.purchaseOrderTitle"/> : </label>
				<label class="label">${purchaseOrderBO.purchaseOrderTitle}</label>        			
		 </div>
	     
	     <div class="inputHolder">
				<label class="label"><spring:message code="expense.purchaseOrder.form.label.vendorName"/> : </label>
				<label class="label">${purchaseOrderBO.vendorName}</label>        			
		 </div>
		 
		 <div class="inputHolder">
				<label class="label"><spring:message code="expense.purchaseOrder.form.label.grantTotal"/> : </label>
				<label class="label">${purchaseOrderBO.grantTotal}</label>        			
		 </div>
		 
		 <div class="inputHolder">
				<label class="label">Select User Type</label>
				<select id="userSelectionType" name="userSelectionType" onchange="javascript:getSocietyPurchaseOrderNotSendApprovalUsersGrid();">
				  <option value="<%=UserRoleType.SOCIETY_PANEL%>">Society Panel Members List</option>
				  <option value="<%=UserRoleType.SOCIETY_ALL_MEMBERS%>">Society All Members List</option>
				</select>
				<input type="button" class="primary" value="<spring:message code="common.button.send.for.approval"/>" onclick="javascript:sendPurchaseOrderToUsersForApproval();"/>       			
		 </div>		
	</div>
	
	<table id="societyPurchaseOrderNewApprovalUserGridDiv"></table>
	<div id="psocietyPurchaseOrderNewApprovalUserGridDiv" ></div>
	
	
	</div>
	</div>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->
<!-- JS Files -->
<script>
var purchaseOrderId = '<%=purchaseOrderBO.getPurchaseOrderId()%>';
</script>  
<script src="<%=ctxPath%>/jquery/grid/js/i18n/grid.locale-en.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=ctxPath%>/jquery/grid/js/jquery.jqGrid.min.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/expense/purchaseOrderApprovalPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>