<%@page import="app.societywala.common.constants.CommonConstant"%>
<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/wizard.css?${Server_Token_Value}" />
<div class="appWizardBg">
	<div class="appWizardMenu">
		<ul class="createSociety">
		<%if(pageRenderMode.equals(CommonConstant.CREATE_MODE) == true) {%>
	   		<li>
				<lable>Meeting Details</lable>
			</li>
						
			<li>
				<lable>Agenda Details</lable>
			</li>
			
			<li>
				<lable>Minutes Details</lable>
			</li>
		<%}else{ %>
			<li>
				<%if(pageRenderMode.equals(CommonConstant.EDIT_MODE)){%>
					<a href="javascript:editMeetingDetails('<%=societyMeetingBO.getMeetingId()%>');">Meeting Details</a>
				<%}else{ %>
					<a href="javascript:viewMeetingDetails('<%=societyMeetingBO.getMeetingId()%>');">Meeting Details</a>
				<%} %>
			</li>
			
			<li>
				<a href="javascript:meetingNoticeAgendaDetails('<%=societyMeetingBO.getMeetingId()%>');">Agenda Details</a>
			</li>
			
			<li>
				<a href="javascript:meetingMinutesDetails('<%=societyMeetingBO.getMeetingId()%>');">Minutes Details</a>
			</li>
		<%} %>
		</ul>		
	</div>
</div>
<script type="text/javascript">
<%
	if(wizard.equals("meetingDetail"))
	{
		%>
		$("li:nth-child(1)").addClass("current");		
		<%	
	}
	else if(wizard.equals("agendaDetail"))
	{
		%>
		$("li:nth-child(1)").addClass("lastDone");
		$("li:nth-child(2)").addClass("current");		
		<%	
	}
	else if(wizard.equals("minutesDetail"))
	{
		%>
		$("li:nth-child(1)").addClass("done");		
		$("li:nth-child(2)").addClass("lastDone");		
		$("li:nth-child(3)").addClass("current");		
		<%	
	}
%>
</script>