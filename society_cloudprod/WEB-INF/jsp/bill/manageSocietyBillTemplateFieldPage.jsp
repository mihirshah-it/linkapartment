<%@page import="app.societywala.bill.bo.PropertyBillType"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.bill.bo.BillTemplateBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Bill Fields</TITLE>
</HEAD>

<%
String mainMenu = "manageBills";
String subMenu  = "templateDetails";
String wizard   = "defineAttribute";
String saveAndContinueClickAction=ctxPath+"/bill/saveBillTemplateField.htm";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
Integer memberBillType = (Integer)request.getAttribute("memberBillType");
if(memberBillType.equals(PropertyBillType.SUPPLEMENTARY_BILL))
{
	subMenu = "supTemplateDetails";
}
List<BillTemplateBO> societyBillTemplateBOList = (List<BillTemplateBO>)request.getAttribute("societyBillTemplateBOList");
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
	       		 <%if(memberBillType.equals(PropertyBillType.MAINTAINANCE_BILL)) {%>
				<h1><spring:message code="bill.templates.form.header"/></h1>
				<%}else if(memberBillType.equals(PropertyBillType.SUPPLEMENTARY_BILL)) { %>
				<h1><spring:message code="supplementary.bill.templates.form.header"/></h1>
				<%} %>
	      </h1>
		  <hsCommonTag:breadCrumb pageTitle="Bill Fields" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form id='templateFieldsForm' name='templateFieldsForm'>
    					<div class="box-header with-border">
							  <div class="col-md-4">
							  <label for="templateName" class="control-label">Template Name</label>
							  </div>
							  <div class="col-md-4">
			                  <select class="form-control" id="templateName" name="templateName" onchange="javascript:showBillFieldsdByTemplateId();">
			                    <c:forEach items="${societyBillTemplateBOList}" var="billTemplateBO" varStatus="counter">
									<option value="${billTemplateBO.billTemplateId}">${billTemplateBO.templateName}</option>
								</c:forEach>
			                  </select>
			                  </div>
			                  <div class="col-md-4">
			                  	<button type="button" class="btn btn-primary" onclick="javascript:addNewField();">Add Field</button>
			                  </div>
			             </div> 
			             <div class="box-body">
				            <!-- /.box -->
					            <div  id="templateBasedBillFieldsGridDetails">
					              <table class="table table-bordered table-striped table-hover dt-responsive dataTable" id='templateFieldTbl'>
					              	<thead>
					              		<tr>
					              			<th><spring:message code="bill.template.field.fieldName.label"/></th>
					              			<th><spring:message code="bill.template.field.multiplyOnArea.label"/></th>
					              			<th>Only For Rent</th>
					              			<th><spring:message code="bill.template.field.amount.label"/></th>
					              			<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
											<th><spring:message code="bill.template.field.action.label"/></th> 
											<%} %>
					              		</tr>
					                </thead>
					                <tbody id="billTemplateFieldsGridDiv">
					                
					                </tbody>
					                <tfoot>
					                	<tr>
					                		<th colspan="3"><spring:message code="bill.template.total"/></th>
					                		<th class="totalAmount"></th>
					                		<th class="WebRupee">Rs.</th>
					                	</tr>
					                </tfoot>
					              </table>
					            </div>
				       </div>
					   <div class="box-footer">
	                  	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
	                  		<button type="button" class="btn btn-primary" onclick="javascript:addNewField();">Add Field</button>
              				<button type="button" onclick="javascript:saveSocietyBillTemplateFields();window.location='<%=saveAndContinueClickAction%>;'" class="btn btn-primary" ><spring:message code="common.button.saveAndContinue"/></button>
              				<%}else if (pageRenderMode.equals(CommonConstant.VIEW_MODE) ) {%>
              				<button type="button" onclick="javascript:window.location='<%=saveAndContinueClickAction%>;'" class="btn btn-default" ><spring:message code="common.button.next"/></button>
              				<% } %>	
            		  </div>
            		</form>
            	</div> <!-- End of Box -->
      	</div> <!--  End of col 1 -->
    	
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
</body>
<!-- JS Files -->  
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
  var jmemberBillType = '<%=memberBillType%>';
</script>
<script src="<%=jsRoot%>/bill/manageSocietyBillTemplateFieldPage.js?${Server_Token_Value}" type="text/javascript"></script>
<%
	if(societyBillTemplateBOList.size() > 0)
		{
				BillTemplateBO billTemplateBO = (BillTemplateBO)societyBillTemplateBOList.get(0);
				Long billTemplateId = billTemplateBO.getBillTemplateId();	
%>
  		<script>
  				showBillFieldsdByTemplateId(<%=billTemplateId%>,'<%=billTemplateBO.getTemplateName()%>');
  		</script>
<%
		}
%>
</html>