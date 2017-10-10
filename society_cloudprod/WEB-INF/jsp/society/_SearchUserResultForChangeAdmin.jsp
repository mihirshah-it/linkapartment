<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.user.bo.UserPropertyBO"%>
<%@page import="app.societywala.society.bo.PropertyOwnershipTypeBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
 UserPropertyBO userPropertyBO = (UserPropertyBO)request.getAttribute("userPropertyBO");
 if(userPropertyBO != null && userPropertyBO.getUserBO() != null)
 {
  UserBO userBO = userPropertyBO.getUserBO();
  String userProfileImageThumb = ctxPath+"/images/common/en_US/avatar120x120.jpg";
  if(userBO.getProfileImageFileName() != null)
	 {
		 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
		 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.USER_ENTITY) +"/" +userBO.getUserId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_USER_PROFILE_MODULE);
		 userProfileImageThumb = finalAttachementDirectoryLocation + "/" + userBO.getProfileImageFileName();
	 }
 %>
 
 <form role="form" id="userBO">
 				<div class="infoDiv">Consultant Details</div>
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
			     			</div>
              				<button type="button" name="searchUser" class="btn btn-primary" onclick="javascript:saveChangeAdmin('<%=userBO.getUserId()%>');"><spring:message code="common.button.change"/></button>              				
              		</div>              		  
              	</div> <!-- .End of /.box-body -->
 </form> 
 
<%
}
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
