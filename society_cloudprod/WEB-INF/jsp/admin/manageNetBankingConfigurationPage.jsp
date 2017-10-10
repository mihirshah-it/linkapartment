<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@include file="../common/config.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appmetaFile.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Net Banking Details</TITLE>  
	<!-- CSS Files -->	
</HEAD>
<%
String mainMenu = "admin";
String subMenu  = "";
SocietyBO societyBO = (SocietyBO)request.getAttribute("societyBO");
List<AccountLedgerSubTypeBO> accountSubTypeMasterBOList = (List<AccountLedgerSubTypeBO>)request.getAttribute("accountSubTypeMasterBOList");
pageCode = PageCode.ADMIN;
String formSubmitAction=ctxPath+"/admin/saveNetBankingConfigurationPage.htm";
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
	<hsCommonTag:breadCrumb pageTitle="Net Banking Details" isFirstIndex="false"/>
	<!-- End Code for Bread crumb -->
	
	<h1>Manage Net Banking</h1>
	<p>Manage Net Banking Details</p>
	
	<c:choose>
	<c:when test="${not empty accountSubTypeMasterBOList}">	
	<form:form class="form" commandName="societyBO" action="<%=formSubmitAction%>">
		<form:hidden path="societyId"/>
		<div class="inputHolder">
			<form:label cssClass="label" path="payULedgerBO">
				Bank Ledger Name
			</form:label>
			<div class="mandatoryMark">*</div>			
			<form:select path="payULedgerBO" cssClass="mandatory">
				<option value="">Select</option>	
				<c:forEach var="societyAssetsBankBO" items="${accountSubTypeMasterBOList}">
					<c:set var="selectedVar" value=""></c:set>
					<c:if test="${not empty societyBO.payULedgerBO  and societyAssetsBankBO.accountLedgerSubTypeId eq societyBO.payULedgerBO.accountLedgerSubTypeId}">
						<c:set var="selectedVar" value="selected=\"selected\""></c:set>						
					</c:if>
					<option value="${societyAssetsBankBO.accountLedgerSubTypeId}" ${selectedVar}>${societyAssetsBankBO.ledgerTypeTitle}</option>				
				</c:forEach>
			</form:select>		
			<div class="error mandatoryError">Bank Ledger Name Is Required</div>
		</div>
		<div class="inputHolder">
			<form:label cssClass="label" path="payUMerchantKey">
				Pay U Merchant Id
			</form:label>
			<div class="mandatoryMark">*</div>
			<form:input path="payUMerchantKey" cssClass="mandatory"/>
			<div class="error mandatoryError">Pay U Merchant Id Is Required</div>
		</div>
		<div class="inputHolder">
			<form:label cssClass="label" path="payUMerchantSalt">
				Pay U Salt
			</form:label>
			<div class="mandatoryMark">*</div>
			<form:input path="payUMerchantSalt" cssClass="mandatory"/>
			<div class="error mandatoryError">Pay U Salt Is Required</div>
		</div>
		
		<div class="buttonPanel">
		        <button id="submitBtn" name="submitBtn">	
					<spring:message code="common.button.saveAndContinue"/>
				</button>					
		</div>
		</form:form>
		</c:when>
		<c:otherwise>
			<b><font color="red">No any Bank Ledger Found</font></b>
		</c:otherwise>
		</c:choose>	
	</div>
	</div>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->

</body>
<!-- JS Files -->
<script src="<%=jsRoot%>/admin/manageNetBankingConfigurationPage.js?${Server_Token_Value}" type="text/javascript"></script>
</html>