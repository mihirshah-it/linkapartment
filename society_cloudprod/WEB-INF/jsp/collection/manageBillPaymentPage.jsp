<%@page import="app.societywala.bill.bo.PropertyBillType"%>
<%@page import="app.societywala.importexport.bo.ImportExportEntityType"%>
<%@page import="app.societywala.account.bo.JournalEntryDetailsType"%>
<%@page import="app.societywala.account.bo.JournalEntityType"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Add Member Receipt</TITLE>
   <style type="text/css">
   .modal .modal-dialog { width: 90%; }
   </style>
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "billPayment";
Date lastBillGeneratedDate = (Date)request.getAttribute("lastBillGeneratedDate");
Date lastBillGenerationforPeriod = (Date)request.getAttribute("lastBillGenerationforPeriod");
SimpleDateFormat monthYearFormat = new SimpleDateFormat(CommonConstant.monthYearUIFormatter);
SimpleDateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
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
		  <h1>
	       		Member Bill and Receipts 
	      </h1>
		  <hsCommonTag:breadCrumb pageTitle="Member Receipt" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form class="form" id="showSocietBillsForm">
							<input type="hidden" id="societyPropertyBillId" name="societyPropertyBillId">
						</form>
						<div class="box-header with-border">
							<!--  <input type="hidden" id="period" name="period" value="${lastBillGenerationforPeriod}"/> -->
							<c:if test="${lastBillGeneratedDate != null}">
									<div>
								     <b><spring:message code="society.property.bill.payment.last.bill.generated.info" arguments="<%=dateFormat.format(lastBillGeneratedDate)+\",\"+monthYearFormat.format(lastBillGenerationforPeriod)%>"/></b>
								    </div> 
							</c:if>
							
							<div class="col-md-4">
								<label class="control-label"><spring:message code="bill.showBill.label.selectFiscalYear"/></label>
								<select class="form-control" id="periodYear" onchange="javascript:loadBillPeriodMonthByYear();">
									<c:forEach items="${generatedBillPeriodYearList}" var="periodYear" varStatus="counter">
										<option value="${periodYear}"><%=CommonUtilImpl.getDisplayFormatFiscalYear((Integer)pageContext.getAttribute("periodYear"))%></option>
									</c:forEach>
								</select>								
							</div>
							
							<div class="col-md-4">
								<label class="control-label">Bill Type</label>
								<select class="form-control" id="billType" name="billType" onchange="javascript:loadBillPeriodMonthByYear();">
									<option value="<%=PropertyBillType.MAINTAINANCE_BILL%>"><%=PropertyBillType.returnPropertyBillTypeName(PropertyBillType.MAINTAINANCE_BILL)%></option>
									<option value="<%=PropertyBillType.SUPPLEMENTARY_BILL%>"><%=PropertyBillType.returnPropertyBillTypeName(PropertyBillType.SUPPLEMENTARY_BILL)%></option>
								</select>
							</div>			
							<div id="monthPeriod" class="col-md-4"></div>
							
						</div>
						<div class="box-body">
							<div>
								<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
									<button class="col-md-3 btn btn-primary margin" onclick="javascript:window.location='<%=ctxPath%>/collection/manageMultipleMemberBillPaymentPage.htm'">Multiple Members Receipt</button>
					    			<button class="col-md-3 btn btn-default margin" onclick="javascript:showFileUploadPopupForImportData();">Import</button>
					    			<button class="col-md-3 btn btn-default margin" onclick="javascript:downloadMemberReceiptImportTemplate();">Download Import Template</button>
								<%} %>							
							</div>
							<table id="societyPropertyBillPaymentGridDiv" class="table table-bordered table-striped table-hover dt-responsive">
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

<div class="modal fade" id="popupBillPaymentForm" tabindex="-1" role="dialog" aria-labelledby="Member Receipt">		
</div>

<div class="modal fade" id="attachementPopupForm" tabindex="-1" role="dialog" aria-labelledby="Upload Member Receipt">
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
        <button type="button" name="attachementSaveBtn" id="attachementSaveBtn" onclick="javascript:processMemberReceiptImport();" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
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
        	<button type="button" onclick="javascript:downloadMemberReceiptImportTemplate();" class="btn btn-primary">Download Template</button>
	  	</div>
	 </div>
	 </div>
</div>

<!-- JS Files -->  
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
  var journalEntityType = '<%=JournalEntityType.BILL_PAYMENT%>';	
  var journalDetailsTypeTO = '<%=JournalEntryDetailsType.TO%>';
  var jsMultipleEntryModePage = 'false';
  
  var attachementEntityTypeId = '<%=AttachementConstatnt.SOCIETY_ENTITY%>';
  var attachementEntityId = '<%=societyId%>';
  var attachementModuleTypeId='<%=AttachementConstatnt.IMPORT_FILE_MODULE%>';
  var attachementModuleId = '<%=ImportExportEntityType.ACCOUNT_MEMBER_RECEIPT_IMPORT%>';
</script>
<script src="<%=jsRoot%>/common/attachmentUpload.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/collection/manageBillPaymentPage.js?${Server_Token_Value}" type="text/javascript"></script>

</body>
</html>