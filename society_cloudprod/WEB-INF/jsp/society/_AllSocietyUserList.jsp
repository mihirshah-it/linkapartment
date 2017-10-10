<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.society.bo.SocietyPropertyBO"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%@page import="java.util.List"%>
<%@page import="app.societywala.user.bo.UserBO"%>
<%
  List<UserBO> userBOList = (List<UserBO>)request.getAttribute("userBOList");
  Map<Long , List<SocietyPropertyBO>> userPropertyDetailsMap = (Map<Long , List<SocietyPropertyBO>>)request.getAttribute("userPropertyDetailsMap");
  String strPanelId = request.getParameter("panelId");
  Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
  String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<%if(   strPanelId==null || 
		(!strPanelId.equalsIgnoreCase(String.valueOf(UserRoleType.CHAIR_MAN)) &&
		!strPanelId.equalsIgnoreCase(String.valueOf(UserRoleType.SECRETARY)) &&
		!strPanelId.equalsIgnoreCase(String.valueOf(UserRoleType.TRESURER)) &&
		!strPanelId.equalsIgnoreCase(String.valueOf(UserRoleType.SOCIETY_ADMIN))) 
	)
	{%>
		<ul class="users-list clearfix">
	<%}else { %>
		<ul class="clearfix list-unstyled">
	<% }%>
<%for(UserBO userBO : userBOList) {%>
	<li id="<%=userBO.getUserId()%>" class="userCard">
	<%
		String userProfileImageThumb = ctxPath+"/images/common/en_US/avatar.jpg";
		if(userBO.getProfileImageFileName() != null)
		 {
			 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
			 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.USER_ENTITY) +"/" +userBO.getUserId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_USER_PROFILE_MODULE);
			 userProfileImageThumb = finalAttachementDirectoryLocation + "/" + userBO.getProfileImageFileName();
		 }
	%>
			
	<img alt="User Image" src="<%=userProfileImageThumb%>" class="profile-user-img img-responsive img-circle">
	<span class="users-list-date"><%=userBO.getFullName()%></span>
	<span class="users-list-date">
	<%
	  List<SocietyPropertyBO> societyPropertyDetails = userPropertyDetailsMap.get(userBO.getUserId());
      StringBuffer sbBlockNumber = new StringBuffer("");
	  
      if(societyPropertyDetails != null)
	  {
	      for(SocietyPropertyBO societyPropertyBo : societyPropertyDetails)
		  {
			  sbBlockNumber.append(","+societyPropertyBo.getBlockNumber());
		  }
		  sbBlockNumber.deleteCharAt(0);
	  }
	%>
	<%=sbBlockNumber.toString()%>
	</span>
	<%if(!pageRenderMode.equals(CommonConstant.VIEW_MODE) && strPanelId!=null && 
		(!strPanelId.equalsIgnoreCase(String.valueOf(UserRoleType.SOCIETY_ADMIN)))
		){%>
		<span class="closeBtn" onclick="javascript:removeUser('<%=userBO.getUserId()%>','<%=strPanelId%>');"></span>
	<%}%>
	</li>
	
	<%if(!pageRenderMode.equals(CommonConstant.VIEW_MODE) && strPanelId!=null && strPanelId.equalsIgnoreCase(String.valueOf(UserRoleType.SOCIETY_ADMIN))){%>
		<div class="form">
			<input type="button" class="btn btn-default" onclick="javascript:changeSocietyAdminPopup('<%=userBO.getUserId()%>','<%=strPanelId%>');" value="<spring:message code="common.button.change"/>"></input>
		</div>		
	<%}%>
	
<% } %>
</ul>