<%@page import="app.societywala.user.bo.UserBO"%>
<%@page import="app.societywala.user.bo.UserRoleType"%>
<%
UserBO userBOAppMenu = (UserBO)session.getAttribute("userSessionBO");
%>
<div class="appMainMenuBg">
	<div class="center">
	<div class="appMainMenu">
		<ul>
			<li <% if(mainMenu.equals("dashboard")){%>class="selectedMainMenu"<%}%> >
				<a href="<%=ctxPath %>/common/myDashboard.htm"><spring:message code="appmenu.lable.dashboard"/></a>
			</li>
			
			<li <% if(mainMenu.equals("manageSociety")){%>class="selectedMainMenu"<%}%> >
				<a href="<%=ctxPath %>/society/manageSocietyDashboard.htm"><spring:message code="appmenu.lable.manageSociety"/></a>			
			</li>
		
			<li <% if(mainMenu.equals("manageBills")){%>class="selectedMainMenu"<%}%> >
				<a href="<%=ctxPath %>/bill/manageBillDashboard.htm"><spring:message code="appmenu.lable.manageBills"/></a>			
			</li>
		
			<li <% if(mainMenu.equals("manageAccount")){%>class="selectedMainMenu"<%}%> >
				<a href="<%=ctxPath %>/account/manageAccount.htm"><spring:message code="appmenu.lable.manageAccount"/></a>
			</li>
			
			<li <% if(mainMenu.equals("manageEvent")){%>class="selectedMainMenu"<%}%> >
				<a href="<%=ctxPath %>/event/manageEventDashboard.htm"><spring:message code="appmenu.lable.manageCommunication"/></a>
			</li>
			
			<li <% if(mainMenu.equals("manageReports")){%>class="selectedMainMenu"<%}%> >
				<a href="<%=ctxPath %>/reports/manageReportDashboard.htm"><spring:message code="appmenu.lable.manageReports"/></a>
			</li>
			
			
			<%if(userBOAppMenu.getUserLoginType().equals(UserRoleType.MASTER_ADMIN)) {%>
			<li <% if(mainMenu.equals("admin")){%>class="selectedMainMenu"<%}%> >
				<a href="<%=ctxPath %>/admin/adminConfiguration.htm"><spring:message code="appmenu.lable.admin.configuration"/></a>
			</li>
			<%} %>
			
			
					
		</ul>
	</div>
	</div>	
</div>