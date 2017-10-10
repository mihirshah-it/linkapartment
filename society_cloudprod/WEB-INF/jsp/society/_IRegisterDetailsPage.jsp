<%@page import="app.societywala.society.bo.IRegisterShareTransferrBO"%>
<%@page import="app.societywala.society.bo.IRegisterShareHeldBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.society.bo.SocietyPropertyIRegisterBO"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.society.bo.SocietyPropertyBO"%>
<%@include file="../common/ajaxConfig.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/society/_IRegisterDetailsPage.css?${Server_Token_Value}" />
<%
SocietyPropertyBO societyPropertyBO = (SocietyPropertyBO)request.getAttribute("societyPropertyBO");
SocietyPropertyIRegisterBO iRegisterBO = (SocietyPropertyIRegisterBO)request.getAttribute("iRegisterBO");
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>
<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
<div class="popUpTitle"> Register of Members for block no <%=societyPropertyBO.getBlockNumber() %></div>
<%}else if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) { %>
<div class="popUpTitle"> View Register of Members for block no <%=societyPropertyBO.getBlockNumber() %></div>
<%} %>
<div class="infoDiv">Search members to add</div>
<div id="errorMsgDiv" class="error"><spring:message code="common.error.msg.mandatory"/></div>
<input type="hidden" name="propertyId" id="propertyId" value="<%=societyPropertyBO.getSocietyPropertyId()%>"/>
<input type="hidden" name="iRegisterBOId" id="iRegisterBOId" value="<%=iRegisterBO.getiRegisterId()%>"/>
<div id="memberSearchDiv" class="form">
	<div class="inputHolder">
		<label>Mobile Number or email Id</label>
		<input class="mandatory" type="text" name="userSearchName" id="userSearchName"/>
		<input type="button" name="searchUser" value="<spring:message code="society.button.search.user"/>" onclick="javascript:searchUserForIRegister();"/>
	</div>
</div>
<div id="userIRegisterDetailsDiv" class="form">
</div>
<br>

<div>
			<div class="iRegisterGrid">
				<div class="info">Register Of Members</div>
				<div class="links"></div>
			</div>
			<table id="memberIRegisterGridDiv"></table>
			<div id="pmemberIRegisterGridDiv" ></div>	
			<script>
				showIRegisterMemberList();
			</script>			
</div>
<br>
<div>
			<div class="iRegisterGrid">
				<div class="info">Particular of shares held</div>
				<div class="links"><a class="textLink" href="javascript:addNewShareHeldEntry();">Add New Entry</a></div>
			</div>
			<table id="memberIRegisterShareHeldGridDiv"></table>
			<div id="pmemberIRegisterShareHeldGridDiv" ></div>
			<script>
				showShareHoldGrid();
			</script>			
</div>
<br>
<div>
			<div class="iRegisterGrid">
				<div class="info">Particular of shares transferred or surrendered</div>
				<div class="links"><a class="textLink" href="javascript:addNewShareTransferEntry();">Add New Entry</a></div>
			</div>	
			<table id="memberIRegisterShareTransferrGridDiv"></table>
			<div id="pmemberIRegisterShareTransferrGridDiv" ></div>	
			<script>		
				showIRegisterShareTransferGrid();
			</script>
</div>
