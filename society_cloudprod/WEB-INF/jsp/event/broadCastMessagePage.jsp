<%@include file="../common/config.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appmetaFile.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Broad Cast Message</TITLE>
	<!-- CSS Files -->  
	<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/event/broadCastMessagePage.css?${Server_Token_Value}" />
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "";

String formSubmitAction=ctxPath+"/event/submitBroadCastMessage.htm";
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
			<hsCommonTag:breadCrumb pageTitle="Broad Cast Message" isFirstIndex="false"/>
		<!-- End Code for Bread crumb -->
	   
	   <h1><spring:message code="event.button.broadCast.header"/></h1>
	   <p><spring:message code="event.button.broadCast.subHeader"/></p>
	   
	   
	
	   <div class="center" style="width:285px; margin-bottom: 10px;">
	   		<div class="mobileSMSImage"></div>
	   </div>
	   
	   <form:form cssClass="form" method="post" action="<%=formSubmitAction%>">
	   	  <div class="center" style="width:285px; margin-bottom: 10px;">
	   	  	<lable class="label"><spring:message code="common.label.message"/></label>
	   	  </div>
	      <div class="center" style="width:285px;">
	      	<textarea id="message" name="message" style="width:280px;"></textarea>
	      </div>
	      <div class="buttonPanel">
	      <button id="submitBtn" name="submitBtn">
				<spring:message code="event.button.BroadCast"/>
		   </button>
		   </div>
	   </form:form>
	
	</div>
	</div>
</div>


<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->

</body>

<!-- JS Files -->  
</html>
