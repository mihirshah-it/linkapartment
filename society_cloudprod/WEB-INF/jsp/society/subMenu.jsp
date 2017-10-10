<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@page import="app.societywala.user.bo.UserBO"%>
<%
UserBO userBOSubMenu = (UserBO)session.getAttribute("userSessionBO");
%>

<div class="appSubMenuBg">
	<div class="center">
	<div class="appSubMenu">
		<ul>
				<%if(userBOSubMenu.getUserLoginType().equals(UserRoleType.DATA_ENTRY_OPERATOR)
						|| userBOSubMenu.getUserLoginType().equals(UserRoleType.CONSULTANT)
						|| userBOSubMenu.getUserLoginType().equals(UserRoleType.MASTER_ADMIN) ) {%>
				<li>
					<a  href="<%=ctxPath %>/society/createNewSociety.htm"><spring:message code="appsubmenu.lable.createSociety"/></a>
				</li>
				
				<li>
					<a  href="<%=ctxPath %>/society/importNewSocietyPage.htm"><spring:message code="appsubmenu.lable.importSociety"/></a>
				</li>
				<% } %>
				<!-- <li>
					<a href="javascript:void(0)"><spring:message code="appsubmenu.lable.joinSociety"/></a>
				</li> -->			
		</ul>
	</div>
	</div>
</div>