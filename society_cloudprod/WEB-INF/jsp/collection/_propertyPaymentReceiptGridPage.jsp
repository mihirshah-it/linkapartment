<%@page import="java.util.Map"%>
<%@page import="app.societywala.bill.bo.PropertyBillBO"%>
<%@include file="../common/ajaxConfig.jsp" %>

<%
PropertyBillBO propertyBillBO = (PropertyBillBO)request.getAttribute("propertyBillBO");
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<div class="modal-dialog full-width" role="document">
    <div class="modal-content">
		<input type="hidden" name="propertyBillId" id="propertyBillId" value="<%=propertyBillBO.getPropertybillId()%>">
		<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">
	        	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
	        	 Add Property Bill Payment for Block number <%=propertyBillBO.getPropertyBO().getSocietyBuildingLevelBO().getSocietyBuildingBO().getSocietyBuildingName() + "/" + propertyBillBO.getPropertyBO().getBlockNumber()%>
	        	 <%} else if(pageRenderMode.equals(CommonConstant.VIEW_MODE)) { %> 
	        	  View Property Bill Payment for Block number <%=propertyBillBO.getPropertyBO().getSocietyBuildingLevelBO().getSocietyBuildingBO().getSocietyBuildingName() + "/" + propertyBillBO.getPropertyBO().getBlockNumber()%> 
	        	  <%} %>
			</h4>		
	     </div>
	     <div class="modal-body">
	     	<div id="memberBillReceiptFormDiv">
			</div>
			<div class="box box-default">
				<div class="box-header with-border">
					Current Bill Receipt Details
				</div>
				<div class="box-body">
					<table id="societyPropertyBillPaymentRecieptsGridDiv"  class="table table-bordered table-striped table-hover dt-responsive"></table>
				</div>			
			</div>
	    </div>
		<div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	     </div>
	</div>
</div>