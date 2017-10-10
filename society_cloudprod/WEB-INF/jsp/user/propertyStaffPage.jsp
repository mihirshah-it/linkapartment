<%@page import="app.societywala.user.bo.PropertyStaffStatus"%>
<%@page import="app.societywala.user.bo.UserGenderType"%>
<%@page import="app.societywala.user.bo.PropertyStaffBO"%>
<%@include file="../common/appConfig.jsp" %>
<%@page import="java.util.Map"%>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Property Staff Details</TITLE>
</HEAD>

<%
String mainMenu = "manageSociety";
String subMenu  = "propertyStaff";
String wizard   = "staffDetail";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
PropertyStaffBO propertyStaffBO =(PropertyStaffBO)request.getAttribute("propertyStaffBO");
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<nav class="navbar-static-top">
  	<div id="subNavBar" class="navbar-collapse collapse in">
          <ul class="nav navbar-nav">
             <li>
				<a  href="javascript:;"  onclick="javascript: backURL();"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.back"/></a>
			</li>
			<li>
				<a  href="javascript:;"  onclick="javascript: printStaffIDCard();"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
			</li>
		 </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="user.property.staff.form.label.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Property Staff Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="propertyStaffFormForward" method="post">
						   <input type="hidden" name="propertyStaffId" id="propertyStaffId" value="<%=propertyStaffBO.getPropertyStaffId()%>">
					</form>
    				
    				<!-- Start Code for wizard -->
					<%@ include file="propertyStaffWizard.jsp" %>
					<%if(pageRenderMode.equals(CommonConstant.CREATE_MODE) == false)
					{ 
						String staffProfileImageThumb = ctxPath+"/images/common/en_US/avatar120x120.jpg";
						if(propertyStaffBO.getProfileImageFileName() != null)
						 {
							 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
							 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.SOCIETY_ENTITY) +"/" +propertyStaffBO.getSocietyBO().getSocietyId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_SOCIETY_PROPERTY_STAFF_MODULE);
							 staffProfileImageThumb = finalAttachementDirectoryLocation + "/" + propertyStaffBO.getProfileImageFileName();
						 }
					%>
					<!-- left column -->
	        		<div class="col-md-3">
	        			<div class="box">
            				<div class="box-body box-profile">
              					<img class="col-md-12 profile-user-img img-responsive img-circle" src="<%=staffProfileImageThumb%>" alt="User profile picture">
              					<% if(pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
              					<a class="col-md-12 text-center" href="javaScript:getImageUploadCropPage('staffProfileImageCropPopupForm' , 'staffCropImageDiv' , '<%=AttachementConstatnt.SOCIETY_ENTITY %>' , '<%=propertyStaffBO.getSocietyBO().getSocietyId()%>' ,'<%=AttachementConstatnt.IMG_SOCIETY_PROPERTY_STAFF_MODULE%>','<%=propertyStaffBO.getPropertyStaffId()%>');">Edit Image</a>
              					<% } // End of if Edit mode %>
              				</div>              				
	        			</div> <!-- .End of /.box-body -->
	        		</div>
	        		 <%} // End of if statement%>
					<!-- End Code for wizard -->
					<div class="col-md-9">
    				<div class="box box-primary">    					
					   	<form:form  cssClass="form" method="post" commandName="propertyStaffBO">
					   	<form:hidden path="propertyStaffId"/>
					    <div class="box-header with-border">
							
						</div>
						<div class="box-body">
							<div class="form-group">
								<form:label cssClass="control-label required" path="staffName">
									<spring:message code="user.property.staff.form.label.staffName"></spring:message> 
								</form:label>
								<form:input cssClass="form-control" path="staffName" htmlEscape="true" required="required"/>
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="staffCategoryBO">
									<spring:message code="user.property.staff.form.label.category"></spring:message> 
								</form:label>
								<form:select path="staffCategoryBO" cssClass="form-control" required="required">
									<option value="">Select</option>
									<form:options items="${propertyStaffCategoryBOList}" itemValue="propertyStaffCategoryId" itemLabel="categoryName" />
								</form:select>									
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="genderType">
									<spring:message code="user.property.staff.form.label.gender"></spring:message> 
								</form:label>
								<form:select path="genderType" cssClass="form-control" required="required">
									<option value="">Select</option>
									<form:option value="<%=UserGenderType.FEMALE_GENDER%>"><spring:message code="user.property.staff.form.gender.female"></spring:message></form:option>
									<form:option value="<%=UserGenderType.MALE_GENDER%>"><spring:message code="user.property.staff.form.gender.male"></spring:message></form:option>
								</form:select>										
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="dateOfBirth">
									<spring:message code="user.property.staff.form.label.dateOfBirth"></spring:message> 
								</form:label>
								<div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="dateOfBirth" dateFormat="dateFormat" required="required"/>
				                 </div>			
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="contactNumber">
									<spring:message code="user.property.staff.form.label.contactNumber"></spring:message> 
								</form:label>
								<form:input path="contactNumber" cssClass="form-control" htmlEscape="true" required="required"/>						
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label" path="qualification">
									<spring:message code="user.property.staff.form.label.qualification"></spring:message> 
								</form:label>
								<form:input path="qualification" htmlEscape="true" cssClass="form-control"/>						
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label" path="language">
									<spring:message code="user.property.staff.form.label.language"></spring:message> 
								</form:label>
								<form:input path="language" htmlEscape="true" cssClass="form-control"/>						
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="address">
									<spring:message code="user.property.staff.form.label.address"></spring:message> 
								</form:label>
								<form:textarea path="address" htmlEscape="true" cssClass="form-control" required="required"/>						
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="pinCode">
									<spring:message code="user.property.staff.form.label.pincode"></spring:message> 
								</form:label>
								<form:input path="pinCode" htmlEscape="true" cssClass="form-control" required="required"/>						
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="staffStatus">
									<spring:message code="user.property.staff.form.label.status"></spring:message> 
								</form:label>
								<form:select path="staffStatus" cssClass="form-control" required="required">
									<form:option value="<%=PropertyStaffStatus.ACTIVE%>"><spring:message code="user.property.staff.form.status.val.active"></spring:message></form:option>
									<form:option value="<%=PropertyStaffStatus.TEMP_ACTIVE%>"><spring:message code="user.property.staff.form.status.val.tempActive"></spring:message></form:option>
								</form:select>								
							</div>
							
						</div> <!--  end of body -->
						<div class="box-footer">
							<button type="button" class="btn btn-primary" onclick="savePropertyStaffDetails();"><spring:message code="common.button.save"/></button>
							<button type="button" class="btn btn-primary" onclick="saveAndPrintPropertyStaffDetails();"><spring:message code="common.button.save.and.print"/></button>
						</div>
						</form:form>    					
    				</div>
    				</div>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->



<div class="modal fade" id="staffProfileImageCropPopupForm" tabindex="-1" role="dialog" aria-labelledby="Staff Image">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	Staff Profile Image        		
        </h4>
      </div>
      <div class="modal-body">
        	<div class="box box-body">
        		<div id="staffCropImageDiv"></div>
        	</div>
       </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" name="staffCropImageSaveBtn" id="staffCropImageSaveBtn" onclick="javascript:saveSocietyPropertyStaffProfileCropImage();" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
	  </div>
    </div>
    </div> 
</div>

<script type="text/javascript" src="<%=jsRoot%>/user/propertyStaffPage.js?${Server_Token_Value}" ></script>
<script type="text/javascript" src="<%=jsRoot%>/user/propertyStaffWizard.js?${Server_Token_Value}" ></script>
</body>
<%if(request.getParameter("isSaveAndPrintSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
	<script>
		printStaffIDCard();
	</script>
<% } %>
</html>