<%@include file="../common/config.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Advertisement</TITLE> 
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
		<hsCommonTag:breadCrumb pageTitle="Manage Advertisement" isFirstIndex="false" isSocietyNameDisplay="false"/>
		<!-- End Code for Bread crumb -->
		
		<h1>Advertisement Details</h1>
		<p>Add Sponsor or Advertise from here</p>
		
		<div class="infoDiv">Add Sponsor or Advertise from here</div>
		<div class="form horizontalSpan">
			<label>Provider Type</label>
			<select id="providerType" onchange="javascript:showAdvertiseGrid();">
				<option value="<%=AdvertisementProviderType.ADVERTISEMENT%>">Advertisement</option>
				<option value="<%=AdvertisementProviderType.SPONSORE%>">Sponsore</option>
				<option value="<%=AdvertisementProviderType.LOCAL_SERVICE%>">Local Service</option>
			</select>						
			<div>
				<label>Page Code</label>
				<select id="pageCode" onchange="javascript:showAdvertiseGrid();">
				 <c:forEach items="${pageCodeList}" var="pageCode">
					<option value="${pageCode.pageCodeId}">${pageCode.pageName}</option>					
				 </c:forEach>
				</select>
			</div>	
			<input type="button" class="form button" value="Add" onclick="javascript:addAdvertiseOrSponsore();">
			
		</div>	
				
		<table id="advertiseGridDiv"><!-- This will be populated by Ajax --></table>
		<div id="padvertiseGridDiv"><!-- This will be populated by Ajax --></div>
		
	</div>
	</div>
</div>

<div id="imageCropPopupForm" class="popup_block">
	<div id="advertiseImageUploadDiv"></div>
	<input type="button" name="cropImageSaveBtn" id="cropImageSaveBtn" value="Save" onclick="javascript:saveAdvertisementSponsoreCropImage();"/>	
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->

<script>
	jsAdvertiseSponsorEntity	= '<%=AttachementConstatnt.ADMIN_ENTITY%>';
	jsAdvertiseSponsorEntityId = '<%=AttachementConstatnt.ADMIN_ADVERTISE_SPONSOR_ENTITY_ID%>';
	jsAdvertiseSponsorModule = '<%=AttachementConstatnt.IMG_ADVERTISE_SPONSOR_MODULE%>';	
</script>

<script src="<%=ctxPath%>/jquery/grid/js/i18n/grid.locale-en.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=ctxPath%>/jquery/grid/js/jquery.jqGrid.min.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/admin/manageAdvertisementPage.js?${Server_Token_Value}" type="text/javascript"></script>

</body>

</html>
