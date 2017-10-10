<%@page import="app.societywala.user.bo.TeamMemberBO"%>
<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.user.bo.UserPropertyBO"%>
<%@page import="app.societywala.society.bo.PropertyOwnershipTypeBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
TeamMemberBO teamMemberBO = (TeamMemberBO)request.getAttribute("teamMemberBO"); 
List<UserBO> managerUserList = (List<UserBO>)request.getAttribute("managerUserList");
if(teamMemberBO != null)
{	
 UserBO userBO = teamMemberBO.getUserBO();
 UserBO managerUserBO = teamMemberBO.getManagerUserBO();
  String userProfileImageThumb = ctxPath+"/images/common/en_US/avatar120x120.jpg";
  if(userBO.getProfileImageFileName() != null)
	 {
		 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
		 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.USER_ENTITY) +"/" +userBO.getUserId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_USER_PROFILE_MODULE);
		 userProfileImageThumb = finalAttachementDirectoryLocation + "/" + userBO.getProfileImageFileName();
	 }
 %> 
 <%if(teamMemberBO.getTeamMemberId()!=null) {  // if search mode then not show this%>
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	Member Details	
        </h4>
      </div>
 
	 <div id="userDetailsDiv" class="modal-body">
<%} %>
	 		<form role="form" id="teamMemberBO" name="teamMemberBO">
	 				<input type="hidden" name="teamMemberId" id="teamMemberId" value="<%=teamMemberBO.getTeamMemberId()!=null?teamMemberBO.getTeamMemberId():""%>">
	 				<input type="hidden" name="userId" id="userId" value="<%=userBO.getUserId()%>">
	 				<div class="infoDiv">Team Member Details</div>
	      			<div class="box box-body">
	            		<div class="form-group">
	              				<div class="col-md-4">
	              					<img class="col-md-12 profile-user-img img-responsive img-circle" src="<%=userProfileImageThumb%>" alt="User profile picture">
	              				</div>
	              				<div class="col-md-8">
	              				<div class="form-group">
				     			 <label><spring:message code="user.label.full.name"/></label>  <%=userBO.getFullName()%>
				     			</div>
				     			<div class="form-group">
				     				<label><spring:message code="user.label.mobile.number"/></label>  <%=userBO.getMobileNumber() %>
				     			</div>
				     			<div class="form-group">
				     				<label><spring:message code="user.label.emailId"/></label>  <%=userBO.getEmailId() %>
				     			</div>
				     			<div class="form-group">
				     				<label class="required">Title/Designation</label>
				     				<input type="text" class="form-control" name="designation" id="designation" value="<%=teamMemberBO.getDesignationTitle() != null ?teamMemberBO.getDesignationTitle(): ""%>" required="required">
				     			</div>
				     			<div class="form-group">
				     				<label class="required">Manager</label>
				     				<select  class="form-control" id="managerUserID" name="managerUserID" required="required">
				     					<c:forEach items="${managerUserList}" var="managerUser">
				     						<option value="${managerUser.userId}">${managerUser.fullName}</option>
				     					</c:forEach>
				     				</select>			     				
				     			</div>
				     			</div>
	              				<button type="submit" name="saveTeamMemberDetails" class="btn btn-primary">Save</button>              				
	              		</div>              		  
	              	</div> <!-- .End of /.box-body -->
	      </form>
<%if(teamMemberBO.getTeamMemberId()!=null) { // if search mode then not show this%>
	 </div> 
 	  <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
 </div>
</div>
<%} // end of  if search mode then not show this%>
<%
} // main if
else
{
%>
	<div class="box-body">
		<div class="callout callout-danger">
		  <h4> No User Found. </h4>
		 </div>
	</div>
<%
}
%>
