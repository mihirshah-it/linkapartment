<%@page import="app.societywala.advertise.bo.PageCode"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@include file="../common/appConfig.jsp" %>
<%
	pageCode = PageCode.MANAGE_SOCIETY;
%>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Society Details</TITLE>	
</HEAD>

<%
String mainMenu = "manageSociety";
String subMenu = "societyDetails";
String wizard   = "societyDetail";

String formSubmitAction=ctxPath+"/society/saveSocietyDetails.htm";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
SocietyBO societyBO = (SocietyBO)request.getAttribute("societyBO");
if(pageRenderMode.equals(CommonConstant.CREATE_MODE))
{
	subMenu = "createSocietyDetail";
}
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  	
  	<!-- Content Header (Page header) -->
    <section class="content-header">
      <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
      <h1>
       		<spring:message code="society.form.header"/>
      </h1>
      <%}  else if (pageRenderMode.equals(CommonConstant.EDIT_MODE))  {%>
      <h1>
       		<spring:message code="society.form.header.label.update.society"/>
      </h1>
      <%} else if (pageRenderMode.equals(CommonConstant.VIEW_MODE))  {%>
      <h1>
       		<spring:message code="society.form.header.label.view.society"/>
      </h1>
      <%} %>
      <!-- Start Code for Bread crumb -->
	  <hsCommonTag:breadCrumb pageTitle="Society Details" isFirstIndex="false" isSocietyNameDisplay="false"/>
	 
    </section>

    <!-- Main content -->
    <section class="content">
		  <div class="row">
		  	<!-- left column -->
        		<div class="col-md-12">
        			
        			<%
        				String societyProfileImageThumb = ctxPath+"/images/common/en_US/buildingImg.jpg";
        			 	if(societyBO.getProfileImageFileName() != null)
        			 	{
        					 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
        				 	String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.SOCIETY_ENTITY) +"/" +societyBO.getSocietyId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_SOCIETY_PROFILE_MODULE);
        				 	societyProfileImageThumb = finalAttachementDirectoryLocation + "/" + societyBO.getProfileImageFileName();
        			 	}
			  		
		  			%> 
			  		<!-- left column -->
	        		<div class="col-md-3">
	        			<div class="box">
            				<div class="box-body">
              					<img class="col-md-12 img-responsive" src="<%=societyProfileImageThumb%>" alt="Society profile picture">
              					<%if(pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
              					<a class="col-md-12 text-center" href="javascript:getImageUploadCropPage('imageCropPopupForm', 'attachmentUploadDiv' , '<%=AttachementConstatnt.SOCIETY_ENTITY %>' , '<%=societyBO.getSocietyId()%>' ,'<%=AttachementConstatnt.IMG_SOCIETY_PROFILE_MODULE%>','<%=societyBO.getSocietyId()%>');">Edit Image</a>
              					<%} %>
              				</div>              				
	        			</div> <!-- .End of /.box-body -->
	        		</div>
	        		       			
        			<div class="col-md-9">
        			<div class="box box-primary box-body">
        			<form:form cssClass="form" method="post" action="<%=formSubmitAction%>" commandName="societyBO" role="form" id="societyForm">
        					<form:hidden path="societyId"/>
        					<div class="form-group">
        					  <form:label cssClass="required" path="societyName"><spring:message code="society.label.name"/></form:label>
			                  <form:input cssClass="form-control" path="societyName" htmlEscape="true" placeholder="Enter Society Name" required="required"/>		                  
			                </div>
			                
			                <div class="form-group">
        					  <form:label path="societyDescription"><spring:message code="society.label.description"/></form:label>
			                  <form:input cssClass="form-control" path="societyDescription" htmlEscape="true" placeholder="Enter Short Description"/>			                  
			                </div>
			                
			                <div class="form-group">
        					  <form:label cssClass="required" path="countryBO"><spring:message code="society.label.country"/></form:label>
			                  <form:select path="countryBO" cssClass="form-control" required="required">
								<form:options items="${countryBOList}" itemValue="countryId" itemLabel="countryName" />
								</form:select>	                  
			                </div>
			                
			                 <div class="form-group">
        					  <form:label cssClass="required" path="stateBO"><spring:message code="society.label.state"/></form:label>
			                  <form:hidden  path="stateBO.stateId" htmlEscape="true"/>
							  <form:input cssClass="form-control" path="stateBO.stateName" required="required"/>											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label cssClass="required" path="cityBO"><spring:message code="society.label.city"/></form:label>
			                  <form:hidden  path="cityBO.cityId" htmlEscape="true"/>
							  <form:input cssClass="form-control" path="cityBO.cityName" required="required"/>											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label cssClass="required" path="location"><spring:message code="society.label.location"/></form:label>
			                  <form:input cssClass="form-control" path="location" htmlEscape="true" required="required"/>											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label cssClass="required" path="street"><spring:message code="society.label.street"/></form:label>
			                  <form:input cssClass="form-control" path="street" htmlEscape="true" required="required"/>											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label path="landmark"><spring:message code="society.label.landmark"/></form:label>
			                  <form:input cssClass="form-control" path="landmark" htmlEscape="true"/>											                  	                  
			                 </div>
			                 
			                  <div class="form-group">
        					  <form:label cssClass="required" path="pinCode"><spring:message code="society.label.pincode"/></form:label>
			                  <form:input cssClass="form-control" path="pinCode" htmlEscape="true" required="required"/>											                  	                  
			                 </div>
			                 
			                 <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {
										Integer todayFiscalYear = CommonUtilImpl.returnFiscalYear(configTodayDate);
							 %>
			                 
			                 <div class="form-group">
        					  <form:label cssClass="required" path="currentAccountFiscalYear">Starts from Fiscal Year</form:label>
			                  <form:select  path="currentAccountFiscalYear" cssClass="form-control" required="required">
			                  	<%for(int i=todayFiscalYear;i>=(todayFiscalYear-5);i--)	{%>
									<form:option value="<%=i%>"><%=CommonUtilImpl.getDisplayFormatFiscalYear(i)%></form:option>
								<%}%>
			                  </form:select>									                  	                  
			                 </div>
			                 <%} %>
			                 
			                 <div class="form-group">
        					  <form:label path="registrationNumber"><spring:message code="society.label.registrationNumber"/></form:label>
			                  <form:input cssClass="form-control" path="registrationNumber" htmlEscape="true"/>											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label path="registrationDate"><spring:message code="society.label.registrationDate"/></form:label>
        					  <div class="input-group date">
			                  <div class="input-group-addon">
			                    <i class="fa fa-calendar"></i>
			                  </div>
			                  <form:input cssClass="form-control pull-right datepicker" path="registrationDate" dateFormat="dateFormat"/>
			                  </div>			                  											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label path="ctsNumber">CTS No#</form:label>
			                  <form:input cssClass="form-control" path="ctsNumber" htmlEscape="true"/>											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label path="servayNumber">Survay No#</form:label>
			                  <form:input cssClass="form-control" path="servayNumber" htmlEscape="true"/>											                  	                  
			                 </div>
			                 
			                  <div class="form-group">
        					  <form:label path="hissaNumber">Hissa No#</form:label>
			                  <form:input cssClass="form-control" path="hissaNumber" htmlEscape="true"/>											                  	                  
			                 </div>
			                 
			                  <div class="form-group">
        					  <form:label path="totalShareCapitalAllocated"><spring:message code="society.label.totalShareCapitalAllocated"/></form:label>
			                  <form:input cssClass="form-control" path="totalShareCapitalAllocated" htmlEscape="true" number="number"/>											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label path="gstNumber">GST No#</form:label>
			                  <form:input cssClass="form-control" path="gstNumber" htmlEscape="true"/>											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label path="panNumber">PAN No#</form:label>
			                  <form:input cssClass="form-control" path="panNumber" htmlEscape="true"/>											                  	                  
			                 </div>
			                 
			                 <div class="form-group">
        					  <form:label path="tanNumber">TAN No#</form:label>
			                  <form:input cssClass="form-control" path="tanNumber" htmlEscape="true"/>											                  	                  
			                 </div>
			                 
			                  <div class="box-footer">
			                  	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
                				<button type="submit" class="btn btn-primary" ><spring:message code="common.button.saveAndContinue"/></button>
                				<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
                				<button type="submit" class="btn btn-primary" ><spring:message code="common.button.Update"/></button>
                				<% } %>	
              				 </div>
        			</form:form>
        			</div>
        			</div> <!--  End of col-9 -->
        		</div> <!-- ./End of col 1 -->
        		
		  </div>
	</section>
</div>
 <!-- /.content-wrapper --> 
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%>
 
</div>

<%if(pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
<div class="modal fade" id="imageCropPopupForm" tabindex="-1" role="dialog" aria-labelledby="Society Image">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	User Society Image        		
        </h4>
      </div>
      <div class="modal-body">
        	<div class="box box-body">
        		<div id="attachmentUploadDiv"></div>
        	</div>
       </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" name="cropImageSaveBtn" id="cropImageSaveBtn" onclick="saveSocietyProfileCropImage();" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
	  </div>
    </div>
    </div> 
</div>
<%} %>

</body>
<!-- JS Files -->  
<script type="text/javascript" src="<%=jsRoot%>/society/manageSocietyDashboard.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/society/createNewSociety.js?${Server_Token_Value}"></script>

</html>