<%@page import="app.societywala.bill.bo.PropertyBillType"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Assign Template</TITLE>  
   <!-- CSS Files -->
</HEAD>

<%
String mainMenu = "manageBills";
String subMenu  = "templateDetails";
String wizard   = "assignTemplate";
String saveAndContinueClickAction=ctxPath+"/bill/saveBillTemplateAssignPage.htm";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
Integer memberBillType = (Integer)request.getAttribute("memberBillType");
if(memberBillType.equals(PropertyBillType.SUPPLEMENTARY_BILL))
{
	subMenu = "supTemplateDetails";
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
		  <h1>
       		<%if(memberBillType.equals(PropertyBillType.MAINTAINANCE_BILL)) {%>
			<h1><spring:message code="bill.templates.form.header"/></h1>
			<%}else if(memberBillType.equals(PropertyBillType.SUPPLEMENTARY_BILL)) { %>
			<h1><spring:message code="supplementary.bill.templates.form.header"/></h1>
			<%} %>
	      </h1>
		  <hsCommonTag:breadCrumb pageTitle="Assign Template" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form id='templateFieldsForm' name='templateFieldsForm'>    					
   					   <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
   					   <div class="box-header with-border">
						  <div class="col-md-3">
						  <label for="templateName" class="control-label"><spring:message code="bill.template.lable.selectTemplate"/></label>
						  </div>
						  <div class="col-md-4">
		                  <select class="form-control" id="templateName" name="templateName" onchange="javascript:showBillFieldsdByTemplateId();">
		                    <c:forEach items="${societyBillTemplateBOList}" var="billTemplateBO" varStatus="counter">
								<option value="${billTemplateBO.billTemplateId}">${billTemplateBO.templateName}</option>
							</c:forEach>
		                  </select>
		                  </div>
		                  <div class="col-md-5">
		                  	<button type="button" class="btn btn-primary" onclick="javascript:assignTemplateToProperty();">Assign To Selected Property</button>
		                  </div>
		                </div>			             
		             	<%} %>
			             <div class="box-body">
				            <table id="allSocietyPropertyGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
				         </div> <!-- End of box body -->
							
						<div class="box-footer">
	                  		<button type="button"  onclick="javascript:window.location='<%=saveAndContinueClickAction%>'" class="btn btn-primary" ><spring:message code="common.button.saveAndFinish"/></button>
              			</div>
						</form>
				</div> <!--  End of Box  -->
	    		    				
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
</body>
<script>
  var jmemberBillType = '<%=memberBillType%>';
</script>
<script src="<%=jsRoot%>/bill/assignBillTemplateToPropertyPage.js?${Server_Token_Value}" type="text/javascript"></script>
</html>