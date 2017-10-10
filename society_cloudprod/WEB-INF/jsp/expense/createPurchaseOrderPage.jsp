<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.expense.bo.PurchaseOrderItemBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@include file="../common/config.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appmetaFile.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Purchase Order Details</TITLE>
	<!-- CSS Files -->  
	<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/expense/createPurchaseOrderPage.css?${Server_Token_Value}" />
</HEAD>

<%
String mainMenu = "manageAccount";
String subMenu  = "";

String formSubmitAction=ctxPath+"/expense/savePurchaseOrder.htm";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);

List<PurchaseOrderItemBO> purchaseOrderItemList = (List<PurchaseOrderItemBO>)request.getAttribute("purchaseOrderItemList");
Boolean isUserIsApproval = new Boolean(false);

if(request.getAttribute("isUserApproval") != null) // This will happens only if user view the purchase order from dashboard or Grid.
{
	isUserIsApproval = (Boolean)request.getAttribute("isUserApproval");	
}

SimpleDateFormat dateFormater = new SimpleDateFormat(CommonConstant.dateUIFormatter);
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
					<%if (pageRenderMode.equals(CommonConstant.EDIT_MODE) || pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
					<li>
						<a  href="javascript:;" id="printBtn" name="printBtn" onclick="javascript:printDivElement('printPurchaseOrder');"><spring:message code="common.button.print"/></a>
					</li>
					<%} %>
			</ul>
		</div>
		</div>
	</div>	
<!-- Sub Menu / Option -->

<div class="contentBg">
	<div class="center">
	<div class="content">
		
	<!-- Start Code for Bread crumb -->
	<hsCommonTag:breadCrumb pageTitle="Purchase Order Details" isFirstIndex="false"/>
	<!-- End Code for Bread crumb -->
	
	 <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) ) {%>
	<h1><spring:message code="expense.purchase.order.form.label.header"/></h1>
	<% }else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {
	 %>
	   <h1><spring:message code="expense.edit.purchase.order.form.label.header"/></h1>
	 <%
	 }
	 %>
	<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE) ) {%>
	<p><spring:message code="expense.purchaseorder.form.label.subheader"/></p>
	<%} else if (pageRenderMode.equals(CommonConstant.VIEW_MODE))  {%>
	<h1><spring:message code="expense.purchase.order.form.label.header"/></h1>
	<p><spring:message code="expense.purchaseorder.form.label.subheader"/></p>
	<%} %>
	
	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
	<div class="infoDiv"><spring:message code="expense.purchaseorder.purchase.order.page.info"/></div>
	<%} %>
	
	<form:form cssClass="form" style="width:500px;" method="post" action="<%=formSubmitAction%>" commandName="purchaseOrderBO">
		<div id="printPurchaseOrder">
		<form:hidden path="purchaseOrderId"/>
		<form:hidden path="approvalStatus"/>
		<form:hidden path="deliveryStatus"/>
		<form:hidden path="sequenceNumber" />
		
		<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) == false) { %>
			<div class="inputHolder">
			<form:label cssClass="label" path="sequenceNumber">
				<spring:message code="expense.purchase.order.form.label.purchaseOrderNumber"/>
			</form:label>
			<form:label cssClass="label" path="sequenceNumber">
				${purchaseOrderBO.sequenceNumber}
			</form:label>			
		</div>
		<% } %>
		
		<div class="inputHolder">
			<form:label cssClass="label" path="purchaseOrderTitle">
				<spring:message code="expense.purchaseOrder.form.label.purchaseOrderTitle"/>
			</form:label>
			<form:input class="mandatory" path="purchaseOrderTitle" htmlEscape="true"/>	
			<div class="error mandatoryError"><spring:message code="expense.purchaseOrder.form.error.empty.purchaseOrderTitle"/></div>
		</div>
		<div class="inputHolder">
			<form:label cssClass="label" path="vendorName">
				<spring:message code="expense.purchaseOrder.form.label.vendorName"/>
			</form:label>
			<form:input class="mandatory" path="vendorName" htmlEscape="true"/>	
			<div class="error mandatoryError"><spring:message code="expense.purchaseOrder.form.error.empty.vendorName"/></div>
		</div>
		
		<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE))
	    {
	    %>	
		<div class="buttonPanel">
			<input type="button" onclick="javascript:addNewItem();" value="<spring:message code="expense.purchaseOrder.btn.add.Item"/>" />			
		</div>
		<%
	    }
		%>

		<div class="emptyListMessage">
			<spring:message code="expense.purchaseOrder.msg.noItemMsg"/>
		</div>
		
		<input type="hidden" name="itemCounter" id="itemCounter" value="<%=purchaseOrderItemList.size()%>"/>
		
		<div id="appendItemListiv" class="poItemPanel">
			<div id="tableHeaderDiv" class="innerDiv tableHeaderDiv">
				<div style="width: 150px"><spring:message code="expense.purchaseOrder.label.itemCode.name"/></div>
				<div style="width: 168px"><spring:message code="expense.purchaseOrder.label.itemDescription.name"/></div>
				<div style="width: 140px"><spring:message code="expense.purchaseOrder.label.itemRequireOnDate.name"/></div>
				<div style="width: 140px"><spring:message code="expense.purchaseOrder.label.unitPrice.name"/></div>
				<div style="width: 140px"><spring:message code="expense.purchaseOrder.label.quantity.name"/></div>
				<div style="width: 140px" ><spring:message code="expense.purchaseOrder.label.totalPrice.name"/></div>
			</div>
			<c:forEach items="${purchaseOrderItemList}" var="purchaseOrderItemBO" varStatus="counter">
			   <div id="innerDiv${counter.count}" class="innerDiv inputHolder">
	
			     <input type="text" class="mandatory" name="itemCode${counter.count}" id="itemCode${counter.count}" value="${purchaseOrderItemBO.itemCode}"/>
			     <textarea name="itemDescription${counter.count}" id="itemDescription${counter.count}">${purchaseOrderItemBO.itemDescription}</textarea>
			     <input type="text" class="datepicker" name="itemRequireOnDate${counter.count}" id="itemRequireOnDate${counter.count}" value="<fmt:formatDate value="${purchaseOrderItemBO.itemRequireOnDate}" pattern="<%=CommonConstant.dateUIFormatter%>"/>" />
			     <input type="text" name="unitPrice${counter.count}" id="unitPrice${counter.count}" value="${purchaseOrderItemBO.unitPrice}" onchange="javascript:calculateItemTotal(${counter.count});"/>
			     <input type="text" name="quantity${counter.count}" id="quantity${counter.count}" value="${purchaseOrderItemBO.quantity}" onchange="javascript:calculateItemTotal(${counter.count});"/>
			     <input type="text" name="totalPrice${counter.count}" id="totalPrice${counter.count}" value="${purchaseOrderItemBO.totalPrice}" readonly="readonly"/>
			     <input type="hidden" name="purchaseOrderItemId${counter.count}" id="purchaseOrderItemId${counter.count}" value="${purchaseOrderItemBO.purchaseOrderItemId}"/>			     
			     <input type="hidden" name="purchaseOrderItemStatus${counter.count}" id="purchaseOrderItemStatus${counter.count}" value="update"/>
				 <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE))
	             {%>
			     <input type="button" class="deleteButton" onclick="javascript:deletePersistanceItem('${counter.count}');" value="<spring:message code="common.button.delete"/>" />
			     <%
	             }
			     %>
			   </div>
			</c:forEach>
		</div>
		
		<div id="error">
			<spring:message code="common.error.msg.mandatory"/>
		</div>
		
		
		<div class="inputHolder">
			<form:label cssClass="label" path="subTotal">
				<spring:message code="expense.purchaseOrder.form.label.subtotal"/>
			</form:label>
			<form:input path="subTotal" htmlEscape="true"/>			
		</div>
		
		<div class="inputHolder">
			<form:label cssClass="label" path="totalTax">
				<spring:message code="expense.purchaseOrder.form.label.totalTax"/>
			</form:label>
			<form:input path="totalTax" htmlEscape="true"/>			
		</div>
		
		<div class="inputHolder">
			<form:label cssClass="label" path="grantTotal">
				<spring:message code="expense.purchaseOrder.form.label.grantTotal"/>
			</form:label>
			<form:input path="grantTotal" htmlEscape="true" readonly="true" />			
		</div>
		</div> <!-- End of  <div id="printPurchaseOrder"> -->
		<div class="buttonPanel2">
			<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
				<button class="primary" type="submit" id="submitBtn">
						<spring:message code="common.button.save"/>
				</button>
			<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
				<button class="primary" type="submit" id="submitBtn">
						<spring:message code="common.button.Update"/>
				</button>				
			<% } else if (pageRenderMode.equals(CommonConstant.VIEW_MODE) && isUserIsApproval) {%>
				<input type="button" class="primary" value="<spring:message code="common.button.approve"/>" onclick="javascript:approvalCommentPopup('Approve','3');">
				<input type="button" class="primary" value="<spring:message code="common.button.reject"/>" onclick="javascript:approvalCommentPopup('Reject','4');">						
			<% } %>			
		</div>
		
	</form:form>
	
	</div>
	</div>
</div>

<div id="popupDivComment" class="popup_block">
	<div id="userCommentDiv" class="form">
	<input type="hidden" id="approvalActionType" name="approvalActionType">
	<div class="inputHolder">
		<label>Comment</label>
		<textarea name="userComment" id="userComment"></textarea>
		<input type="button" id="approvalCommentSubmit" name="approvalCommentSubmit" onclick="submitApprovalAction();"/>		
	</div>
	</div>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->

</body>
<!-- JS Files -->  
<script type="text/javascript" src="<%=jqueryPath%>/print/jquery.jqprint.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/expense/createPurchaseOrderPage.js?${Server_Token_Value}"></script>
</html>