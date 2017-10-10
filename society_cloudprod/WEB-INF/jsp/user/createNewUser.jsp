<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.user.bo.UserMaritalStatus"%>
<%@page import="app.societywala.user.bo.UserBloodGroupType"%>
<%@page import="app.societywala.user.bo.UserGenderType"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/></TITLE>
 </HEAD>

<%
String mainMenu = "";
String subMenu = "";
String formSubmitAction=ctxPath+"/user/saveUserDetails.htm";
Boolean isUserCreateFlow  = false;
if(session.getAttribute(CommonConstant.SESSION_IS_USER_CREATE_FLOW) != null)
{
	isUserCreateFlow = (Boolean)session.getAttribute(CommonConstant.SESSION_IS_USER_CREATE_FLOW);
}
UserBO userBO = (UserBO)request.getAttribute("userBO");
Boolean isAdminEdit = (Boolean)request.getAttribute("isAdminEdit");
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  
  <%if(isUserCreateFlow) {%>
  	<%@include file="../common/emptyHeader.jsp"%>  	
  <%}else{ %>
	<%@include file="../common/header.jsp"%>
  	<%@include file="../common/leftSideMenu.jsp"%>
  <%} %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    	<section class="content-header">
    	<%if(isUserCreateFlow) {%>
    	<h1>
       		<spring:message code="user.register.form.header"/>
      	</h1>
    	<%} else {%>
		<h1>Update Details</h1>
		 <hsCommonTag:breadCrumb pageTitle="User Profile" isFirstIndex="false" isSocietyNameDisplay="false"/>
		<%} %>
		</section> <!-- End of content header -->
		
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-12">
			  		<%
					{
			  			String tmpUserProfileImageThumb = ctxPath+"/images/common/en_US/avatar120x120.jpg";
			  			if(sessionUserBO != null && sessionUserBO.getProfileImageFileName() != null)
			  			    {
			  					 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
			  					 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.USER_ENTITY) +"/" +sessionUserBO.getUserId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_USER_PROFILE_MODULE);
			  					 tmpUserProfileImageThumb = finalAttachementDirectoryLocation + "/" + sessionUserBO.getProfileImageFileName();
			  				}
			  		
		  			%> 
			  		<!-- left column -->
	        		<div class="col-md-3">
	        			<div class="box">
            				<div class="box-body box-profile">
              					<img class="col-md-12 profile-user-img img-responsive img-circle" src="<%=tmpUserProfileImageThumb%>" alt="User profile picture">
              					<% if(!isUserCreateFlow && !isAdminEdit) {%>
              					<a class="col-md-12 text-center" href="javascript:getImageUploadCropPage('userProfileImageCropPopupForm' , 'userCropImageDiv' , '<%=AttachementConstatnt.USER_ENTITY %>' , '<%=userBO.getUserId()%>' ,'<%=AttachementConstatnt.IMG_USER_PROFILE_MODULE%>','<%=userBO.getUserId()%>');">Edit Image</a>
              					<%} %>
              				</div>              				
	        			</div> <!-- .End of /.box-body -->
	        		</div>
	        		<%}%>
	        		<div class="col-md-9">
	        			<div class="box box-primary box-body">
	        				<form:form method="post" action="<%=formSubmitAction%>" commandName="userBO" role="form" id="userForm">
	        					<form:hidden path="userId"/>
	        					<input type="hidden" name="isAdminEdit" id="isAdminEdit" value="<%=isAdminEdit%>">
								<form:hidden path="localeLanguageCode"/>
								<c:if test="${isAdminEdit ne true}">
									<form:hidden path="userLoginType"/>
								</c:if>		
								
								<c:if test="${isAdminEdit eq true}">
								<div class="form-group">
	        					  <form:label cssClass="required" path="userLoginType">User Type</form:label>
				                  <form:select path="userLoginType" cssClass="form-control" required="required">
									<form:option value="<%=UserRoleType.MASTER_ADMIN %>">Admin</form:option>
									<form:option value="<%=UserRoleType.CONSULTANT %>">Consultant</form:option>
									<form:option value="<%=UserRoleType.DATA_ENTRY_OPERATOR %>">Data Entry Operator</form:option>
									<form:option value="<%=UserRoleType.NORMAL_USER%>">Normal User</form:option>
								   </form:select>                 
				                </div>
								</c:if>
								
								<div class="form-group">
	        					  <form:label path="nameTitle">Title</form:label>
				                  <form:input cssClass="form-control" path="nameTitle" htmlEscape="true"/>		                  
				                </div>
				                
				                <div class="form-group">
	        					  <form:label cssClass="required" path="firstName">First Name</form:label>
				                  <form:input cssClass="form-control" path="firstName" htmlEscape="true" required="required"/>		                  
				                </div>
				                
				                <div class="form-group">
	        					  <form:label path="middleName">Middle Name</form:label>
				                  <form:input cssClass="form-control" path="middleName" htmlEscape="true"/>		                  
				                </div>
				                
				                <div class="form-group">
	        					  <form:label cssClass="required" path="familyName">Family Name</form:label>
				                  <form:input cssClass="form-control" path="familyName" htmlEscape="true" required="required"/>		                  
				                </div>
				                
				                <div class="form-group">
	        					  <form:label cssClass="required" path="fullName">Full Name</form:label>
				                  <form:input cssClass="form-control" path="fullName" htmlEscape="true" required="required"/>		                  
				                </div>
				                
				                <div class="form-group">
	        					  <form:label cssClass="requiredany" path="mobileNumber"><spring:message code="user.label.mobile.number"/></form:label>
				                  <% if(!isAdminEdit) { %>
				                  <form:input cssClass="form-control userId-group" path="mobileNumber" htmlEscape="true" number="number"/>	
				                  <%} else { %>
				                  <form:input cssClass="form-control" path="mobileNumber" readonly="readonly"/>
				                  <%} %>	                  
				                </div>
				                
				                <div class="form-group">
	        					  <form:label cssClass="requiredany" path="emailId"><spring:message code="user.label.emailId"/></form:label>
	        					  <% if(!isAdminEdit) { %>
				                  <form:input cssClass="form-control userId-group" path="emailId" htmlEscape="true" email="email"/>
				                  <%} else { %>
				                  <form:input cssClass="form-control" path="emailId" readonly="readonly"/>		       
				                  <%} %>		                  
				                </div>
				                <% if (isUserCreateFlow && !isAdminEdit) {%>
				                <div class="form-group">
	        					  <form:label cssClass="required" path="password"><spring:message code="user.label.password"/></form:label>
				                  <form:password cssClass="form-control" path="password" htmlEscape="true" required="required"/>		                  
				                </div>
				                <div class="form-group">
	        					  <label class="required" for="confirmPassword"><spring:message code="user.label.confirm.password"/></label>
				                  <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required/>		                  
				                </div>
								<%} %>
								
								<div class="form-group">
	        					  <form:label path="birthDate" class="required"><spring:message code="user.label.birthdate"/></form:label>
	        					  <div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="birthDate" dateFormat="dateFormat" required="required"/>
				                  </div>			                  											                  	                  
			                 	</div>
			                 	
			                 	<div class="form-group">
	        					  <form:label path="occupation">Occupation</form:label>
				                  <form:input cssClass="form-control" path="occupation" htmlEscape="true"/>		                  
				                </div>
				                
				                <div class="form-group">
	        					  <form:label cssClass="required" path="genderType"><spring:message code="user.label.gender"/></form:label>
				                  <form:select path="genderType" cssClass="form-control" required="required">
									<form:option value="${null}"></form:option>
									<form:option value="<%=UserGenderType.MALE_GENDER%>">Male</form:option>
									<form:option value="<%=UserGenderType.FEMALE_GENDER%>">FeMale</form:option>
								   </form:select>                 
				                </div>
				                
				                <div class="form-group">
	        					  <form:label path="bloodGroupType"><spring:message code="user.label.blood.group"/></form:label>
				                  <form:select path="bloodGroupType" cssClass="form-control">
									<form:option value="${null}"></form:option>
									<form:option value="<%=UserBloodGroupType.O_PLUS%>">O+</form:option>
									<form:option value="<%=UserBloodGroupType.A_PLUS%>">A+</form:option>
									<form:option value="<%=UserBloodGroupType.B_PLUS%>">B+</form:option>
									<form:option value="<%=UserBloodGroupType.AB_PLUS%>">AB+</form:option>
									<form:option value="<%=UserBloodGroupType.O_MINUS%>">O-</form:option>
									<form:option value="<%=UserBloodGroupType.A_MINUS%>">A-</form:option>
									<form:option value="<%=UserBloodGroupType.B_MINUS%>">B-</form:option>
									<form:option value="<%=UserBloodGroupType.AB_MINUS%>">AB-</form:option>
								   </form:select>                 
				                </div>
				                
				                <div class="form-group">
	        					  <form:label path="maritalStatus"><spring:message code="user.label.marital.status"/></form:label>
				                  <form:select path="maritalStatus" cssClass="form-control" onchange="javascript:showHideAnnivarsaryDate();">
									<form:option value="${null}"></form:option>
									<form:option value="<%=UserMaritalStatus.SINGLE%>">Single</form:option>
									<form:option value="<%=UserMaritalStatus.ENGAGED%>">Engaged</form:option>
									<form:option value="<%=UserMaritalStatus.MARRIED%>">Married</form:option>
									<form:option value="<%=UserMaritalStatus.SEPARATED%>">Separated</form:option>
									<form:option value="<%=UserMaritalStatus.WIDOWED%>">Widowed</form:option>
									<form:option value="<%=UserMaritalStatus.DIVORCED%>">Divorced</form:option>
								   </form:select>                 
				                </div>
				                
				                <div class="form-group" id="anniversaryDateDiv" style="display: none;">
	        					  <form:label path="anniversaryDate"><spring:message code="user.label.anniversary.date"/></form:label>
	        					  <div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="anniversaryDate" dateFormat="dateFormat"/>
				                  </div>	        					  		                  
				                </div>
				                
				                <div class="box-footer">
			                  		<button type="submit" class="btn btn-primary" ><spring:message code="common.button.save"/></button>
                				</div>
			                 	
	        				</form:form>
	        			</div>
	        		</div>
        		</div> <!-- left column end -->
        		
        	</div>
		</section> <!-- ./ENd of Main Content -->
  </div> <!-- ENd of content wrapper -->
  
  <%@include file="../common/footer.jsp"%>
  <%if(!isUserCreateFlow) {%>
  	<%@include file="../common/rightSideMenu.jsp"%>
  <%} %>
  
</div> <!-- ./ENd of weapper -->

<%if(!isUserCreateFlow) {%>
<div class="modal fade" id="userProfileImageCropPopupForm" tabindex="-1" role="dialog" aria-labelledby="User Image">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	User Profile Image        		
        </h4>
      </div>
      <div class="modal-body">
        	<div class="box box-body">
        		<div id="userCropImageDiv"></div>
        	</div>
       </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" name="userCropImageSaveBtn" id="userCropImageSaveBtn" onclick="saveUserProfileCropImage();" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
	  </div>
    </div>
    </div> 
</div>
<%} %>

</body>
<!-- JS Files -->  
<script>
	var jMarriedMaritalStatusId = '<%=UserMaritalStatus.MARRIED%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/user/createNewUser.js?${Server_Token_Value}"></script>
<script>
	showHideDiv();
</script>
</html>