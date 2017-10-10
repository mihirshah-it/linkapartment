<%@page import="java.util.Map"%>
<%@page import="app.societywala.bill.bo.BillTemplateBO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Manage Dynamic Bill</TITLE>  
	<!-- CSS Files -->	
</HEAD>

<%
String mainMenu = "manageBills";
String subMenu = "dynamicField";
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
		  <h1><spring:message code="bill.templates.timeSpecificField.form.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Dynamic Bill" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="showDynamicBillFieldForm" method="post">
						 <input type="hidden" id="societyTemplateFiledId" name="societyTemplateFiledId">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
							<button class="btn btn-primary margin" onclick="javascript:createDynamicBillField();">Add Dynamic Bill Field</button>
							<%} %>
						</div>
						<div class="box-body">
							<table id="societyBillTemplateDynamicFieldGridDiv" class="table table-bordered table-striped table-hover dt-responsive">
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
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>
</body>
<script src="<%=jsRoot%>/bill/configureBillTemplateTimeSpecificFieldPage.js?${Server_Token_Value}" type="text/javascript"></script>
</html>