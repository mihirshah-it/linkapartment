 <%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.user.bo.UserBO"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="app.societywala.common.bo.MenuBO"%>
<%@page import="app.societywala.user.bo.UserRoleType"%>
<%
 UserBO userBOSubMenu = (UserBO)session.getAttribute("userSessionBO"); 
 %>
 <!-- Left side column. contains the logo and sidebar -->
 <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
      	<%
				 String leftSocietyProfileImageThumb = ctxPath+"/images/common/en_US/buildingImg.jpg";
      			 String leftSocietyName = "";
      			 if(session.getAttribute(CommonConstant.SESSION_CURRENT_SOCIETY_IMG) != null)
				 {
					 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
					 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.SOCIETY_ENTITY) +"/" + ((Long)session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_ID))+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_SOCIETY_PROFILE_MODULE);
					 leftSocietyProfileImageThumb = finalAttachementDirectoryLocation + "/" + (String)session.getAttribute(CommonConstant.SESSION_CURRENT_SOCIETY_IMG);
				 }
      			 if(session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_NAME) != null)
      			 {
      				leftSocietyName = (String)session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_NAME);	 
      			 }
		%>
        <div class="pull-left image">
          <img src="<%=leftSocietyProfileImageThumb%>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=leftSocietyName%></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      
      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        
        <li class="<%=(mainMenu.equals("dashboard") ? "active" : "")%>">
          <a href="<%=ctxPath%>/common/myDashboard.htm">
            <i class="fa fa-dashboard"></i> <span><spring:message code="appmenu.lable.dashboard"/></span>            
          </a>          
        </li>
        
        <%if(userBOSubMenu.getUserLoginType().equals(UserRoleType.DATA_ENTRY_OPERATOR)
						|| userBOSubMenu.getUserLoginType().equals(UserRoleType.CONSULTANT)
						|| userBOSubMenu.getUserLoginType().equals(UserRoleType.MASTER_ADMIN) ) {%>
        <li>
          <a href="<%=ctxPath %>/society/createNewSociety.htm">
            <i class="fa fa-plus-square"></i> <span><spring:message code="appsubmenu.lable.createSociety"/></span>            
          </a>          
        </li>
        <li>
          <a  href="<%=ctxPath %>/society/importNewSocietyPage.htm">
            <i class="fa fa-cloud-upload"></i> <span><spring:message code="appsubmenu.lable.importSociety"/></span>            
          </a>          
        </li>
        <li>
          <a  href="<%=ctxPath %>/user/manageMyTeam.htm">
            <i class="fa fa-users"></i> <span><spring:message code="appsubmenu.lable.myTeam"/></span>            
          </a>          
        </li>
        
       <% } %>
        <li>
          <a  href="javascript:;" onclick="javascript:showChangeSocietyDiv();">
            <i class="fa fa-tag"></i><span>Change Society</span>            
          </a>          
        </li>
       <% for(MenuBO menuCard : CommonConstant.leftMenuBOList) 
       { %>
    	   	
       		<li class="<%=(mainMenu.equals(menuCard.getPageMenuName()) ? "active" : "")%> <%=menuCard.getIsExpandable()?"treeview":"" %>">
       			 <a href="#">
		            <i class="<%=menuCard.getCssName()%>"></i>
		            <span><spring:message code="<%=menuCard.getMenuName()%>"/></span>
		            <span class="pull-right-container">
		              <i class="fa fa-angle-left pull-right"></i>
		            </span>
		        </a>
       		
       			<%if(menuCard.getIsExpandable()){%>
       			<ul class="treeview-menu">
       				<% for(MenuBO subMenuCard : menuCard.getSubMenuBOList()){%>
		            <li class="<%=(subMenu.equals(subMenuCard.getPageMenuName()) ? "active" : "")%>">
		            	<% if(subMenuCard.getEditMenuCardBO() != null && userMenuRenderMode != null && userMenuRenderMode.equals(CommonConstant.EDIT_MODE) ){ %>
		            	<a href="<%=(ctxPath+subMenuCard.getEditMenuCardBO().getFunctionName())%>">
		            	<i class="fa fa-circle-o"></i>
		            		<spring:message code="<%=subMenuCard.getEditMenuCardBO().getLabelCode()%>"/>
		            	</a>
		            	<%} else if(subMenuCard.getViewMenuCardBO() != null  && userMenuRenderMode != null && userMenuRenderMode.equals(CommonConstant.VIEW_MODE) ){ %>
		            	<a href="<%=(ctxPath+subMenuCard.getViewMenuCardBO().getFunctionName())%>">
		            	<i class="fa fa-circle-o"></i>
		            		<spring:message code="<%=subMenuCard.getViewMenuCardBO().getLabelCode()%>"/>
		            	</a>
		            	<%} %>		            	
		            </li>
		            <%} // end of for%>
		        </ul>
		        <%} %> 		
       		
       		</li>
       <%} //end of for%>
       	<%if(userBOSubMenu.getUserLoginType().equals(UserRoleType.MASTER_ADMIN)) {%>
        <li>
          <a href="<%=ctxPath %>/admin/adminConfiguration.htm">
            <i class="fa fa-edit"></i> <span>Admin</span>
          </a>
        </li>
        <%} %>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
<div class="modal fade" id="tagSocietyDiv" tabindex="-1" role="dialog" aria-labelledby="Tag Society">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	Select Society        		
        </h4>
      </div>
      
      
      <div class="modal-body">
      		<form  method="post" id="changeSocietyForm" action="<%=ctxPath%>/society/changeSociety.htm">
	    	<div class="box box-body">
				 <div class="form-group">
				 	<label class="required" for="societySelectedName">Society Name</label>
				    <input class="form-control" type="text" id="societySelectedName" name="societySelectedName" required>		
					<input type="hidden" id="societySelectedId" name="societySelectedId" required>
				 </div>
			</div>
			</form>
	</div>
	<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" onclick="$('#changeSocietyForm').submit();" class="btn btn-primary">Change</button>
     </div>
	</div>
	</div>
</div>