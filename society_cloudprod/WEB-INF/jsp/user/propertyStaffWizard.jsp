<%@page import="app.societywala.common.constants.CommonConstant"%>
<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/wizard.css?${Server_Token_Value}" />
<div class="appWizardBg">
	<div class="appWizardMenu">
		<ul class="createSociety">
		<%if(pageRenderMode.equals(CommonConstant.CREATE_MODE) == true) {%>
	   		<li>
				<lable>Staff Details</lable>
			</li>
						
			<li>
				<lable>Staff for Property</lable>
			</li>
		<%}else{ %>
			<li>
				<%if(pageRenderMode.equals(CommonConstant.EDIT_MODE)){%>
					<a href="javascript:editPropertyStaffDetails('<%=propertyStaffBO.getPropertyStaffId()%>');">Staff Details</a>
				<%}else{ %>
					<a href="javascript:viewPropertyStaffDetails('<%=propertyStaffBO.getPropertyStaffId()%>');">Staff Details</a>
				<%} %>
			</li>
			
			<li>
				<a href="javascript:propertyStaffMappingDetail('<%=propertyStaffBO.getPropertyStaffId()%>');">Staff for Property</a>
			</li>
		<%} %>
		</ul>		
	</div>
</div>
<script type="text/javascript">
<%
	if(wizard.equals("staffDetail"))
	{
		%>
		$("li:nth-child(1)").addClass("current");		
		<%	
	}
	else if(wizard.equals("propertyStaffMappingDetail"))
	{
		%>
		$("li:nth-child(1)").addClass("lastDone");
		$("li:nth-child(2)").addClass("current");		
		<%	
	}
%>
</script>