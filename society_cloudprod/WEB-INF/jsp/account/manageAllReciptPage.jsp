<%@page import="app.societywala.importexport.bo.ImportExportEntityType"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Receipt</TITLE> 
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "receipts";
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
  	<nav class="navbar-static-top">
  	<div id="subNavBar" class="navbar-collapse collapse in">
          <ul class="nav navbar-nav">
            <li>
            	<a  href="javascript:;"  onclick="javascript:printSelectedReceiptsDetails();"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.printAll"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="collection.manage.receipt.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Receipt" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="receptFormForward" method="post">
					   <input type="hidden" name="voucherId" id="voucherId">
					</form>
    				<div class="box box-primary">
						<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>	
								<div class="box-header with-border">  		
					    			<button class="col-md-3 btn btn-primary margin" onclick="javascript:createNewReceipt();"><spring:message code="collection.btn.create.receipt"/></button>
					    			<button class="col-md-3 btn btn-default margin" onclick="javascript:showFileUploadPopupForImportData();">Import</button>
					    			<button class="col-md-3 btn btn-default margin" onclick="javascript:popupOfNoOfRecordsToUploadFileForDataImport();">Download Import Template</button>
					            </div>
						<%} %>						
						<div class="box-body">
							<table id="societyReceiptGridDiv" class="table table-bordered table-striped table-hover dt-responsive">
							</table>
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

<div class="modal fade" id="attachementPopupForm" tabindex="-1" role="dialog" aria-labelledby="Upload Receipt">
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
        <button type="button" name="attachementSaveBtn" id="attachementSaveBtn" onclick="javascript:processReceiptImport();" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
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
			  	 		<label class="control-label required" for="noOfRec">Provide No. Of Record Want to Upload :</label>
	                  	<input type="number" class="form-control" id="noOfRec" name="noOfRec" required/>
	             </div>
      		</div>
      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	<button type="button" onclick="javascript:downloadReceiptImportTemplate();" class="btn btn-primary">Download Template</button>
	  	</div>
	 </div>
	 </div>
</div>

<!-- JS Files -->  
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
  var attachementEntityTypeId = '<%=AttachementConstatnt.SOCIETY_ENTITY%>';
  var attachementEntityId = '<%=societyId%>';
  var attachementModuleTypeId='<%=AttachementConstatnt.IMPORT_FILE_MODULE%>';
  var attachementModuleId = '<%=ImportExportEntityType.ACCOUNT_RECEIPT_IMPORT%>';
</script>

<script src="<%=jsRoot%>/common/attachmentUpload.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/account/manageAllReciptPage.js?${Server_Token_Value}" type="text/javascript"></script>

</body>
</html>