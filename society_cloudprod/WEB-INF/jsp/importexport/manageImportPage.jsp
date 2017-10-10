<%@page import="app.societywala.importexport.bo.ImportExportEntityType"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Import</TITLE> 
</HEAD>
<%
String mainMenu = "manageSociety";
String subMenu  = "importData";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
Long societyId=(Long)sessionCommonModelMap.get("societyID");
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
		 <h1>Import Details</h1>
		 <hsCommonTag:breadCrumb pageTitle="Import Details" isFirstIndex="true"/> 
	</section> <!-- ./End of Content Header -->
	
	<!-- Main content -->
    <section class="content">
    	<div class="row">
    		<div class="col-md-12">
    			<div class="box box-primary box-body">
    				<div class="row">						
							  <div class="col-md-4">
							  <div class="form-group">
			                  <label for="importType" class="control-label">Import For</label>
			                  <select class="form-control" id="importType" name="importType">
									<option value="<%=ImportExportEntityType.USER_IMPORT%>">Import User</option>
									<option value="<%=ImportExportEntityType.PROPERTY_IMPORT%>">Import Property/Flat</option>
									<option value="<%=ImportExportEntityType.MEMBERS_IMPORT%>">Import Members</option>
									<option value="<%=ImportExportEntityType.SINKING_FUND_REGISTER_IMPORT%>">Import Sinking Fund Details</option>
									<option value="<%=ImportExportEntityType.INVESTMENT_REGISTER_IMPORT%>">Import Investment Details</option>
							  </select>                 
			                  </div>
			                  </div>
			                  
			                  <div class="col-md-8">
			                  		<button class="col-md-5 btn btn-primary margin" onclick="javascript:showFileUploadPopupForImportData();">Import Data</button>
			                  		<button class="col-md-5 btn btn-default margin" onclick="javascript:popupOfNoOfRecordsToUploadFileForDataImport();">Download Template</button>                  
			                  </div>
			             
					</div>
					<div class="row">
						<table id="importFilesStatsGridDiv"><!-- This will be populated by Ajax --></table>
						<div id="pimportFilesStatsGridDiv"><!-- This will be populated by Ajax --></div>
					</div>
    			</div>
    		</div> <!-- end of Column1 -->
    		
    	</div>
    </section> <!-- ./End of Content -->
	</div>  <!-- /.content-wrapper --> 
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%>
 
</div> <!-- .End of Wrappwe -->

<div class="modal fade" id="attachementPopupForm" tabindex="-1" role="dialog" aria-labelledby="User Image">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="attachementPopupFormInfo">        	    		
        </h4>
      </div>
      <div class="modal-body">
        	<div class="box box-body">
        		<div id="attachmentListDiv"></div>
        	</div>
       </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" name="attachementSaveBtn" id="attachementSaveBtn" onclick="javascript:processUploadFileForDataImport()" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
	  </div>
    </div>
    </div> 
</div>

<div class="modal fade" id="popupNoOfRecordsImportForm" tabindex="-1" role="dialog" aria-labelledby="User Image">
	<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Download Template :</h4>
      	</div>
      	<div class="modal-body">
      		<div class="box box-body">
      			<div class="form-group">
			  	 		<label class="control-label required" for="noOfRec">Provide No. Of Record Want to Upload :</label>
	                  	<input type="number" class="form-control" id="noOfRec" name="noOfRec" required/>
	             </div>
      		</div>
      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	<button type="button" onclick="javascript:downloadTemplateForDataImport()" class="btn btn-primary">Download Template</button>
	  	</div>
	 </div>
	 </div>
</div>

</body>
</html>

<script type="text/javascript">
	var attachementEntityTypeId = '<%=AttachementConstatnt.SOCIETY_ENTITY%>';
	var attachementEntityId = '<%=societyId%>';
	var attachementModuleTypeId='<%=AttachementConstatnt.IMPORT_FILE_MODULE%>'; 
	
	var jsUserImportModule = '<%=ImportExportEntityType.USER_IMPORT%>';
	var jsPropertyImportModule = '<%=ImportExportEntityType.PROPERTY_IMPORT%>';
	var jsMembersImportModule = '<%=ImportExportEntityType.MEMBERS_IMPORT%>';
	var jsSinkingFundImportModule = '<%=ImportExportEntityType.SINKING_FUND_REGISTER_IMPORT%>';
	var jsInvestmentRegisterImportModule = '<%=ImportExportEntityType.INVESTMENT_REGISTER_IMPORT%>';
</script>

<script src="<%=ctxPath%>/jquery/grid/js/i18n/grid.locale-en.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=ctxPath%>/jquery/grid/js/jquery.jqGrid.min.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/importexport/manageImportPage.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/common/attachmentUpload.js?${Server_Token_Value}" type="text/javascript"></script>
</body>

</html>
