<%@page import="java.util.Map"%>
<%@include file="../common/config.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/></TITLE>
   <!-- CSS Files -->
</HEAD>

<body style="width:650px; overflow:auto;">

<div class="contentBg" style="width:650px;">
	<div class="center" style="width:600px;">
	<div class="content" style="width:600px;">
		<spring:message code="user.info.userCreated.SuccessFully"/>
		
		<div class="buttonPanel">
				<button type="button" id="closeBtn" onclick="javascript:window.close();">
					<spring:message code="common.button.Close"/>
				</button>
		</div>
	
	</div>
	</div>
	
</div>
</body>
</html>