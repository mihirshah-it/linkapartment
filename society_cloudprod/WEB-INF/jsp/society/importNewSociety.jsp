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
	<TITLE><spring:message code="common.title.label.product"/> :: Import Society Details</TITLE>
</HEAD>

<%
String mainMenu = "manageSociety";
String subMenu = "";
String wizard   = "societyDetail";

String formSubmitAction=ctxPath+"/society/saveSocietyDetails.htm";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);

SocietyBO societyBO = (SocietyBO)request.getAttribute("societyBO");
%>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1>Import Society Details</h1>
		  <hsCommonTag:breadCrumb pageTitle="Import Society Details" isFirstIndex="true" isSocietyNameDisplay="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
						<div class="box-header with-border">
							<button type="button" onclick="javascript:showFileUploadPopupForImportData();" class="btn btn-primary">Import Society</button>
							<button type="button" onclick="javascript:popupOfNoOfRecordsToUploadFileForDataImport();" class="btn btn-default">Download Template</button>
						</div>
						<div class="box-body">
							<table id="importFilesStatsGridDiv"><!-- This will be populated by Ajax --></table>
						</div>
						<div class="box-footer">
						</div>
    				</div>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
</body>



<div class="modal fade" id="attachementPopupForm" tabindex="-1" role="dialog" aria-labelledby="Society Import">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="attachementPopupFormInfo">Society Import</h4>
      </div>
      <div class="modal-body">
        	<div class="box box-body">
        		<div id="attachmentListDiv"></div>
        	</div>
       </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" name="attachementSaveBtn" id="attachementSaveBtn" onclick="javascript:processSocietyImport();" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
	  </div>
    </div>
    </div> 
</div>

<div class="modal fade" id="popupNoOfRecordsImportForm" tabindex="-1" role="dialog" aria-labelledby="Download Template">
	<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Download Template :</h4>
      	</div>
      	<div class="modal-body">
      		<div class="box box-body">
      			<div class="form-group">
			  	 		<label class="control-label required" for="countryId">Country Name :</label>
	                  	<select id="countryId" class="form-control" required>
							<c:forEach items="${countryBOList}" var="countryBO">
							<option value="${countryBO.countryId}">${countryBO.countryName}</option>
							</c:forEach>
						</select>
	             </div>
	             <div class="form-group">
			  	 		<label class="control-label required" for="stateId">State Name : </label>
			  	 		<input type="hidden" name="stateId" id="stateId"/>
						<input type="text" class="form-control" id="stateName" name="stateName" required>
	             </div>
      			<div class="form-group">
			  	 		<label class="control-label required" for="noOfRec">Provide No. Of Record Want to Upload :</label>
	                  	<input type="number" class="form-control" id="noOfRec" name="noOfRec" required/>
	             </div>
      		</div>
      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	<button type="button" onclick="javascript:downloadSocietyImportTemplate();" class="btn btn-primary">Download Template</button>
	  	</div>
	 </div>
	 </div>
</div>
<!-- JS Files -->  
<script>
	var jsIndiaCountryId = '<%=CommonConstant.INDIA_COUNTRY_ID%>';	
	var attachementEntityTypeId = '<%=AttachementConstatnt.CONSULATANT_ENTITY%>';
	var attachementEntityId = '<%=AttachementConstatnt.CONSULTANT_SOCIETY_IMPORT_ENTITY_ID%>';
	var attachementModuleTypeId='<%=AttachementConstatnt.SOCIETY_IMPORT_MODULE%>';
	var attachementModuleId='<%=userId%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/society/importNewSociety.js?${Server_Token_Value}"></script>
<script src="<%=jsRoot%>/common/attachmentUpload.js?${Server_Token_Value}" type="text/javascript"></script>
</html>