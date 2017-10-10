<%@page import="app.societywala.bill.bo.PropertyPaymentDetailsBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.account.bo.AccountLedgerHeadConstants"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
SimpleDateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
Date clearanceDate = (Date)request.getAttribute("clearanceDate");
List<PropertyPaymentDetailsBO> propertyPaymentDetailsBOList = (List<PropertyPaymentDetailsBO>)request.getAttribute("propertyPaymentDetailsBOList");
%>
<div class="popUpTitle">Payment Bounce Details</div>
<div class="infoDiv">Provide comments and penalty charges of bounce payment</div>
<form id="bounceDetailsForm" name="bounceDetailsForm" class="form" style="width: 100%;">
	<input type="hidden" id="billPaymentId" name="billPaymentId" value="${billPaymentId}"/>
	<div style="width:60%;">
		<div class="inputHolder">
		  	<label class="label">Add Penalty</label>
		  	<input type="radio" id="penaltyFlag" name="penaltyFlag" value="1" onchange="javascript:showHidePenaltyDetailsDiv();"/>Yes
		  	<input type="radio" id="penaltyFlag" name="penaltyFlag" value="0" onchange="javascript:showHidePenaltyDetailsDiv();"/>No
	  	</div>
	  	<div class="inputHolder">
		  	<label class="label">Bounce Date</label>
		  	<c:set var="bounceDateVar" value=""/>
		  	<c:if test="${clearanceDate ne null }">
		  		<c:set var="bounceDateVar" value="<%=dateFormat.format(clearanceDate)%>"/>
		  	</c:if>
		  	<input type="text" id="bounceDate" name="bounceDate" class="datepicker" value="${bounceDateVar}"/>
		</div>
	</div>
	<div style="width:80%;">
	  	<div id="penaltyDetailsDiv">
			<div class="inputHolder">
			  	<label class="label">Comments</label>
			  	<input type="text" id="bounceComments" name="bounceComments"/>
		  	</div>
		  	<%for(int i=0 ; i <propertyPaymentDetailsBOList.size() ; i++){ 
		  		PropertyPaymentDetailsBO propertyPaymentDetailsBO = propertyPaymentDetailsBOList.get(i);
		  	%>
		  	<div class="inputHolder">
			  	<label class="label"> <%=propertyPaymentDetailsBO.getSocietyPropertyBO().getPropertySubAccountLedgerBO().getLedgerTypeTitle()%> Penalty Charges </label>
			  	<input type="text" id="bouncePenaltyCharges<%=i+1%>" name="bouncePenaltyCharges<%=i+1%>" value="">
			  	<input type="hidden" id="propertyId<%=i+1%>" name="propertyId<%=i+1%>" value="<%=propertyPaymentDetailsBO.getSocietyPropertyBO().getSocietyPropertyId()%>">
		  	</div>
		  	<%} %>
		 </div>
		 <input type="hidden" name="propertyCounter" id="propertyCounter" value="<%=propertyPaymentDetailsBOList.size()%>"/>
	 </div>
	 <div class="form buttonPanel">
			<input type="button" class="primary" onclick="javascript:saveBouncePenaltyChargesDetails();" value="Save">											
	</div>
</form>
<script>
showHidePenaltyDetailsDiv();
</script>