<%@include file="../common/ajaxConfig.jsp" %>
<%@page import="app.societywala.incometax.bo.TDSNatureOfPaymentBO"%>
<%
TDSNatureOfPaymentBO tdsNatureOfPaymentBO = (TDSNatureOfPaymentBO)request.getAttribute("tdsNatureOfPaymentBO");
%>
<div class="popUpTitle">Statutory Rates Details</div>
<div class="infoDiv">Modify Statutory Rate Details for <%=tdsNatureOfPaymentBO.getPaymentName()%></div>

<input type="hidden" name="tdsNatureOfPaymentId" id="tdsNatureOfPaymentId" value="<%=tdsNatureOfPaymentBO.getTdsNatureOfPaymentId()%>">

<div class="horizontalBtnHolder">
	<input type="button" onclick="javascript:addAccountStatutoryRateDetails();" value="Add Rate"/>
</div>

<div id="accountStatutoryRateDetailsDiv"></div>

<table id="tdsNatureOfPaymentRateGridDiv"></table>
<div id="ptdsNatureOfPaymentRateGridDiv" ></div>