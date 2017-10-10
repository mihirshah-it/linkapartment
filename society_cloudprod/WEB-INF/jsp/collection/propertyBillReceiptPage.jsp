<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.bill.bo.SocietyPropertyPaymentBO"%>
<%@include file="../common/config.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Payment Receipt Details</TITLE>  
   <!-- CSS Files -->  
   <link rel="stylesheet" type="text/css" href="<%=cssRoot%>/collection/propertyBillReceiptPage.css?${Server_Token_Value}" />      
</HEAD>
<%
String mainMenu = "manageBills";
pageCode = PageCode.BILL_DETAILS;
SocietyPropertyPaymentBO societyPropertPaymentBO = (SocietyPropertyPaymentBO)request.getAttribute("societyPropertPaymentBO");
SocietyBO societyBO = (SocietyBO)request.getAttribute("societyBO");
SimpleDateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
NumberFormat  numberFormatter = new DecimalFormat(CommonConstant.NUMBER_FORMAT);
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
						<a  href="javascript:;"  onclick="javascript:printDivElement('receiptPrintDiv');" id="print"><spring:message code="common.button.print"/></a>
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
	<hsCommonTag:breadCrumb pageTitle="Payment Receipt Details" isFirstIndex="false"/>
	<!-- End Code for Bread crumb -->
	
		<h1><spring:message code="collection.bill.Receipt.view.form.header"/></h1>
		<p><spring:message code="collection.bill.Receipt.view.form.subHeader"/></p>
		
		<div class="receiptContainer" id="receiptPrintDiv">
			<div class="titleHolder">
				<div class="title">
					<%=societyBO.getSocietyName()%>
				</div>
				<div class="subTitle">
					<%=societyBO.getFormatedRegInfo()%>
					<br>
					<%=societyBO.getFormatedAddress()%>
				</div>
			</div>
			
			<div class="payeeInfoHolder">
				<table class="leftTable">
			 		<tr>
			 			<td><spring:message code="form.label.receiptNumber"/></td>
			 			<td><%=societyPropertPaymentBO.getSequenceNumber() %></td>
			 		</tr>			 		
			 	</table>
			 	
				<table class="rightTable">
			 		<tr>
			 			<td><spring:message code="common.label.date"/> : </td>
			 			<td><%=dateFormat.format(societyPropertPaymentBO.getPaymentDate())%></td>
			 		</tr>			 		
			 	</table>				
			</div>
			
			<div class="payeeInfoHolder">
				<table width="100%">
					<tr>
						<td>Received with Thanks from <%=societyPropertPaymentBO.getPropertyBO().getBlockNumber()%> <%=societyPropertPaymentBO.getPropertyBO().getPropertyNamePlateDetails()%></td>
					</tr>
					<tr>	
						<td>Sum of Rupees <span id="receiptAmountInWord"></span></td>
					</tr>
					<tr>
						<td>Being Amount Recd. Ag. Bill No. : <%=societyPropertPaymentBO.getPropertyBillBO().getSequenceNumber()%> Ch. No. <%=societyPropertPaymentBO.getChequeOrDDNumber()%></td>
					</tr>
					<tr>
						<td><b><u>Rs. <%=numberFormatter.format(societyPropertPaymentBO.getPaymentAmount())%></u></b></td>
					</tr>
					<tr>	
						<td>Subject to realization of cheque(s).</td>
					</tr>
				</table>				
			</div>			
			
			<div class="signDiv">
				<div class="forSocLine">For <%=societyBO.getSocietyName()%></div>
				<div class="spaceSignature"></div>
				<div class="HonSec">Hon. Secretary / Treasurer</div>
			</div>				
		</div>
	</div>
	</div>
</div>
<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->
<script type="text/javascript" src="<%=jqueryPath%>/print/jquery.jqprint.js?${Server_Token_Value}"></script>
<script>
	numberToWordConvert('<%=societyPropertPaymentBO.getPaymentAmount()%>','receiptAmountInWord');
</script>
</body>
</html>