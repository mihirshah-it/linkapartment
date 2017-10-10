<%@page import="app.societywala.common.constants.CommonConstant"%>
<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/wizard.css?${Server_Token_Value}" />
<form  method="post" id="societyForm">
	<input type="hidden" name="societyID" id="societyID">
	<input type="hidden" name="pageMode" id="pageMode">
</form>
<div class="appWizardBg">
	<div class="appWizardMenu">
		<%if(!pageRenderMode.equals(CommonConstant.CREATE_MODE)) {
		 	Long wizardSocietyId = (Long)session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_ID);		 	
		%>
		
		<ul class="createSociety">
	   		<li>
				<a href="javascript:societyDetails('<%=wizardSocietyId%>' , '<%=pageRenderMode%>');"><spring:message code="appwizardmenu.lable.societyDetail"/></a>
			</li>
			
			<li>
				<a href="javascript:societyStructure('<%=wizardSocietyId%>' , '<%=pageRenderMode%>');"><spring:message code="appwizardmenu.lable.defineStructure"/></a>				
			</li>
			
			<li>
				<a href="javascript:propertyDetails('<%=wizardSocietyId%>' , '<%=pageRenderMode%>');"><spring:message code="appwizardmenu.lable.addMember"/></a>
			</li>
			
			<li>
				<a href="javascript:societyPanel('<%=wizardSocietyId%>' , '<%=pageRenderMode%>');"><spring:message code="appwizardmenu.lable.definePanel"/></a>
			</li>
		</ul>
		<%} %>
	</div>	
</div>
<script type="text/javascript">
<%
	if(wizard.equals("societyDetail"))
	{
		%>
		$("li:nth-child(1)").addClass("current");		
		<%	
	}
	else if(wizard.equals("defineStructure"))
	{
		%>
		$("li:nth-child(1)").addClass("lastDone");		
		$("li:nth-child(2)").addClass("current");		
		<%	
	}
	else if(wizard.equals("addMember"))
	{
		%>
		$("li:nth-child(1)").addClass("done");		
		$("li:nth-child(2)").addClass("lastDone");		
		$("li:nth-child(3)").addClass("current");		
		<%	
	}
	else if(wizard.equals("definePanel"))
	{
		%>
		$("li:nth-child(1)").addClass("done");		
		$("li:nth-child(2)").addClass("done");		
		$("li:nth-child(3)").addClass("lastDone");		
		$("li:nth-child(4)").addClass("current");		
		<%	
	}
%>
</script>