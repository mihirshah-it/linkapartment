<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.user.bo.UserPropertyBO"%>
<%@page import="app.societywala.society.bo.PropertyOwnershipTypeBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
 UserPropertyBO userPropertyBO = (UserPropertyBO)request.getAttribute("userPropertyBO");
 UserBO userBO = userPropertyBO.getUserBO();
 List<PropertyOwnershipTypeBO> ownershipTypeBOList = (List<PropertyOwnershipTypeBO>)request.getAttribute("ownershipTypeBOList");
if(userBO != null)
{
	
	String userProfileImageThumb = ctxPath+"/images/common/en_US/avatar120x120.jpg";
	if(userBO.getProfileImageFileName() != null)
	 {
		 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
		 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.USER_ENTITY) +"/" +userBO.getUserId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_USER_PROFILE_MODULE);
		 userProfileImageThumb = finalAttachementDirectoryLocation + "/" + userBO.getProfileImageFileName();
	 }
%>

<form role="form" id="userPropertyForm">
	<input type="hidden" name="userId" id="userId" value="<%=userBO.getUserId()%>">
	<% if(userPropertyBO.getUserPropertyId() != null) {%>
   	<input type="hidden" name="userPropertyId" id="userPropertyId" value="<%=userPropertyBO.getUserPropertyId()%>">
   	<% } %>
   			<div class="infoDiv">User Details</div>
			<div class="box box-body">
				<div class="form-group">
					<div class="col-md-4">
		     		<%if(userBO.getProfileImageFileName() != null)
					{%>
						<img alt="" src="<%=userProfileImageThumb%>" class="profile-user-img img-responsive img-circle">
					<%
					}else{
					%>
						<img alt="" src="<%=userProfileImageThumb%>" class="profile-user-img img-responsive img-circle">
					<%
					}
					%> 
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
		     			<label class="required"><spring:message code="societ.property.user.label.ownership"/></label>
		     			<select name="userOwnershipType" id="userOwnershipType" class="form-control" required>
		     				<option value="">select</option>
			                 <c:forEach items="${ownershipTypeBOList}" var="ownershipTypeBO">
			                   <%
			                     String selected = "";                    
			                   %>
			                   <c:if test="${ownershipTypeBO.ownershipTypeId == userPropertyBO.propertyOwnerTypeBO.ownershipTypeId}">
			                   <%
			                      selected = "selected";
			                   %>
			                   </c:if>                    
			        		    <option value="${ownershipTypeBO.ownershipTypeId}" <%=selected%>>
			        		           ${ownershipTypeBO.ownershipTypeName}
			        		    </option>
			        		 </c:forEach>	
           				</select>
           				</div>     		
		     		</div>
		     		
		     		<input type="submit" class="btn btn-primary" value="<spring:message code="societ.property.user.btn.adduser"/>"/>
		     		
		         </div>
			</div>		
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


