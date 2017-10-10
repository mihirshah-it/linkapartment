<%@page import="app.societywala.advertise.bo.AdvertisementProviderType"%>
<%@page import="app.societywala.advertise.bo.AdvertisementStatus"%>
<%@page import="app.societywala.advertise.bo.PageCode"%>

<%@include file="../common/config.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appmetaFile.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Payment Entry Details</TITLE>
	<!-- CSS Files -->
	<link rel="stylesheet" type="text/css" href="<%=pluginPath%>/multiselect/css/bootstrap-multiselect.css?${Server_Token_Value}" />	
	<style type="text/css">
	.perticulars{
		display:inline-block;
		width: 100%;
		border:solid 1px #363636;
		border-top: none;
	}
	</style>
	<!-- Page Specific Java Script Variables  -->
</HEAD>

<%
String mainMenu = "admin";
String subMenu  = "";
String formSubmitAction = ctxPath+"/admin/saveAdvertisementDetailsPage.htm";
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
		<hsCommonTag:breadCrumb pageTitle="Ad-Sponsore Details" isFirstIndex="false" isSocietyNameDisplay="false"/>
		<!-- End Code for Bread crumb -->
		
		<h1>Advertise/Sponsor Details</h1>
		<p>Advertise/Sponsor Details</p>
		
		<div class="infoDiv">Advertise/Sponsor Details</div>
		
		<form:form  cssClass="form" method="post" commandName="advertiseDetailsBO" action="<%=formSubmitAction%>">
			<form:hidden path="advertiseDetailsId"/>
			
			<div class="inputHolder">
				<form:label cssClass="label" path="providerName">
					Provider Name
				</form:label>
				<div class="mandatoryMark">*</div>
				<form:input cssClass="mandatory" path="providerName" htmlEscape="true"/>
				<div class="error mandatoryError">Provider Name is required</div>						
			</div>
			
			<div class="inputHolder">
				<form:label cssClass="label" path="providerType">
					Provider Type	       
				</form:label>
				<div class="mandatoryMark">*</div>
				<form:select cssClass="mandatory" path="providerType" onchange="javascript:showLocalServiceFields();">
					<form:option value="">--Select---</form:option>
					<form:option value="<%=AdvertisementProviderType.ADVERTISEMENT%>">Advertisement</form:option>
					<form:option value="<%=AdvertisementProviderType.SPONSORE%>">Sponsor</form:option>
					<form:option value="<%=AdvertisementProviderType.LOCAL_SERVICE%>">Local Service</form:option>				
				</form:select>
				<div class="error mandatoryError">Provider Type	is required</div>
			</div>
			
			<div id="fieldsForServiceProvider">
				<div class="inputHolder">
					<form:label cssClass="label" path="providerSinceYear">
						Provider Since Year
					</form:label>
					<form:input cssClass="number" path="providerSinceYear" htmlEscape="true"/>										
				</div>
				
				<div class="inputHolder">
					<form:label cssClass="label" path="primaryContactNumber">
						Primary Contact Number
					</form:label>
					<form:input path="primaryContactNumber" htmlEscape="true"/>										
				</div>
				
				<div class="inputHolder">
					<form:label cssClass="label" path="secondaryContactNumber">
						Secondary Contact Number
					</form:label>
					<form:input path="secondaryContactNumber" htmlEscape="true"/>										
				</div>
				
				<div class="inputHolder">
					<form:label cssClass="label" path="emailId">
						Email Id
					</form:label>
					<form:input cssClass="email" path="emailId" htmlEscape="true"/>										
				</div>
				
				<div class="inputHolder">
					<form:label cssClass="label" path="address">
						Address
					</form:label>
					<form:textarea path="address" htmlEscape="true"/>										
				</div>
				
				<div class="inputHolder">
					<form:label cssClass="label" path="pinCode">
						Pin Code
					</form:label>
					<form:input path="pinCode" htmlEscape="true"/>									
				</div>
				
				<div class="inputHolder">
					<form:label cssClass="label" path="tags">
						Tags
					</form:label>
					<form:input path="tags" htmlEscape="true"/>									
				</div>
				
				<div class="inputHolder">
				<label class="label">Category</label>
				<select id="categoryMappingBOSet" name="categoryMappingBOSet" multiple="multiple">
				<c:forEach items="${categoryList}" var="category">
					<c:set var="categorySelected" value=""></c:set>
					<c:forEach items="${advertiseDetailsBO.advertiseDetailsCategoryBOSet}" var="advertiseDetailsCategoryBO">
						<c:if test="${category.categoryId eq advertiseDetailsCategoryBO.category.categoryId }">
							<c:set var="categorySelected" value="selected"></c:set>
						</c:if>
					</c:forEach>
					<option value="${category.categoryId}" ${categorySelected}>${category.categoryName}</option>
				</c:forEach>
				</select>
				</div>
				
				<div class="inputHolder">
					<form:label cssClass="label" path="isVerified">
						Is Verified
					</form:label>
					<form:radiobutton path="isVerified" label="Yes" value="true"/>
					<form:radiobutton path="isVerified" label="No" value="false"/>									
				</div>				
				
				<div class="inputHolder">
					<form:label cssClass="label" path="aboutProvider">
						About Provider
					</form:label>
					<form:textarea path="aboutProvider" htmlEscape="true"/>									
				</div>
				
			</div>
			
			<div class="inputHolder">
				<form:label cssClass="label" path="providerWebLink">
					Provider Web Link
				</form:label>
				<form:input path="providerWebLink" htmlEscape="true"/>
			</div>
			
			<div class="inputHolder">
				<form:label cssClass="label" path="status">
					Status	       
				</form:label>
				<div class="mandatoryMark">*</div>
				<form:select cssClass="mandatory" path="status">
					<form:option value="<%=AdvertisementStatus.ACTIVE%>">Active</form:option>
					<form:option value="<%=AdvertisementStatus.DE_ACTIVE%>">De-Active</form:option>					
				</form:select>
				<div class="error mandatoryError">Status is required</div>
			</div>
			
			<div class="inputHolder">
				<label class="label">Page Code</label>
				<select id="pageMappingBOSet" name="pageMappingBOSet" multiple="multiple">
				<c:forEach items="${pageCodeList}" var="pageCode">
					<c:set var="pageCodeSelected" value=""></c:set>
					<c:forEach items="${advertiseDetailsBO.advertiseDetailsPageMappingBOSet}" var="advertiseDetailsPageMappingBO">
						<c:if test="${pageCode.pageCodeId eq advertiseDetailsPageMappingBO.pageCode.pageCodeId }">
							<c:set var="pageCodeSelected" value="selected"></c:set>
						</c:if>
					</c:forEach>
					<option value="${pageCode.pageCodeId}" ${pageCodeSelected}>${pageCode.pageName}</option>
				</c:forEach>
				</select>
			</div>
			
			
			
			<div class="buttonPanel2">
		       <button id="submitBtn" name="submitBtn">	
					Save
			  </button>
						
		</div>
		</form:form>
	</div>
	</div>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->
<script>
	var jsProviderTypeLocalService = '<%=AdvertisementProviderType.LOCAL_SERVICE%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/admin/advertisementDetailsPage.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=pluginPath%>/multiselect/js/bootstrap-multiselect.js?${Server_Token_Value}"></script>
</body>

</html>
	