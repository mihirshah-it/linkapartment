<%@page import="app.societywala.user.bo.TeamMemberBO"%>
<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.society.bo.SocietyPropertyBO"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%@page import="java.util.List"%>
<%@page import="app.societywala.user.bo.UserBO"%>
<%
  List<TeamMemberBO> teamMemberBOList = (List<TeamMemberBO>)request.getAttribute("teamMemberBOList");
%>

<ul class="users-list clearfix">
<%for(TeamMemberBO teamMemberBO : teamMemberBOList) {%>
	<li id="<%=teamMemberBO.getTeamMemberId()%>" class="userCard">
	<%
		String userProfileImageThumb = ctxPath+"/images/common/en_US/avatar.jpg";
		UserBO userBO = teamMemberBO.getUserBO();
		if(userBO.getProfileImageFileName() != null)
		 {
			 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
			 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.USER_ENTITY) +"/" +userBO.getUserId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_USER_PROFILE_MODULE);
			 userProfileImageThumb = finalAttachementDirectoryLocation + "/" + userBO.getProfileImageFileName();
		 }
	%>			
		<img alt="User Image" src="<%=userProfileImageThumb%>" class="profile-user-img img-responsive img-circle">
		<span class="users-list-date"><%=teamMemberBO.getDesignationTitle()%></span>
		<span class="users-list-name"><%=userBO.getFullName()%></span>
		<span class="users-list-date"><a class="text-center" href="javascript:;" onclick="javascript:getTeamMemberDetails('<%=teamMemberBO.getTeamMemberId()%>');">Edit</a></span>
		<span class="closeBtn" onclick="javascript:removeTeamMemberUser('<%=teamMemberBO.getTeamMemberId()%>');"></span>
	<%} // end of for loop%>
	</li>
</ul>