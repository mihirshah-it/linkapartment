<%@page import="java.util.Map"%>
<%@page import="app.societywala.bill.bo.PropertyBillType"%>
<%@page import="app.societywala.bill.bo.BillTemplateBO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Bill Templates</TITLE>
	<!-- CSS Files -->
</HEAD>

<%
String mainMenu = "manageBills";
String subMenu = "templateDetails";
String wizard   = "templateDetail";
String formSubmitAction=ctxPath+"/bill/saveSocietyBillTemplateDetails.htm";
List<BillTemplateBO> societyBillTemplateList = (List<BillTemplateBO>)request.getAttribute("societyBillTemplateList");
Integer memberBillType = (Integer)request.getAttribute("memberBillType");
if(memberBillType.equals(PropertyBillType.SUPPLEMENTARY_BILL))
{
	subMenu = "supTemplateDetails";
}
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <%if(memberBillType.equals(PropertyBillType.MAINTAINANCE_BILL)) {%>
			<h1><spring:message code="bill.templates.form.header"/></h1>
			<%}else if(memberBillType.equals(PropertyBillType.SUPPLEMENTARY_BILL)) { %>
			<h1><spring:message code="supplementary.bill.templates.form.header"/></h1>
			<%} %>
	      <hsCommonTag:breadCrumb pageTitle="Bill Templates" isFirstIndex="true"/> 
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form class="form" method="post" action="<%=formSubmitAction%>" id="billTemplateForm" name="billTemplateForm" role="form">
    					<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
				    	<div class="box-header with-border">    		
				    		<button class="col-md-2 btn btn-primary margin" onclick="javascript:addNewTemplate();"><spring:message code="bill.button.add.template"/></button>    		
				    	</div>
				    	<%} %>
    					<div class="box-body">
							<input type="hidden" name="billTemplateCounter" id="billTemplateCounter" value="<%=societyBillTemplateList.size()%>"/>
							<input type="hidden" name="memberBillType" id="memberBillType" value="<%=memberBillType%>"/>
				    		<div id="appendTemplateDiv">
				    			<div id="tableHeaderDiv" class="row margin">
									<div class="col-md-4"><label class="required"><spring:message code="bill.label.template.name"/></label></div>
									<div class="col-md-5"><label class="required"><spring:message code="bill.label.template.description"/></label></div>
									<div class="col-md-3"></div>
								</div>
								<c:forEach items="${societyBillTemplateList}" var="billTemplateBO" varStatus="counter">
							    <div id="innerDiv${counter.count}" class="row margin">	
							     	<div class="col-md-4"><input type="text" class="form-control" name="templateName${counter.count}" id="template${counter.count}" value="${billTemplateBO.templateName}" required/></div>
							     	<div class="col-md-5"><textarea class="form-control" name="templateDescription${counter.count}" id="templateDescription${counter.count}" required>${billTemplateBO.templateDescription}</textarea></div>
							    	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE))
					             	{%>
							    	<div class="col-md-3"><input type="button" class="btn btn-danger" onclick="javascript:deletePersistanceTemplate('${counter.count}' , '${billTemplateBO.billTemplateId}');" value="<spring:message code="common.button.delete"/>"/></div>
							    	<%} %>
							    	<input type="hidden" name="templateId${counter.count}" id="templateId${counter.count}" value="${billTemplateBO.billTemplateId}"/>
						           	<input type="hidden" name="templateStatus${counter.count}" id="templateStatus${counter.count}" value="update"/>
								 </div>
								</c:forEach>    			
				    		</div>
				    								
    				</div>
    				<div class="box-footer">
		                  	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
               				<button type="submit" class="btn btn-primary" ><spring:message code="common.button.saveAndContinue"/></button>
               				<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
               				<button type="submit" class="btn btn-primary" ><spring:message code="common.button.Update"/></button>
               				<% } %>	
              		</div>
             	</form>
             	</div>   				
    	</div> <!--  End of col 1 -->
    	
      </div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->

</body>
<!-- JS Files -->
<script src="<%=jsRoot%>/bill/manageAllBillTemplates.js?${Server_Token_Value}" type="text/javascript"></script>
</html>