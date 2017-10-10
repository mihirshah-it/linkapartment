<%@page import="java.util.Map"%>
<%@include file="../common/config.jsp" %>

<html>
<HEAD>
   <%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/></TITLE> 
   <!-- CSS Files -->
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
%>

<body>
<!-- Start Code for Header -->
<%@ include file="../common/appHeader.jsp" %> 
<!-- End Code for Header -->

<!-- Start Code for Header -->
<%@ include file="../common/appMainMenu.jsp" %>
<!-- End Code for Header -->


<div class="contentBg">
	<div class="center">
	<div class="content">
	
	<h1><spring:message code="audit.manage.all.audit.page.header"/></h1>
	<p><spring:message code="audit.manage.all.audit.page.subHeader"/></p>
	
	<%if(pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
	<div class="infoDiv"><spring:message code="audit.manage.all.audit.page.info"/></div>
	<%}%>
	
	<form id="auditFormForward" method="post">
	   <input type="hidden" name="societyAuditId" id="societyAuditId">
	</form>
	
	<div class="form horizontalSpan">
			<label><spring:message code="common.label.selectYear"/></label>
			<select class="year" id="periodYear" onchange="javascript:showSocietyAuditDetailsGrid();">
				<c:forEach items="${generatedAuditPeriodYearList}" var="periodYear" varStatus="counter">
					<option value="${periodYear}">FY-${periodYear}</option>
				</c:forEach>
			</select>				
	</div>
	
	<table id="societyAuditGridDiv"></table>
	<div id="psocietyAuditGridDiv" ></div>
	
	<div class="form">
		<div class="buttonPanel">
		     <input type="button" id="back" value="<spring:message code="common.button.back"/>" onclick="javascript: backURL();"/>
		</div>
	</div>
	
	</div>
	</div>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->
<!-- JS Files -->  
<script src="<%=ctxPath%>/jquery/grid/js/i18n/grid.locale-en.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=ctxPath%>/jquery/grid/js/jquery.jqGrid.min.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/audit/manageAllAudit.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
<script>
showSocietyAuditDetailsGrid();
</script>
</html>