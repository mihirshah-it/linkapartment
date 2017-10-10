<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/wizard.css?${Server_Token_Value}" />
<div class="appWizardBg">
	<div class="appWizardMenu">
		<ul class="createSociety">
	   		<li>
				<spring:message code="appwizardmenu.lable.bill.templateDetail"/>
			</li>
			
			<li>
				<spring:message code="appwizardmenu.lable.bill.defineAttribute"/>
			</li>
			
			<li>
				<spring:message code="appwizardmenu.lable.bill.assignTemplate"/>
			</li>
			
		</ul>		
	</div>	
</div>
<script type="text/javascript">
<%
	if(wizard.equals("templateDetail"))
	{
		%>
		$("li:nth-child(1)").addClass("current");		
		<%	
	}
	else if(wizard.equals("defineAttribute"))
	{
		%>
		$("li:nth-child(1)").addClass("lastDone");		
		$("li:nth-child(2)").addClass("current");		
		<%	
	}
	else if(wizard.equals("assignTemplate"))
	{
		%>
		$("li:nth-child(1)").addClass("done");		
		$("li:nth-child(2)").addClass("lastDone");		
		$("li:nth-child(3)").addClass("current");		
		<%	
	}	
%>
</script>